CREATE VIEW BestStrikers AS
SELECT Player.PlayerName, Club.ClubName
FROM Player
JOIN Club ON Player.clubId = Club.clubId
WHERE Player.PlayerId IN (SELECT PLAYERID 
FROM PLAYER_SEASONAL_STATS
WHERE 'G/A' >= 1.0);


CREATE VIEW Clean_Sheets AS
SELECT Player.PlayerName, Club.ClubName
FROM Player
JOIN Club ON Player.clubId = Club.clubId
WHERE Player.PlayerId IN (SELECT PLAYERID 
FROM PLAYER_SEASONAL_STATS
WHERE POSITION = “Goalkeeper” AND CLEAN_SHEETS > 0);

CREATE VIEW Championship_Points AS
SELECT Club.ClubID, Club.ClubName
FROM CURRENT_SEASON
JOIN Club ON CURRENT_SEASON.ClubId = Club.ClubID
ORDER BY Points DESC;

CREATE VIEW Booking_Report AS
SELECT PlayerId, PlayerName
FROM Player
WHERE PLAYER.PlayerId IN (SELECT PLAYERID
FROM PLAYER_SEASONAL_STATS
WHERE RED_CARDS = 0 AND YELLOW_CARDS <= 1);

CREATE VIEW Stats_Report AS
SELECT *
FROM PLAYER_SEASONAL_STATS
JOIN PLAYER ON Player.PlayerId = PLAYER_Seasonal_Stats.PlayerId;


CREATE VIEW PLAYER_PRICE_Report AS
SELECT PlayerId, PlayerName, Price
FROM Players;
