import mysql from "mysql2";

const connection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
});

function importPokemon(id) {

    fetch("https://pokeapi.co/api/v2/pokemon/" + id)
        .then(response => response.json())
        .then(pokemon => {

            // TRANSFORM
            const hp = pokemon.stats[0].base_stat;
            const attack = pokemon.stats[1].base_stat;
            const defence = pokemon.stats[2].base_stat;
            const specialAttack = pokemon.stats[3].base_stat;
            const specialDefence = pokemon.stats[4].base_stat;
            const speed = pokemon.stats[5].base_stat;

            const primaryType = pokemon.types[0].type.name;

            let secondaryType = null;

            if (pokemon.types.length > 1) {
                secondaryType = pokemon.types[1].type.name;
            }

            // LOAD
            const sql = `
                INSERT INTO pokemon (
                    pokedex_number, name, hp, attack,
                    defence, special_attack, special_defence,
                    speed, primary_type, secondary_type
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

            const values = [
                pokemon.id,
                pokemon.name,
                hp,
                attack,
                defence,
                specialAttack,
                specialDefence,
                speed,
                primaryType,
                secondaryType
            ];

            connection.query(sql, values, (error, results) => {
                if (error) {
                    console.log(error.message);
                } else {
                    console.log("Inserted:", pokemon.name);
                }
            });
        });
}

// Import Generation 2
for (let id = 152; id <= 251; id++) {
    importPokemon(id);
}