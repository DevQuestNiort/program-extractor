WITH total_speakers AS (SELECT count(*) FROM {{ ref('stg_speaker') }}),

company_groups AS (
    SELECT
        company,
        count(id) AS talk_number
    FROM {{ ref('stg_speaker') }} GROUP BY company
)

SELECT
    company,
    talk_number,
    talk_number / (SELECT * FROM total_speakers) * 100 AS repartition
FROM company_groups
ORDER BY talk_number DESC
