-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE DATABASE tournament;

\connect tournament

CREATE TABLE players(
	player_id SERIAL PRIMARY KEY,
	name TEXT);

CREATE TABLE matches(
	match_id SERIAL PRIMARY KEY,
	winner INTEGER REFERENCES players(player_id),
	loser INTEGER REFERENCES players(player_id));

CREATE VIEW wins_view AS
SELECT player_id, count(winner) AS wins
FROM players LEFT JOIN matches
ON player_id = winner
GROUP BY player_id
ORDER BY wins DESC;

CREATE VIEW matches_played_view AS
SELECT player_id, count(matches) AS matches_played
FROM players LEFT JOIN matches
ON player_id = winner OR player_id = loser
GROUP BY player_id
ORDER BY matches_played;

CREATE VIEW standings_view AS
SELECT players.player_id, name, wins, matches_played
FROM players 
JOIN wins_view
ON players.player_id = wins_view.player_id
JOIN matches_played_view
ON players.player_id = matches_played_view.player_id
ORDER BY wins DESC;