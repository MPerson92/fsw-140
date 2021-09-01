
USE avengers;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE newAvengers(
url VARCHAR(100) DEFAULT NULL,
name VARCHAR(50) DEFAULT NULL,
appearances VARCHAR(5) DEFAULT NULL,
current VARCHAR(3) DEFAULT NULL,
gender VARCHAR(6) DEFAULT NULL,
probationaryIntro VARCHAR(25) DEFAULT NULL,
fullAvengersIntro VARCHAR(25) DEFAULT NULL,
year INT DEFAULT NULL,
yearsSinceJoining INT DEFAULT NULL,
honorary VARCHAR(25) DEFAULT NULL,
death1 VARCHAR(5) DEFAULT NULL,
return1 VARCHAR(5) DEFAULT NULL,
death2 VARCHAR(5) DEFAULT NULL,
return2 VARCHAR(5) DEFAULT NULL,
death3 VARCHAR(5) DEFAULT NULL,
return3 VARCHAR(5) DEFAULT NULL,
death4 VARCHAR(5) DEFAULT NULL,
return4 VARCHAR(5) DEFAULT NULL,
death5 VARCHAR(5) DEFAULT NULL,
return5 VARCHAR(5) DEFAULT NULL,
notes VARCHAR(300) DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO newavengers VALUES
('https://en.wikipedia.org/wiki/Ms._Marvel', 'Kamal Khan', '250', 'YES', 'FEMALE', 'JAN-01', 'NOV-01', 1997, 9, 'Honorary', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'Kamala Khan, created by Sana Amanat, G. Willow Wilson, and Adrian Alphona, is the fourth character to take the name Ms. Marvel.'),
('https://en.wikipedia.org/wiki/Scorpion_(Carmilla_Black)', 'Carmilla Black', '300', 'YES', 'FEMALE', 'JUN-01', 'JUL-20', 2005, 16, 'FULL', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'After the vicious murder of her adoptive parents, Carmilla discovered her biological mother, Monica Rappaccini, was the Scientist Supreme of the worldwide terrorist network A.I.M. (Advanced Idea Mechanics).'),
('https://en.wikipedia.org/wiki/Callisto_(comics)', 'Callisto', '20', 'YES', 'FEMALE', 'MAY-01', 'DEC-31', 1983, 38, 'Honorary', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'Callisto is a fictional character appearing in American comic books published by Marvel Comics and is associated with the X-Men.');

ALTER TABLE newavengers ADD theNewSuperheroes VARCHAR(50) DEFAULT NULL;

UPDATE newavengers SET theNewSuperheroes = CASE WHEN RAND() < 0.5 THEN 'YES' ELSE 'NO' END;

SELECT theNewSuperheroes FROM newavengers;

ALTER TABLE newavengers ADD favoriteAvenger VARCHAR(50) DEFAULT NULL;

UPDATE newavengers SET favoriteAvenger = CASE WHEN RAND() <= 0.2 THEN 'Anthony Edward "Tony" Stark' 
WHEN RAND() <= 0.6 THEN 'Robert Bruce Banner' ELSE 'Victor Shade' END;

SELECT favoriteAvenger FROM newavengers;

SELECT * FROM newavengers
JOIN avengers ON avengers.name = newavengers.favoriteAvenger
WHERE theNewSuperheroes = 'YES';

SELECT * FROM avengers
WHERE appearances > 1000
ORDER BY name;

SELECT * FROM avengers
WHERE appearances < 1000
ORDER BY name;

SELECT * FROM avengers
WHERE appearances < 500
ORDER BY name;

SELECT * FROM avengers
WHERE appearances < 50
AND gender = 'FEMALE'
ORDER BY name;

SELECT * FROM avengers
WHERE appearances > 150
AND gender = 'MALE'
AND honorary = 'Full'
ORDER BY name;

















	
    






