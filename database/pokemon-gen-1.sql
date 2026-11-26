-- Original course schema and Generation 1 seed (#1-151).
-- To complete the project start data, run scripts/setup-gen2.js after loading this file.

DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;
USE pokemon;

CREATE TABLE body_shape (
    body_shape_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    number_of_legs INT,
    has_wings BOOLEAN,
    description VARCHAR(255)
);

INSERT INTO body_shape
(type, number_of_legs, has_wings, description)
VALUES
('Quadruped', 4, FALSE, 'Walks primarily on four legs'),
('Biped', 2, FALSE, 'Walks primarily on two legs'),
('Winged', 2, TRUE, 'Has wings'),
('Serpentine', 0, FALSE, 'Long body with no legs'),
('Aquatic', 0, FALSE, 'Body adapted primarily for swimming'),
('Insectoid', 6, TRUE, 'Body structure similar to an insect'),
('Blob', 0, FALSE, 'Body has no clearly defined limbs'),
('Humanoid', 2, FALSE, 'Body structure resembles a human');

CREATE TABLE pokemon (
    pokedex_number INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    speed INT,
    special_defence INT,
    special_attack INT,
    defence INT,
    attack INT,
    hp INT,
    primary_type VARCHAR(45),
    secondary_type VARCHAR(45),
    body_shape_id INT,

    FOREIGN KEY (body_shape_id)
        REFERENCES body_shape(body_shape_id)
);


INSERT INTO pokemon
(pokedex_number, name, speed, special_defence, special_attack,
 defence, attack, hp, primary_type, secondary_type, body_shape_id)
VALUES

(1, 'Bulbasaur', 45, 65, 65, 49, 49, 45, 'Grass', 'Poison', 1),
(2, 'Ivysaur', 60, 80, 80, 63, 62, 60, 'Grass', 'Poison', 1),
(3, 'Venusaur', 80, 100, 100, 83, 82, 80, 'Grass', 'Poison', 1),
(4, 'Charmander', 65, 50, 60, 43, 52, 39, 'Fire', NULL, 2),
(5, 'Charmeleon', 80, 65, 80, 58, 64, 58, 'Fire', NULL, 2),
(6, 'Charizard', 100, 85, 109, 78, 84, 78, 'Fire', 'Flying', 3),
(7, 'Squirtle', 43, 64, 50, 65, 48, 44, 'Water', NULL, 2),
(8, 'Wartortle', 58, 80, 65, 80, 63, 59, 'Water', NULL, 2),
(9, 'Blastoise', 78, 105, 85, 100, 83, 79, 'Water', NULL, 2),
(10, 'Caterpie', 45, 20, 20, 35, 30, 45, 'Bug', NULL, 6),
(11, 'Metapod', 30, 25, 25, 55, 20, 50, 'Bug', NULL, 6),
(12, 'Butterfree', 70, 80, 90, 50, 45, 60, 'Bug', 'Flying', 6),
(13, 'Weedle', 50, 20, 20, 30, 35, 40, 'Bug', 'Poison', 6),
(14, 'Kakuna', 35, 25, 25, 50, 25, 45, 'Bug', 'Poison', 6),
(15, 'Beedrill', 75, 80, 45, 40, 90, 65, 'Bug', 'Poison', 6),
(16, 'Pidgey', 56, 35, 35, 40, 45, 40, 'Normal', 'Flying', 3),
(17, 'Pidgeotto', 71, 50, 50, 55, 60, 63, 'Normal', 'Flying', 3),
(18, 'Pidgeot', 101, 70, 70, 75, 80, 83, 'Normal', 'Flying', 3),
(19, 'Rattata', 72, 35, 25, 35, 56, 30, 'Normal', NULL, 1),
(20, 'Raticate', 97, 70, 50, 60, 81, 55, 'Normal', NULL, 1),
(21, 'Spearow', 70, 31, 31, 30, 60, 40, 'Normal', 'Flying', 3),
(22, 'Fearow', 100, 61, 61, 65, 90, 65, 'Normal', 'Flying', 3),
(23, 'Ekans', 55, 54, 40, 44, 60, 35, 'Poison', NULL, 4),
(24, 'Arbok', 80, 79, 65, 69, 85, 60, 'Poison', NULL, 4),
(25, 'Pikachu', 90, 50, 50, 40, 55, 35, 'Electric', NULL, 2),
(26, 'Raichu', 110, 80, 90, 55, 90, 60, 'Electric', NULL, 2),
(27, 'Sandshrew', 40, 30, 20, 85, 75, 50, 'Ground', NULL, 2),
(28, 'Sandslash', 65, 55, 45, 110, 100, 75, 'Ground', NULL, 2),
(29, 'Nidoran-f', 41, 40, 40, 52, 47, 55, 'Poison', NULL, 1),
(30, 'Nidorina', 56, 55, 55, 67, 62, 70, 'Poison', NULL, 1),
(31, 'Nidoqueen', 76, 85, 75, 87, 92, 90, 'Poison', 'Ground', 2),
(32, 'Nidoran-m', 50, 40, 40, 40, 57, 46, 'Poison', NULL, 1),
(33, 'Nidorino', 65, 55, 55, 57, 72, 61, 'Poison', NULL, 1),
(34, 'Nidoking', 85, 75, 85, 77, 102, 81, 'Poison', 'Ground', 2),
(35, 'Clefairy', 35, 65, 60, 48, 45, 70, 'Fairy', NULL, 2),
(36, 'Clefable', 60, 90, 95, 73, 70, 95, 'Fairy', NULL, 2),
(37, 'Vulpix', 65, 65, 50, 40, 41, 38, 'Fire', NULL, 1),
(38, 'Ninetales', 100, 100, 81, 75, 76, 73, 'Fire', NULL, 1),
(39, 'Jigglypuff', 20, 25, 45, 20, 45, 115, 'Normal', 'Fairy', 2),
(40, 'Wigglytuff', 45, 50, 85, 45, 70, 140, 'Normal', 'Fairy', 2),
(41, 'Zubat', 55, 40, 30, 35, 45, 40, 'Poison', 'Flying', 3),
(42, 'Golbat', 90, 75, 65, 70, 80, 75, 'Poison', 'Flying', 3),
(43, 'Oddish', 30, 65, 75, 55, 50, 45, 'Grass', 'Poison', 2),
(44, 'Gloom', 40, 75, 85, 70, 65, 60, 'Grass', 'Poison', 2),
(45, 'Vileplume', 50, 90, 110, 85, 80, 75, 'Grass', 'Poison', 2),
(46, 'Paras', 25, 55, 45, 55, 70, 35, 'Bug', 'Grass', 6),
(47, 'Parasect', 30, 80, 60, 80, 95, 60, 'Bug', 'Grass', 6),
(48, 'Venonat', 45, 55, 40, 50, 55, 60, 'Bug', 'Poison', 6),
(49, 'Venomoth', 90, 75, 90, 60, 65, 70, 'Bug', 'Poison', 6),
(50, 'Diglett', 95, 45, 35, 25, 55, 10, 'Ground', NULL, 7),
(51, 'Dugtrio', 120, 70, 50, 50, 80, 35, 'Ground', NULL, 7),
(52, 'Meowth', 90, 40, 40, 35, 45, 40, 'Normal', NULL, 1),
(53, 'Persian', 115, 65, 65, 60, 70, 65, 'Normal', NULL, 1),
(54, 'Psyduck', 55, 50, 65, 48, 52, 50, 'Water', NULL, 2),
(55, 'Golduck', 85, 80, 95, 78, 82, 80, 'Water', NULL, 2),
(56, 'Mankey', 70, 45, 35, 35, 80, 40, 'Fighting', NULL, 2),
(57, 'Primeape', 95, 70, 60, 60, 105, 65, 'Fighting', NULL, 2),
(58, 'Growlithe', 60, 50, 70, 45, 70, 55, 'Fire', NULL, 1),
(59, 'Arcanine', 95, 80, 100, 80, 110, 90, 'Fire', NULL, 1),
(60, 'Poliwag', 90, 40, 40, 40, 50, 40, 'Water', NULL, 5),
(61, 'Poliwhirl', 90, 50, 50, 65, 65, 65, 'Water', NULL, 2),
(62, 'Poliwrath', 70, 90, 70, 95, 95, 90, 'Water', 'Fighting', 2),
(63, 'Abra', 90, 55, 105, 15, 20, 25, 'Psychic', NULL, 8),
(64, 'Kadabra', 105, 70, 120, 30, 35, 40, 'Psychic', NULL, 8),
(65, 'Alakazam', 120, 95, 135, 45, 50, 55, 'Psychic', NULL, 8),
(66, 'Machop', 35, 35, 35, 50, 80, 70, 'Fighting', NULL, 8),
(67, 'Machoke', 45, 60, 50, 70, 100, 80, 'Fighting', NULL, 8),
(68, 'Machamp', 55, 85, 65, 80, 130, 90, 'Fighting', NULL, 8),
(69, 'Bellsprout', 40, 30, 70, 35, 75, 50, 'Grass', 'Poison', 2),
(70, 'Weepinbell', 55, 45, 85, 50, 90, 65, 'Grass', 'Poison', 2),
(71, 'Victreebel', 70, 70, 100, 65, 105, 80, 'Grass', 'Poison', 2),
(72, 'Tentacool', 70, 100, 50, 35, 40, 40, 'Water', 'Poison', 5),
(73, 'Tentacruel', 100, 120, 80, 65, 70, 80, 'Water', 'Poison', 5),
(74, 'Geodude', 20, 30, 30, 100, 80, 40, 'Rock', 'Ground', 8),
(75, 'Graveler', 35, 45, 45, 115, 95, 55, 'Rock', 'Ground', 8),
(76, 'Golem', 45, 65, 55, 130, 120, 80, 'Rock', 'Ground', 8),
(77, 'Ponyta', 90, 65, 65, 55, 85, 50, 'Fire', NULL, 1),