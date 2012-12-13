#! /bin/bash

rm details_tables.html 2>/dev/null
rm details_sequences.html 2>/dev/null
rm details_functions.html 2>/dev/null
rm details_views.html 2>/dev/null
rm index.html 2>/dev/null

mkdir autodoc_$1 2>/dev/null
touch index.html
echo "<title> Autodoc Generator </title>" >> index.html
echo "<h1> Autodoc Generator for PostgreSQL </h1>" >>index.html
echo "<a href='details_tables.html'> Tables </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='details_views.html'> Views </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='details_sequences.html'> Sequences </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='details_functions.html'> Functions </a>" >> index.html

PSQLCL=$(cat autodoc_conf.txt)
for file in $PWD/SQL\ Files/*; do
    $PSQLCL -XtAq -f "$file" $1
done

tables=$($PSQLCL -f $PWD/SQL\ Files/Table2.sql -XtAq $1)
for table in ${tables[@]}
do
    echo "$table"
    rm details_$table.html 2>/dev/null
    touch details_$table.html
    schema_name=$($PSQLCL -c "SELECT table_schema FROM information_schema.tables WHERE table_name='$table'" -XtAq $1)
    owner_name=$($PSQLCL -c "SELECT usename FROM pg_user WHERE usesysid=(SELECT relowner FROM pg_class WHERE relname='$table')" -XtAq $1)
    tablespace_oid=$($PSQLCL -c "SELECT reltablespace FROM pg_class WHERE relname='$table'" -XtAq $1)

if [ $tablespace_oid -eq 0 ]; then
    tablespace_name="default"
else
    tablespace_name=$($PSQLCL -c "SELECT spcname FROM pg_tablespace WHERE oid='$tablespace_oid'" -XtAq $1)
fi

    column_names=$($PSQLCL -c "select column_name from information_schema.columns where table_name='$table'" -XtAq $1)

    echo "<title> Details of $table </title>" >>details_$table.html
    echo "<h2> $table Details </h2>" >>details_$table.html
    echo "<h4> Attributes </h4>" >>details_$table.html
    echo "<table border="1">" >>details_$table.html
    echo "<tr>" >>details_$table.html
    echo "<th>Attribute Name</th>" >>details_$table.html
    echo "<th>Attribute Type</th>" >>details_$table.html
    echo "</tr>" >>details_$table.html
for column in ${column_names[@]}
do
    datatype_name=$($PSQLCL -c "select data_type from information_schema.columns where table_name='$table' AND column_name='$column'" -XtAq $1)

    echo "<tr>" >>details_$table.html
    echo "<td>$column</td>" >>details_$table.html
    echo "<td>$datatype_name</td>" >>details_$table.html
    echo "</tr>" >>details_$table.html
done

    echo "<table border="1">" >>details_$table.html
    echo "<tr>" >>details_$table.html
    echo "<th>Schema</th>" >>details_$table.html
    echo "<th>Owner</th>" >>details_$table.html
    echo "<th>Tablespace</th>" >>details_$table.html
    echo "</tr>" >>details_$table.html
    echo "<tr>" >>details_$table.html
    echo "<td>$schema_name</td>" >>details_$table.html
    echo "<td>$owner_name</td>" >>details_$table.html
    echo "<td>$tablespace_name</td>" >>details_$table.html
    echo "</tr>" >>details_$table.html
    echo "<br>" >>details_$table.html
    echo "<br>" >>details_$table.html
    echo "<a href='details_tables.html'> Back </a>" >>details_$table.html
    echo "<br>" >>details_$table.html
    echo "<h4> Schema, Owner, Tablespace </h4>" >>details_$table.html
    cp details_$table.html autodoc_$1
    rm details_$table.html
    echo "<li> <a href=details_$table.html> $table </a>" >>details_tables.html
    echo "$schema_name"
    echo "$owner_name"
    echo "$tablespace_oid"
    echo "$tablespace_name"
done

echo "<br>" >>details_tables.html
echo "<br>" >>details_tables.html
echo "<a href='index.html'> Back </a>" >> details_tables.html
echo "<br>" >>details_views.html
echo "<br>" >>details_views.html
echo "<a href='index.html'> Back </a>" >> details_views.html
echo "<br>" >>details_functions.html
echo "<br>" >>details_functions.html
echo "<a href='index.html'> Back </a>" >> details_functions.html
echo "<br>" >>details_sequences.html
echo "<br>" >>details_sequences.html
echo "<a href='index.html'> Back </a>" >> details_sequences.html

cp index.html details_tables.html details_views.html details_functions.html details_sequences.html autodoc_$1

rm index.html details_tables.html details_views.html details_functions.html details_sequences.html

