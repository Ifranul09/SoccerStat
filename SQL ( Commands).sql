-- CLUB TABLE --

CREATE TABLE CLUB (
  Club_ID int NOT NULL,
  Club_Name varchar(20) NOT NULL,
  Championship_Name varchar(30) DEFAULT NULL,
  Title_Number int DEFAULT '0',
  PRIMARY KEY (Club_ID)
);

-- CURRENT_SEASON --

CREATE TABLE CURRENT_SEASON (
  club_ID int NOT NULL,
  club_standing int NOT NULL,
  games_won int DEFAULT NULL,
  games_lost int DEFAULT NULL,
  games_drew int DEFAULT NULL,
  points int DEFAULT NULL,
  last_five_games varchar(10) DEFAULT NULL,
  PRIMARY KEY (club_ID),
   FOREIGN KEY (club_ID) REFERENCES CLUB (Club_ID)
);

-- MANAGER -- 
CREATE TABLE MANAGER(
    Manager_ID INT NOT NULL,
    PRIMARY KEY (Manager_ID,Club_ID),
    Manager_Name VARCHAR (30) NOT NULL,
    Nationality VARCHAR (20) NOT NULL,
    Club_ID INT NOT NULL,
    Current_Club_Years INT NOT NULL,
    Titles INT DEFAULT '0',
    Individual_Awards INT DEFAULT '0',
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID)
);

-- MANAGER_PREVIOUS_TEAMS --

CREATE TABLE MANAGER_PREVIOUS_TEAMS(
     Manager_ID INT NOT NULL,
    Club_ID INT NOT NULL,
    PRIMARY KEY (Manager_ID,Club_ID),
    Previous_Club_Years INT NOT NULL,
     FOREIGN KEY (Manager_ID) REFERENCES MANAGER(Manager_ID)
);

-- PLAYER -- 

CREATE TABLE PLAYER(
    Player_ID INT NOT NULL auto_increment,
    Club_ID INT  NOT NULL,
    PRIMARY KEY (Player_ID,Club_ID),
    Player_Name VARCHAR(30) NOT NULL,
    Current_Club_Years INT DEFAULT '0',
    Nationality VARCHAR (20) NOT NULL,
    Price VARCHAR (20) DEFAULT '0',
    Individual_Awards INT DEFAULT '0',
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID)

);

-- PLAYER_PREVIOUS_CLUBS --

CREATE TABLE PLAYER_PREVIOUS_CLUBS(
    Player_ID INT NOT NULL,
    Club_ID INT NOT NULL,
    PRIMARY KEY (Player_ID,Club_ID),
    Previous_Club_Years INT NOT NULL,
    FOREIGN KEY (Player_ID) REFERENCES PLAYER(Player_ID)
);

-- PLAYER_SEASONAL_STATS --

CREATE TABLE PLAYER_SEASONAL_STATS(
    Player_ID INT NOT NULL,
    Player_Position VARCHAR (15) NOT NULL,
    Games_Played INT DEFAULT '0',
    Goals INT DEFAULT '0',
    Assist INT DEFAULT '0',
    Goals_Ratio DECIMAL (1,1) DEFAULT '0.0',
    Yellow_Cards INT DEFAULT '0',
    Red_Cards INT DEFAULT '0',
    Clean_Sheets INT DEFAULT '0',
    Health_Status VARCHAR (10) NOT NULL,
    PRIMARY KEY (Player_ID),
    FOREIGN KEY (Player_ID) REFERENCES PLAYER(Player_ID)
);

#===========================================CLUB===========================================

INSERT INTO CLUB VALUES (1,'Arsenal', 'English Premiere League', 3);
INSERT INTO CLUB VALUES (2,'Manchester United', 'English Premiere League', 13);
INSERT INTO CLUB VALUES (3,'Chelsea', 'English Premiere League', 5);
INSERT INTO CLUB VALUES (4,'West Ham United', 'English Premiere League', 0);
INSERT INTO CLUB VALUES (5,'Barcelona ', 'La Liga', 27);
INSERT INTO CLUB VALUES (6,'Sevilla', 'La Liga', 1);
INSERT INTO CLUB VALUES (7,'Villareal', 'La Liga', 0);
INSERT INTO CLUB VALUES (8,'Borussia Dortmund', 'Bundesliga', 5);
INSERT INTO CLUB VALUES (9,'Wolfsburg', 'Bundesliga', 1);
INSERT INTO CLUB VALUES (10,'Leipzig', 'Bundesliga', 6);
INSERT INTO CLUB VALUES (11,'PSG', 'Ligue 1', 46);
INSERT INTO CLUB VALUES (12,'Marseille', 'Ligue 1', 25);
INSERT INTO CLUB VALUES (13,'Lyon', 'Ligue 1', 20);




# =====================================CURRENT_SEASON======================================



INSERT INTO CURRENT_SEASON VALUES (1, 3, 8, 3, 1, 27,  'W L W D W');
INSERT INTO CURRENT_SEASON VALUES (2, 6, 7, 0, 5, 21,  'W W L W W');
INSERT INTO CURRENT_SEASON VALUES (3, 10, 4, 4, 4,16,  'D W L D W');
INSERT INTO CURRENT_SEASON VALUES (4, 9, 5, 2, 5, 17,  'W L L L D');
INSERT INTO CURRENT_SEASON VALUES (5, 3, 9, 3, 1, 30,  'W W L W D');
INSERT INTO CURRENT_SEASON VALUES (6, 13, 2, 6, 4,12,  'D D D D D');
INSERT INTO CURRENT_SEASON VALUES (7, 3, 9, 3, 1, 30,  'W W L W D');
INSERT INTO CURRENT_SEASON VALUES (8, 3, 9, 3, 1, 30,  'W W L W D');
INSERT INTO CURRENT_SEASON VALUES (9, 3, 9, 3, 1, 30,  'W W L W D');
INSERT INTO CURRENT_SEASON VALUES (10, 4, 7, 2, 2, 23, 'W L W W D');
INSERT INTO CURRENT_SEASON VALUES (11, 1, 8, 3, 1, 27, 'W W W W W');
INSERT INTO CURRENT_SEASON VALUES (12, 10, 3, 4, 4,13, 'L D L W L');
INSERT INTO CURRENT_SEASON VALUES (13, 18, 1, 4, 6, 7, 'W D L D L');




# =========================================MANAGER========================================

INSERT INTO MANAGER VALUES(101, 1, 'Mikel Arteta', 'Spanish', 4, 0, 6);
INSERT INTO MANAGER VALUES(102, 2, 'Erik ten Hag', 'Dutch', 1, 0, 2);
INSERT INTO MANAGER VALUES(103, 3, 'Mauricio Pochettino', 'Argentine', 0, 0, 5);
INSERT INTO MANAGER VALUES(104, 4, 'David Moyes', 'Scottish', 3, 0, 14);
INSERT INTO MANAGER VALUES(105, 5, 'Xavi Hernández', 'Spanish', 2, 2, 3);
INSERT INTO MANAGER VALUES(106, 6, 'Diego Alonso', 'Uruguayan', 0, 2, 1);
INSERT INTO MANAGER VALUES(107, 7, 'Juan Jose Rojo Martin', 'Spanish', 0, 0, 0);
INSERT INTO MANAGER VALUES(108, 8, 'Edin Terzic', 'German',1, 5, 2);
INSERT INTO MANAGER VALUES(109, 9, 'Niko Kovač ', 'Croatian', 1, 4, 2);
INSERT INTO MANAGER VALUES(110, 10, 'Marco Rose', 'German', 1, 2, 5);
INSERT INTO MANAGER VALUES(111, 11, 'Luis Enrique', 'Spanish', 1, 10, 7);
INSERT INTO MANAGER VALUES(112, 12, 'Gennaro Ivan Gattuso', 'Italian', 1, 14,9);
INSERT INTO MANAGER VALUES(113, 13, 'Fabio Grosso', 'Italian', 1, 8,7);




# =========================================PLAYER======================================


INSERT INTO PLAYER VALUES(1101, 1, 'Martin Ødegaard', 3, 'Norwegian', '€ 35,000,000', 8 );
INSERT INTO PLAYER VALUES(1102, 1, 'Bukayo Saka', 5, 'English', 'Academy', 7 );
INSERT INTO PLAYER VALUES(1201, 2, 'Marcus Rashford', 8, 'English', '€ 120,000,000', 22 );
INSERT INTO PLAYER VALUES(1202, 2, 'André Onana Onana ', 1, 'Cameroonian', '€ 47,200,000', 5 );
INSERT INTO PLAYER VALUES(1301, 3, 'Thiago Silva', 3, 'Brazilian', '€ 42,000,000', 37 );
INSERT INTO PLAYER VALUES(1302, 3, 'Raheem Sterling', 1, 'English', '€ 47,500,000', 14 );
INSERT INTO PLAYER VALUES(1401, 4, 'Michail Antonio', 8, 'Jamaican', '€ 9,500,000', 5 );
INSERT INTO PLAYER VALUES(1402, 4, 'Saïd Benrahma', 2, 'Algerian', '€ 25,000,000', 5 );
INSERT INTO PLAYER VALUES(6776, 5, "Robert Lewandowski", 1, "Polish", "€ 45,000,000", 37);
INSERT INTO PLAYER VALUES(6777, 5, "Marc Andre Ter Stegen", 9, "German", "€ 75,000,000", 10);
INSERT INTO PLAYER VALUES(6778, 6, "Sergio Ramos", 1, "Spanish", "€ 4,000,000", 24);
INSERT INTO PLAYER VALUES(6779, 6, "Ivan Rakitic", 1, "Croatian", "€ 4,000,000", 7);
INSERT INTO PLAYER VALUES(6780, 7, "Gerard Moreno", 11, "Spanish", "€ 15,000,000", 3);
INSERT INTO PLAYER VALUES(6781, 7, "Juan Foyth", 7, "Argentine", "€ 42,000,000", 9);
INSERT INTO PLAYER VALUES(6782, 8, "Marco Reus", 11, "German", "€ 7,000,000", 17);
INSERT INTO PLAYER VALUES(6783, 8, "Mats Hummels", 4, "German", "€ 36,000,000", 14);
INSERT INTO PLAYER VALUES(6784, 9, "Maximilian Arnold", 12, "German", "€ 14,000,000", 7);
INSERT INTO PLAYER VALUES(6785, 9, "Koen Casteels", 8, "Belgian", "€ 8,000,000", 3);
INSERT INTO PLAYER VALUES(3001, 10, 'Xavi Simons', 1, 'Dutch', '€ 70,000,000' , 7);
INSERT INTO PLAYER VALUES(3002, 10, 'Péter Gulácsi', 8, 'Hungarian', '€ 3,500,000', 7);
INSERT INTO PLAYER VALUES(3101, 11, 'Kylian Mbappé', 6, 'French', '€ 180,000,000', 37);
INSERT INTO PLAYER VALUES(3102, 11, 'Gianluigi Donnarumma', 2, 'Italian', '€ 45,000,000', 5);
INSERT INTO PLAYER VALUES(3201, 12, 'Pierre-Emerick Aubameyang', 1, 'French', '€ 4,000,000', 10);
INSERT INTO PLAYER VALUES(3202, 12,  'Joaquin Correa', 1, 'Argentine', '€ 12,000,000', 7);
INSERT INTO PLAYER VALUES(3301, 13, 'Alexandre Lacazette', 8, 'French', '€ 12,000,000', 8);
INSERT INTO PLAYER VALUES(3302, 13, 'Dejan Lovren', 4, 'Croatian', '€ 2,500,000', 13);




# ===================================PLAYER_SEASONAL_STATS======================================


INSERT INTO PLAYER_SEASONAL_STATS VALUES (1101, 'midfielder', 9, 3, 1, 0.4, 1, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1102, 'Right-Winger', 11, 4, 4, 0.7, 1, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1201, 'Forward', 11, 1, 0, 0, 0, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1202, 'Goalkeeper', 12, 0, 0, 0, 3, 0, 4, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1301, 'Centre-Back', 12, 1, 0, 0, 2, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1302, 'Winger', 12, 4, 1, 0.4, 1, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1401, 'Forward', 12, 2, 2, 0.3, 2, 0, 0, 'Good' );  
INSERT INTO PLAYER_SEASONAL_STATS VALUES (1402, 'Left-Winger', 9, 0, 1, 0.1, 1, 0, 0, 'Good' );
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6776, "Forward", 11, 7, 3, 0.9, 3, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6777, "Goalkeeper", 13, 0, 0, 0, 1, 0, 4, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6778, "Defender", 4, 0, 0, 0, 2, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6779, "Midliefler", 11, 2, 1, 0.3, 3, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6780, "Forward", 11, 8, 1, 0.8, 0, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6781, "Defender", 9, 1, 0, 0.1, 1, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6782, "Midfielder", 9, 3, 1, 0.4, 1, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6783, "Defender", 10, 2, 0, 0.2, 3, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6784, "Midfielder", 10, 0, 0, 0, 4, 0, 0, "Good");
INSERT INTO PLAYER_SEASONAL_STATS VALUES (6785, "Goalkeeper", 8, 0, 0, 0, 0, 0, 2, "Good"); 
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3001, 'Midfielder', 11, 4, 7, 0, 1, 0, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3002, 'Goalkeeper', 5, 0, 0, 0, 0, 0, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3101, 'Forward', 11, 13, 1, 0.3, 2, 0, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3102, 'Goalkeeper', 12, 0, 0, 0, 2, 0, 6, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3201, 'Forward', 11, 1, 3, 0.4, 1, 0, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3202, 'Forward', 6, 0, 0, 0, 2, 0, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3301, 'Forward', 8, 3, 0, 0.4, 1, 1, 0, 'Good');
INSERT INTO PLAYER_SEASONAL_STATS VALUES (3302, 'Defender', 3, 0, 0, 0, 1, 0, 0, 'Good'); 




# =================================PLAYER_PREVIOUS_CLUBS========================================


INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(1101, 1, 1);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(1201, 2, 8);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(1301, 3, 2);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(1401, 4, 1);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(6776, 8, 2);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(6778, 11, 2);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(6779, 5, 6);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3001, 5, 9);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3001, 11, 3);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3201, 8, 5);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3201, 1, 4);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3201, 5, 1);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3202, 6, 2);
INSERT INTO PLAYER_PREVIOUS_CLUBS VALUES(3301, 1, 5);



#===============================MANAGER_PREVIOUS_TEAMS============================================


INSERT INTO MANAGER_PREVIOUS_TEAMS VALUES (101, 1, 0);
INSERT INTO MANAGER_PREVIOUS_TEAMS VALUES (102, 2, 5);
INSERT INTO MANAGER_PREVIOUS_TEAMS VALUES (103, 3, 1);
INSERT INTO MANAGER_PREVIOUS_TEAMS VALUES (104, 4, 1);
INSERT INTO MANAGER_PREVIOUS_TEAMS VALUES (111, 5, 3);



#=======================================VIEWS======================================================


CREATE VIEW BestStrikers_view AS
SELECT PLAYER.Player_Name, CLUB.Club_Name
FROM PLAYER
JOIN CLUB ON PLAYER.Club_ID = CLUB.Club_ID
WHERE PLAYER.Player_ID IN (SELECT Player_ID 
FROM PLAYER_SEASONAL_STATS
WHERE Goals_Ratio >= 0.6);


 CREATE VIEW Clean_Sheets_view AS
SELECT PLAYER.Player_Name, CLUB.Club_Name
FROM PLAYER
JOIN CLUB ON PLAYER.Club_ID = CLUB.Club_ID
WHERE PLAYER.Player_ID IN (SELECT Player_ID 
FROM PLAYER_SEASONAL_STATS
WHERE Player_Position = "Goalkeeper" AND Clean_Sheets > 0);

CREATE VIEW Championship_Points_view AS
SELECT CLUB.Club_ID, CLUB.Club_Name
FROM CURRENT_SEASON
JOIN CLUB ON CURRENT_SEASON.Club_ID = CLUB.Club_ID
ORDER BY points DESC;

CREATE VIEW Booking_Report_view AS
SELECT Player_Id, Player_Name
FROM PLAYER
WHERE PLAYER.Player_ID IN (SELECT Player_ID
FROM PLAYER_SEASONAL_STATS
WHERE Red_Cards = 0 AND Yellow_Cards <= 1);



CREATE VIEW PLAYER_PRICE_Report_View AS
SELECT Player_ID, Player_Name, Price
FROM PLAYER;