{% macro export_to_json(table) %}
    COPY (SELECT * FROM {{ table }})
    TO 'target/{{table}}.json'
    ( ARRAY true )
{% endmacro %}