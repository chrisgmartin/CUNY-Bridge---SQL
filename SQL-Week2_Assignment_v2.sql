-- loadyoutube.sql

DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviews;

CREATE TABLE videos (
  UID int PRIMARY KEY,
    name varchar(100) NOT NULL,
    length_sec varchar(100) NOT NULL,
    url varchar(100) NOT NULL
  );

INSERT INTO videos(UID, name, length_sec, url)
VALUES(1, 'Baby Monkey (Going Backwards On A Pig) - Parry Gripp', 58, 'https://www.youtube.com/watch?v=5_sfnQDr1-o');
INSERT INTO videos(UID, name, length_sec, url)
VALUES(2, 'Little Octopus Climbing Over Rock - Parry Gripp', 49, 'https://www.youtube.com/watch?v=4Lp5a-r3MJU');
INSERT INTO videos(UID, name, length_sec, url)
VALUES(3, 'Nom Nom Nom Nom Nom Nom Nom Nom - Parry Gripp', 70, 'https://www.youtube.com/watch?v=SMWi7CLoZ2Q');

CREATE TABLE reviews (
  video_name varchar(100) NOT NULL,
  username varchar(100) NOT NULL,
  rating varchar(100) NOT NULL,
  review varchar(100) NOT NULL
  );

INSERT INTO reviews(video_name, username, rating, review)
VALUES('Baby Monkey (Going Backwards On A Pig) - Parry Gripp', 'Maddy_Boland', 5, 'Yes. Absololute yes!');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Baby Monkey (Going Backwards On A Pig) - Parry Gripp', 'DAGGERS', 4, 'Sadly that night the pig was eaten alive by the monkey');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Baby Monkey (Going Backwards On A Pig) - Parry Gripp', 'jonpaulevans', 5, 'If there was ever a video that shouldnt have any dislikes its this one');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Little Octopus Climbing Over Rock - Parry Gripp', 'Amy-Jean', 5, 'THIS OCTOPUS INSPIRES ME TO FOLLOW MY DRAMS');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Little Octopus Climbing Over Rock - Parry Gripp', 'Fenne_Kin', 4, 'Aww that octopus is so cute!');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Little Octopus Climbing Over Rock - Parry Gripp', 'Laurie_Laubach', 3, 'Hes squishy');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Nom Nom Nom Nom Nom Nom Nom Nom - Parry Gripp', 'Xx_Captain_xX', 4, 'I liked when he said nom');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Nom Nom Nom Nom Nom Nom Nom Nom - Parry Gripp', 'Emolag', 3, 'oh my god');
INSERT INTO reviews(video_name, username, rating, review)
VALUES('Nom Nom Nom Nom Nom Nom Nom Nom - Parry Gripp', 'Dipper_Pines', 2, 'Rule 34');

SELECT v.name, length_sec, url, r.username, rating, review
FROM videos v
LEFT JOIN reviews r
ON v.name = r.video_name
ORDER BY v.UID, r.rating