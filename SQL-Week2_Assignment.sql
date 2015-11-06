-- loadyoutube.sql

DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviews;

CREATE TABLE videos (
  UID varchar(100) PRIMARY KEY,
    name varchar(100) NOT NULL,
    length_sec varchar(100) NOT NULL,
    url varchar(100) NOT NULL
  );
  
LOAD DATA LOCAL INFILE 'C:/Users/cmcgmartin/Documents/CUNY MSDA/00 - Bridge Course - SQL/SQL - Week 2/Week 2/videos.csv' 
INTO TABLE videos 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE reviews (
  video_name varchar(100) NOT NULL,
  username varchar(100) NOT NULL,
  rating varchar(100) NOT NULL,
  review varchar(100) NOT NULL
  );
  
LOAD DATA LOCAL INFILE 'C:/Users/cmcgmartin/Documents/CUNY MSDA/00 - Bridge Course - SQL/SQL - Week 2/Week 2/reviews.csv' 
INTO TABLE reviews
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT v.name, length_sec, url, r.username, rating, review
FROM videos v
LEFT JOIN reviews r
ON v.name = r.video_name
ORDER BY v.UID, r.rating