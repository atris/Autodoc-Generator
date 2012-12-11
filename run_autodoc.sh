#! /bin/sh

rm test_tables.html 2>/dev/null
rm test_sequences.html 2>/dev/null
rm test_functions.html 2>/dev/null
rm test_views.html 2>/dev/null
rm index.html 2>/dev/null

touch index.html
echo "<title> Autodoc Generator </title>" >> index.html
echo "<h1> Autodoc Generator for PostgreSQL </h1>" >>index.html
echo "<a href='test_tables.html'> Tables </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='test_views.html'> Views </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='test_sequences.html'> Sequences </a>" >> index.html
echo "<br>" >> index.html
echo "<a href='test_functions.html'> Functions </a>" >> index.html
for file in $PWD/SQL\ Files/*; do
    /usr/local/pgsql/bin/psql -f "$file" "atri1"
done

echo "<br>" >>test_tables.html
echo "<a href='index.html'> Back </a>" >> test_tables.html
echo "<br>" >>test_views.html
echo "<a href='index.html'> Back </a>" >> test_views.html
echo "<br>" >>test_functions.html
echo "<a href='index.html'> Back </a>" >> test_functions.html
echo "<br>" >>test_sequences.html
echo "<a href='index.html'> Back </a>" >> test_sequences.html

