DROP DATABASE IF EXISTS esemenyek;
CREATE DATABASE esemenyek
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE esemenyek;

CREATE TABLE kapcsolo(
    telefonszam varchar(12),
    id int,
    szerep boolean,
    sorszam int NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE emberek(
    nev varchar(30) NOT NULL,
    email varchar(50) NOT NULL,
    telefonszam varchar(12) NOT NULL PRIMARY KEY,
    szerep varchar(5) NOT NULL,
    sorszam int,
    FOREIGN KEY(sorszam)
    REFERENCES kapcsolo(sorszam)
);


CREATE TABLE esemeny(
    nev varchar(20) NOT NULL,
    idopont date NOT NULL,
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    leiras varchar(300),
    kategoria varchar(30) NOT NULL,
    sorszam int,
    FOREIGN KEY(sorszam)
    REFERENCES kapcsolo(sorszam)
);

