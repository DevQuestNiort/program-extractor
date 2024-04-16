WITH talks as (SELECT  struct_extract(unnest(talks), 'title') AS title, 
        struct_extract(unnest(talks), 'id') as id,
        struct_extract(unnest(talks), 'abstract') as abstract,
        struct_extract(unnest(talks), 'categories') AS categorie_id, 
        struct_extract(unnest(talks), 'formats') AS format_id, 
        struct_extract(unnest(talks), 'speakers') AS speakers_id
FROM {{ source('local-file', 'conference-hall') }})

SELECT id, title, abstract, categorie_id, format_id, speakers_id
FROM talks