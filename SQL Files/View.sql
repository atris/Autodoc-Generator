\o test_views.html

select format('<head> %s </head>',table_name) AS Views from INFORMATION_SCHEMA.views WHERE table_catalog=(SELECT current_database()) AND table_schema='public';

\o
