WITH total_talks AS (SELECT count(*) FROM {{ ref('stg_talk') }}),

categorie_groups AS (
    SELECT
        categorie_id,
        count(title) AS talk_number
    FROM {{ ref('stg_talk') }} GROUP BY categorie_id
)

SELECT
    c.name AS name,
    talk_number AS count,
    talk_number / (SELECT * FROM total_talks) * 100 AS repartition
FROM categorie_groups AS cg
INNER JOIN {{ ref('stg_categorie') }} AS c ON cg.categorie_id = c.id
ORDER BY talk_number DESC
