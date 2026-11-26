# Pokémon Scouting API

## Project Overview

Welcome to the Pokémon Scouting System.

This is an existing backend application developed to help Pokémon trainers explore Pokémon, investigate available moves and find new Pokémon for their teams.

The previous development team has left the project. Your team has been hired to maintain and extend the system.

**The application is not finished.** Some features work correctly, some contain bugs, and other features have not yet been implemented.

Your task is to understand the existing codebase, fix problems and develop new functionality.

## Technologies

The application uses:

- **Node.js** – JavaScript runtime
- **Express** – REST API
- **MySQL** – Pokémon and trainer data
- **MongoDB** – Pokémon moves
- **PokéAPI** – External Pokémon data
- **Insomnia** – Testing API endpoints

## Project Structure

```text
pokemon-scouting/
│
├── app.js
├── package.json
├── .env
│
├── database/
│   ├── pokemon.sql
│   └── moves.js
│
└── scripts/
    └── setup-gen2.js
```

### Files

| File | Description |
|---|---|
| `app.js` | The Express application and existing API endpoints |
| `package.json` | Project dependencies |
| `database/pokemon.sql` | MySQL database structure and initial data |
| `database/moves.js` | MongoDB data containing Pokémon moves |
| `scripts/setup-gen2.js` | Script for preparing Generation 2 data |

## Getting Started

### 1. Install dependencies

Open the project in WebStorm.

Open the terminal and run:

```bash
npm install
```

Make sure your `package.json` includes `"type": "module"`.

### 2. Set up MySQL

Open MySQL Workbench.

Run the SQL script:

`database/pokemon.sql`

This creates the MySQL database and inserts the initial Pokémon and trainer data.

**Important:** The SQL script resets the `pokemon` database. Do not run it if you need to preserve existing data.

### 3. Set up MongoDB

Start your local MongoDB server.

Open MongoDB Compass or mongosh and select the database:

`pokemon`

Run the MongoDB seed script:

`database/moves.js`

This inserts move documents into the `moves` collection.

**Important:** The moves dataset currently covers Pokémon from Generation 1.

### 4. Prepare Generation 2

The application should contain Pokémon from Generation 1 and Generation 2 before development begins.

If your database only contains the first 151 Pokémon, run:

```bash
scripts/setup-gen2.js
```

Verify the result in MySQL:

```sql
SELECT COUNT(*) FROM pokemon;
```

Expected result: **251 Pokémon**.

### 5. Configure environment variables

The application requires the following environment variables:

```text
MONGODB_URI=mongodb://localhost:27017
MONGODB_DATABASE=pokemon
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=YOUR_PASSWORD
MYSQL_DATABASE=pokemon
```

Replace `YOUR_PASSWORD` with your local MySQL password.

You can configure these variables in WebStorm:

**Run → Edit Configurations → Environment variables**

Alternatively, save them in a `.env` file in the project directory.

Do not share your passwords or commit your `.env` file to a repository.

### 6. Start the application

If you configured the environment variables in WebStorm, run `app.js` using your Run Configuration.

The server should start on:

`http://localhost:3000`

You should see:

```text
Pokémon Scouting API running on port 3000
```

## Existing API Endpoints

The previous development team implemented the following endpoints.

| Method | Endpoint | Description |
|---|---|---|
| GET | `/pokemon/:id` | Find a Pokémon by ID |
| GET | `/scouting/fastest` | Find the five fastest Pokémon |
| GET | `/trainers/:id/pokemon` | Find Pokémon belonging to a trainer |
| GET | `/scouting/pokemon/:id/moves` | Find moves available to a Pokémon |
| GET | `/scouting/candidates?type=fire` | Find Pokémon of a specified type |

Some endpoints may not work exactly as intended.

Your team is responsible for investigating the application and resolving the problems described in the exercises.

## Testing the API

Use Insomnia to send requests to the application.

For example:

**Find Charizard**

```http
GET http://localhost:3000/pokemon/6
```

**Find the fastest Pokémon**

```http
GET http://localhost:3000/scouting/fastest
```

**Find a trainer's Pokémon**

```http
GET http://localhost:3000/trainers/1/pokemon
```

**Find Charizard's moves**

```http
GET http://localhost:3000/scouting/pokemon/6/moves
```

**Find Fire-type Pokémon**

```http
GET http://localhost:3000/scouting/candidates?type=fire
```

Investigate the responses and compare the results with the data stored in MySQL and MongoDB.

## Database Information

### MySQL

The MySQL database contains the following tables:

- `pokemon` – Pokémon names, types and base stats
- `trainer` – Information about trainers
- `trainer_pokemon` – Relationships between trainers and their Pokémon
- `body_shape` – Pokémon body shape information

The database should initially contain **251 Pokémon**.

### MongoDB

The MongoDB database contains a collection called `moves`.

Each document contains information such as:

```json
{
    "name": "Flamethrower",
    "type": "Fire",
    "category": "Special",
    "power": 90,
    "accuracy": 100,
    "pokemon_ids": [4, 5, 6, 37, 38, 58, 59, 77, 78, 126, 136, 146, 149]
}
```

The `pokemon_ids` array identifies which Pokémon can use the move.

## Development Guidelines

When working on the project:

- Investigate existing code before making changes.
- Reuse existing database connections and functionality.
- Do not recreate the application from scratch.
- Test your changes using Insomnia.
- Verify database results using MySQL Workbench and MongoDB Compass.
- Make sure existing functionality continues to work after your changes.

## Project Goal

By the end of the project, the Pokémon Scouting System should:

- Have its reported bugs fixed.
- Support new scouting functionality.
- Combine Pokémon information from MySQL with moves from MongoDB.
- Support Pokémon from Generation 3 through an ETL process.

Good luck!