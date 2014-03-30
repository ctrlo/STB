#!/bin/bash

echo Using database STB. Please enter the root password of the mysql database:
read PASSWORD

dbicdump -o dump_directory=./lib -o components='["InflateColumn::DateTime"]' STB::Schema 'dbi:mysql:dbname=stb' root $PASSWORD

