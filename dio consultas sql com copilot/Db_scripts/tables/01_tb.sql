CREATE DATABASE IF NOT EXISTS pokemon_tcg;
USE pokemon_tcg;

-- Second table: collection
CREATE TABLE collection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    collection_name VARCHAR(100) NOT NULL,
    release_date DATE,
    total_card INT
);

-- First table: card attributes
CREATE TABLE tbl_cardatributes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    hp INT,
    name VARCHAR(100) NOT NULL,
    stage VARCHAR(50),
    type VARCHAR(50),
    info TEXT,
    attack VARCHAR(100),
    damage INT,
    collection_number INT,
    weak VARCHAR(50),
    resist VARCHAR(50),
    retreat INT,

    collection_id INT,

    CONSTRAINT fk_card_collection
        FOREIGN KEY (collection_id)
        REFERENCES collection(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);