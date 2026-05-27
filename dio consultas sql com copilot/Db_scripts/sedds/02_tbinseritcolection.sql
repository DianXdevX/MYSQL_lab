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