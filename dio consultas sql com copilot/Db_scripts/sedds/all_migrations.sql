
-- ===============================
-- File: 01_sd.sql
-- ===============================

USE pokemon_tcg;
ALTER TABLE tbl_cardatributes
MODIFY damage VARCHAR(50);

ALTER TABLE tbl_cardatributes
MODIFY attack VARCHAR(100);collection

-- Insert collection
INSERT INTO collection
(id, collection_name, release_date, total_card)
VALUES
(1, 'Base Set', '1999-01-09', 102)
ON DUPLICATE KEY UPDATE
    collection_name = VALUES(collection_name),
    release_date = VALUES(release_date),
    total_card = VALUES(total_card);

-- Insert 10 Pokémon cards
INSERT INTO tbl_cardatributes
(
    hp,
    name,
    stage,
    type,
    info,
    attack,
    damage,
    collection_number,
    weak,
    resist,
    retreat,
    collection_id
)
VALUES
(
    120,
    'Charizard',
    'Stage 2',
    'Fire',
    'Flame Pokémon. Evolves from Charmeleon.',
    'Fire Spin',
    '100',
    4,
    'Water',
    'Fighting',
    3,
    1
),
(
    100,
    'Blastoise',
    'Stage 2',
    'Water',
    'Shellfish Pokémon. Evolves from Wartortle.',
    'Hydro Pump',
    '40+',
    2,
    'Lightning',
    NULL,
    3,
    1
),
(
    100,
    'Venusaur',
    'Stage 2',
    'Grass',
    'Seed Pokémon. Evolves from Ivysaur.',
    'Solarbeam',
    '60',
    15,
    'Fire',
    NULL,
    2,
    1
),
(
    40,
    'Pikachu',
    'Basic',
    'Lightning',
    'Mouse Pokémon.',
    'Gnaw / Thunder Jolt',
    '10 / 30',
    58,
    'Fighting',
    NULL,
    1,
    1
),
(
    40,
    'Charmander',
    'Basic',
    'Fire',
    'Lizard Pokémon.',
    'Scratch / Ember',
    '10 / 30',
    46,
    'Water',
    NULL,
    1,
    1
),
(
    40,
    'Squirtle',
    'Basic',
    'Water',
    'Tiny Turtle Pokémon.',
    'Bubble / Withdraw',
    '10 / NULL',
    63,
    'Lightning',
    NULL,
    1,
    1
),
(
    40,
    'Bulbasaur',
    'Basic',
    'Grass',
    'Seed Pokémon.',
    'Leech Seed',
    '20',
    44,
    'Fire',
    NULL,
    1,
    1
),
(
    60,
    'Mewtwo',
    'Basic',
    'Psychic',
    'Genetic Pokémon.',
    'Psychic / Barrier',
    '10+ / NULL',
    10,
    'Psychic',
    NULL,
    3,
    1
),
(
    80,
    'Raichu',
    'Stage 1',
    'Lightning',
    'Mouse Pokémon. Evolves from Pikachu.',
    'Agility / Thunder',
    '20 / 60',
    14,
    'Fighting',
    NULL,
    1,
    1
),
(
    90,
    'Gyarados',
    'Stage 1',
    'Water',
    'Atrocious Pokémon. Evolves from Magikarp.',
    'Dragon Rage / Bubblebeam',
    '50 / 40',
    6,
    'Grass',
    'Fighting',
    3,
    1
);

-- ===============================
-- File: 02_tbinseritcolection.sql
-- ===============================

USE pokemon_tcg;

INSERT INTO collection
(
    id,
    collection_name,
    release_date,
    total_card
)
VALUES
(
    1,
    'Base Set',
    '1999-01-09',
    102
)
ON DUPLICATE KEY UPDATE
    collection_name = VALUES(collection_name),
    release_date = VALUES(release_date),
    total_card = VALUES(total_card);
