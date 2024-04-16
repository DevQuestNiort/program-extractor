SELECT  struct_extract(unnest(formats), 'id') AS id, 
        struct_extract(unnest(formats), 'name') AS name 
FROM {{ source('local-file', 'conference-hall') }}