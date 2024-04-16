{% macro extract_email_domain(email_column_name) %}
   regexp_extract({{ email_column_name }}, '.*@([a-z ]+)\..*', 1) 
{% endmacro %}