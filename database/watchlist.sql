CREATE TABLE scouting_watchlist (
    trainer_id INT,
    pokedex_number INT,
    priority VARCHAR(20),
    notes VARCHAR(255),

    PRIMARY KEY (trainer_id, pokedex_number),
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (pokedex_number) REFERENCES pokemon(pokedex_number)
);