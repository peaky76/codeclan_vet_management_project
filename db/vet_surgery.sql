DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS vets;

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    tel VARCHAR(255)
);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    addr_1 VARCHAR(255),
    addr_2 VARCHAR(255),
    town_city VARCHAR(255),
    postcode VARCHAR(255),
    email VARCHAR(255),
    tel VARCHAR(255),
    balance INT,
    registered BOOLEAN,
    marketing BOOLEAN
);

CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    dob VARCHAR(255),
    type VARCHAR(255),
    notes TEXT,
    owner_id INT REFERENCES owners(id),
    vet_id INT REFERENCES vets(id)
);