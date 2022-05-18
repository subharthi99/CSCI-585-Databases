create extension IF not EXISTS postgis;

DROP TABLE IF EXISTS hw3locs;

CREATE TABLE hw3locs (location_id varchar(20), location_name varchar(100), coords geometry);

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('1','Prentis Memorial Fountain',ST_GeomFromText('POINT(-118.284559 34.020540)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('2','Patsy and Forrest Shumway Fountain',ST_GeomFromText('POINT(-118.285208 34.020162)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('3','Leavey Library Fountain',ST_GeomFromText('POINT(-118.28298632 34.02137420)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('4','Expo Park Fountain',ST_GeomFromText('POINT(-118.28611980 34.017802665)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('5','Dornsife Fountain',ST_GeomFromText('POINT(-118.28679899 34.01905132)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('6','Epstein Plaza Fountain',ST_GeomFromText('POINT(-118.28863008726 34.0202887825)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('7','Hoose Library',ST_GeomFromText('POINT(-118.286721 34.018719)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('8','Accounting Library',ST_GeomFromText('POINT(-118.285586 34.019190)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('9','Doheny Library',ST_GeomFromText('POINT(-118.283730 34.020188)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('10','Helen Topping Architecture Library',ST_GeomFromText('POINT(-118.288043 34.019202)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('11','Science and Engineering Library',ST_GeomFromText('POINT(-118.288730 34.019577)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('12','Leavey Library',ST_GeomFromText('POINT(-118.282957 34.021782)'));

INSERT INTO hw3locs(location_id, location_name, coords)
VALUES('13','Home',ST_GeomFromText('POINT(-118.2798934 34.0283626)'));

SELECT ST_AsText(ST_ConvexHull(ST_Collect(locs.coords))) AS Covex_Hull_Coordinates from hw3locs locs;

SELECT location_id, location_name, ST_AsText(m1.coords) AS nn_coords 
FROM hw3locs m1
WHERE location_name != 'Home'
ORDER BY ST_Distance(m1.coords, ST_GeomFromText('POINT(-118.2798934 34.0283626)')) ASC
LIMIT 4;