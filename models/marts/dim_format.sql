WITH total_talks AS (SELECT count(*) FROM {{ ref('stg_talk') }}),

categorie_groups AS (
    SELECT
        format_id,
        count(title) AS talk_number
    FROM {{ ref('stg_talk') }} GROUP BY format_id
)

SELECT
    f.name,
    talk_number,
    talk_number / (SELECT * FROM total_talks) * 100 AS repartition
FROM categorie_groups AS cg
INNER JOIN {{ ref('stg_format') }} AS f ON cg.format_id = f.id
ORDER BY talk_number DESC
