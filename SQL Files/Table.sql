\o test_tables.html

SELECT format('<li> <head> %s </head>',tablename) AS Tables FROM pg_tables WHERE tableowner=(SELECT current_user) AND schemaname='public';

\o
