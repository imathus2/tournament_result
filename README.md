#Tournament Results

Tournament result is project to generate matches and store the matches and the players registered in a swiss style tournament

##Prerequisites

* Python -- programming language
* PostgreSQL -- Database

##How to test run

Connect to PostgreSQL:
```sh
$ psql
```

Create and connect the tournament database, as well as create the tables and views required for the project.
```sh
$ \i tournament.sql
```

Run the tests:
Firstly quit PostgreSQL
```sh
$ \q
```

Now execute tournament_test.py file
```sh
$ python tournament_test.py
```
