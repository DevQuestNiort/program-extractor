with flat_talks as (SELECT
    id,
    title,
    abstract,
    format_id,
    categorie_id,
    unnest(speakers_id) as speaker_id
    FROM {{ ref('stg_talk') }})

SELECT 
    t.id,
    t.title,
    t.abstract,
    list(struct_pack( name := speaker.displayName, id := speaker.id, photo := speaker.photo, company := speaker.company, bio := speaker.bio, social := speaker.social)) AS speakers,
    f.name AS format,
    c.name AS categorie,
    '' as room,
    '' as slot,
    '' as slug,
    'false' as cancelled
FROM flat_talks t
JOIN {{ ref('stg_format') }} AS f ON t.format_id = f.id
JOIN {{ ref('stg_categorie') }} AS c ON t.categorie_id = c.id
JOIN {{ ref('stg_speaker') }} AS speaker ON t.speaker_id = speaker.id
GROUP BY ALL 
