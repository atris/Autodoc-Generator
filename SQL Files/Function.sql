\o details_functions.html

SELECT format('<br> <li> <head> %s </head>',specific_name) AS Functions FROM information_schema.routines WHERE specific_catalog=(SELECT current_database()) AND specific_schema='public';

\o
