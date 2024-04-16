SELECT  struct_extract(unnest(categories), 'id') AS id,
        struct_extract(unnest(categories), 'name') AS name 
from {{ source('local-file', 'conference-hall') }}