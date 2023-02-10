CREATE TABLE matches (
    code VARCHAR(10) PRIMARY KEY,
    players INT,
    data_match DATE,
    winner VARCHAR(25),
    turns INT,
    is_done TINYINT
);


CREATE TABLE player(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    score INT,
    match_code VARCHAR(10),
    FOREIGN KEY (match_code) REFERENCES  matches(code)
);

CREATE TABLE rounds(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    score_one INT DEFAULT -1,
    score_two INT DEFAULT -1,
    player_id INT,
    match_code VARCHAR(10),
    FOREIGN KEY (match_code) REFERENCES matches(code),
    FOREIGN KEY (player_id) REFERENCES player(id)
);

/*
 stored routine per eliminare ogni 3 partite
*/
