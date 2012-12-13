\o details_views.html

select format('<li> <head> %s </head>',table_name) AS Views from INFORMATION_SCHEMA.views WHERE table_catalog=(SELECT current_database()) AND table_schema='public';

\o
