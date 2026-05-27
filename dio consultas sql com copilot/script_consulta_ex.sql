USE pokemon_tcg;

SELECT
    card.id AS card_id,
    card.name AS card_name,
    card.hp,
    card.stage,
    card.type,
    card.attack,
    card.damage,
    card.collection_number,
    
    col.id AS collection_id,
    col.collection_name,
    col.release_date,
    col.total_card
FROM tbl_cardatributes AS card
INNER JOIN collection AS col
    ON card.collection_id = col.id
WHERE col.id = 1
ORDER BY card.collection_number;