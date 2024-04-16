with final as (SELECT  struct_extract(unnest(speakers), 'uid') AS id, 
        struct_extract(unnest(speakers), 'displayName') AS displayName, 
        struct_extract(unnest(speakers), 'bio') AS bio,
        struct_extract(unnest(speakers), 'company') AS company, 
        struct_extract(unnest(speakers), 'photoURL') as photo,
        struct_extract(unnest(speakers), 'twitter') as twitter,
        struct_extract(unnest(speakers), 'github') as github,

FROM {{ source('local-file', 'conference-hall') }})

SELECT  id, 
        displayName, 
        photo,
        upper(company) AS company,
        bio,
        list(struct_pack(x := twitter, github := github)) as social
FROM final
GROUP BY ALL