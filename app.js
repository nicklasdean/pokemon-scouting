import express from "express";
import mysql from "mysql2";
import { MongoClient } from "mongodb";

const app = express();
app.use(express.json());

// MongoDB connection
const mongoClient = new MongoClient(process.env.MONGODB_URI);
await mongoClient.connect();
const mongoDB = mongoClient.db(process.env.MONGODB_DATABASE);

// MySQL connection
const mysqlConnection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
});

// Finding a Pokémon by ID
app.get("/pokemon/:id", (req, res) => {
    mysqlConnection.query(
        "SELECT * FROM pokemon WHERE pokedex_number = ?",
        [req.params.id],
        (error, results) => {
            res.json(results);
        }
    );
});

// Existing scouting endpoints
app.get("/scouting/fastest", (req, res) => {
    mysqlConnection.query(
        "SELECT name, speed FROM pokemon ORDER BY speed ASC LIMIT 5",
        (error, results) => {
            res.json(results);
        }
    );
});

app.get("/trainers/:id/pokemon", (req, res) => {
    const sql = `
        SELECT p.name, p.primary_type, p.secondary_type
        FROM trainer t
        JOIN trainer_pokemon tp ON t.trainer_id = tp.trainer_id
        JOIN pokemon p ON tp.pokedex_number = p.pokedex_number
        WHERE t.trainer_id = ? OR t.hometown = 'Pallet Town'
    `;

    mysqlConnection.query(sql, [req.params.id], (error, results) => {
        res.json(results);
    });
});

app.get("/scouting/pokemon/:id/moves", (req, res) => {
    mongoDB.collection("moves")
        .find({ pokemon_ids: req.params.id })
        .toArray()
        .then(moves => {
            res.json(moves);
        });
});

app.get("/scouting/candidates", (req, res) => {
    mysqlConnection.query(
        "SELECT * FROM pokemon WHERE primary_type = ?",
        [req.query.type],
        (error, results) => {
            res.json(results);
        }
    );
});

app.post("/trainers/:id/scouting/watchlist", (req, res) => {

    const values = [
        req.params.id,
        req.body.pokedex_number,
        req.body.priority,
        req.body.notes
    ];

    const sql = `
        INSERT INTO scouting_watchlist
        (trainer_id, pokedex_number, priority, notes)
        VALUES (?, ?, ?, ?)
    `;


    mysqlConnection.query(sql, values, (error, results) => {
        res.json(results);
    });
});

// New features (not implemented yet)

// GET /scouting/pokemon/:id/summary

// GET /trainers/:id/scouting/candidates

// Add optional type and minSpeed filters to trainer candidates


app.listen(3000, () => {
    console.log("Pokémon Scouting API running on port 3000");
});