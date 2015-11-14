-- accesscodes.sql

# Remove tables if they already exist

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS rooms;

# Created new local tables for reproducability
# Did not use local saved database

CREATE TABLE users (
  UID int PRIMARY KEY,
    username varchar(100),
    groupID int,
    groupname varchar(100)
  );

INSERT INTO users(UID, username, groupID, groupname)
VALUES(1, 'Modesto', 1, 'I.T.');
INSERT INTO users(UID, username, groupID, groupname)
VALUES(2, 'Ayine', 1, 'I.T.');
INSERT INTO users(UID, username, groupID, groupname)
VALUES(3, 'Christopher', 2, 'Sales');
INSERT INTO users(UID, username, groupID, groupname)
VALUES(4, 'Cheong woo', 2, 'Sales');
INSERT INTO users(UID, username, groupID, groupname)
VALUES(5, 'Saulat', 3, 'Administration');
INSERT INTO users(UID, username)
VALUES(6, 'Heidy');

CREATE TABLE groups (
  groupID int,
  groupname varchar(100),
  roomID int,
  roomname varchar(100)
  );

INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(1, 'I.T.', 1, 'Room 101');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(1, 'I.T.', 2, 'Room 102');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(2, 'Sales', 2, 'Room 102');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(2, 'Sales', 3, 'Auditorium A');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(4, 'Operations', 1, 'Room 101');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(4, 'Operations', 2, 'Room 102');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(4, 'Operations', 3, 'Auditorium A');
INSERT INTO groups(groupID, groupname, roomID, roomname)
VALUES(4, 'Operations', 4, 'Auditorium B');
INSERT INTO groups(groupID, groupname)
VALUES(3, 'Administration');

CREATE TABLE rooms (
  roomID int,
  roomname varchar(100)
  );

INSERT INTO rooms(roomID, roomname)
VALUES(1, 'Room 101');
INSERT INTO rooms(roomID, roomname)
VALUES(2, 'Room 102');
INSERT INTO rooms(roomID, roomname)
VALUES(3, 'Auditorium A');
INSERT INTO rooms(roomID, roomname)
VALUES(4, 'Auditorium B');



#Create SELECT statements:

#Statement 1: All groups, and the users in each group.
#A group should appear even if there are no users assigned to the group.

#SELECT
#DISTINCT g.groupname as 'Group',
#u.username as 'User'
#FROM groups g
#LEFT JOIN users u
#ON g.groupID = u.groupID
#ORDER BY g.groupname


#Statement 2: All rooms, and the groups assigned to each room.
#The rooms should appear even if no groups have been assigned to them

#SELECT
#DISTINCT r.roomname as 'Room',
#g.groupname as 'Group'
#FROM rooms r
#LEFT JOIN groups g
#ON g.roomID = r.roomID
#ORDER BY r.roomname



#Statement 3: A list of users, the groups that they belong to, and the rooms to which they are assigned.
#This should be sorted alphabetically by user, group, then room.
SELECT
u.username AS 'User',
g.groupname AS 'Group',
r.roomname AS 'Room'
FROM users u
LEFT JOIN groups g
ON u.groupID = g.groupID
LEFT JOIN rooms r
ON g.roomID = r.roomID
