Autodoc-Generator
=================

Autodoc Generator for PostgreSQL generates details of PostgreSQL databases in HTML format.Please note that this is a prototype with limited functionalities.More functionalities will be added soon.

Usage

Before running run_autodoc.sh,please set the value in autodoc_conf.txt .Please note this is one time only.If the location of psql on your system changes,you will have to update the contents of autodoc_conf.txt

In autodoc_conf.txt, set the full path of psql including psql e.g. /usr/pgsql/bin/psql.If path of psql is present in PATH of your terminal,please type only 'psql' here.

E.g. Contents of autoconf_doc.txt = /usr/pgsql/bin/psql

To run Autodoc Generator, please run run_autodoc.sh script in the following manner:

./run_autodoc.sh [name of database for which autodoc has to be generated]

e.g.

./run_autodoc.sh database1

To view the results,please open the autodoc_[database name] folder/index.html and follow the links.
