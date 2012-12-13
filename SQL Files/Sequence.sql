\o details_sequences.html

SELECT format('<li> <head> %s %s %s %s %s </head>',sequence_catalog,sequence_name,data_type,minimum_value,maximum_value) AS Sequences FROM information_schema.sequences WHERE sequence_catalog=(SELECT current_database()) AND sequence_schema='public';

\o
