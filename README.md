Autodoc-Generator
=================

Autodoc Generator for PostgreSQL generates details of PostgreSQL databases in HTML format.Please note that this is a prototype with limited functionalities.More functionalities will be added soon.

Usage

To run Autodoc Generator, please run run_autodoc.sh script in the following manner:

./run_autodoc.sh [full path of psql including psql e.g. /usr/pgsql/bin/psql.If path of psql is present in PATH of your terminal,please type only 'psql' here] [name of database for which autodoc has to be generated]

e.g.

./run_autodoc.sh /usr/local/pgsql/bin/psql database1

If path of psql is present in command line,

./run_autodoc.sh psql database1

To view the results,please open index.html and follow the links.
