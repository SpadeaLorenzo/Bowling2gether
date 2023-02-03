CREATE TABLE match(
    code VARCHAR(10) PRIMARY KEY UNIQUE,
    players INT,
    data DATE,
    winner VARCHAR(25),
    turns INT,
    is_done boolean
);


CREATE TABLE player(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    score INT
    match_code VARCHAR(10),
    FOREIGN KEY match_code REFERENCES match(code)
);

CREATE TABLE rounds(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    score_one INT DEFAULT -1,
    score_two INT DEFAULT -1,
    player_id INT,
    match_code VARCHAR(10),
    FOREIGN KEY match_code REFERENCES match(code),
    FOREIGN KEY player_id REFERENCES player(id)
);

/*
 stored routine per eliminare ogni 3 partite
*/
