DROP DATABASE IF EXISTS esemenyek;
CREATE DATABASE esemenyek
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE esemenyek;

CREATE TABLE `emberek` (
  `nev` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telefonszam` varchar(15) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `szerep` varchar(5) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `sorszam` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO `emberek` (`nev`, `email`, `telefonszam`, `szerep`, `sorszam`) VALUES
('Kiss Péter', 'peter1@email.hu', '+3611111111', 'user', AUTO_INCREMENT),
('Nagy Anna', 'anna2@email.hu', '+3611111112', 'user',  AUTO_INCREMENT),
('Tóth László', 'laszlo3@email.hu', '+3611111113', 'user',  AUTO_INCREMENT),
('Szabó Éva', 'eva4@email.hu', '+3611111114', 'user',  AUTO_INCREMENT),
('Kovács Gábor', 'gabor5@email.hu', '+3611111115', 'user',  AUTO_INCREMENT),
('Molnár Zoltán', 'zoltan6@email.hu', '+3611111116', 'user',  AUTO_INCREMENT),
('Varga Júlia', 'julia7@email.hu', '+3611111117', 'user',  AUTO_INCREMENT),
('Horváth Tamás', 'tamas8@email.hu', '+3611111118', 'user',  AUTO_INCREMENT),
('Balogh Dóra', 'dora9@email.hu', '+3611111119', 'user',  AUTO_INCREMENT),
('Papp András', 'andras10@email.hu', '+3611111120', 'user',  AUTO_INCREMENT),
('Farkas Krisztina', 'kriszti11@email.hu', '+3611111121', 'user',  AUTO_INCREMENT),
('Takács Márk', 'mark12@email.hu', '+3611111122', 'user',  AUTO_INCREMENT),
('Juhász Rita', 'rita13@email.hu', '+3611111123', 'user',  AUTO_INCREMENT),
('Mészáros Bence', 'bence14@email.hu', '+3611111124', 'user',  AUTO_INCREMENT),
('Oláh Noémi', 'noemi15@email.hu', '+3611111125', 'user',  AUTO_INCREMENT),
('Simon Ádám', 'adam16@email.hu', '+3611111126', 'user',  AUTO_INCREMENT),
('Lakatos Eszter', 'eszter17@email.hu', '+3611111127', 'user',  AUTO_INCREMENT),
('Németh Dávid', 'david18@email.hu', '+3611111128', 'user',  AUTO_INCREMENT),
('Szalai Kata', 'kata19@email.hu', '+3611111129', 'user',  AUTO_INCREMENT),
('Veres Bálint', 'balint20@email.hu', '+3611111130', 'user',  AUTO_INCREMENT);

CREATE TABLE `esemeny` (
  `nev` varchar(20) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `idopont` date NOT NULL,
  `id` int NOT NULL,
  `leiras` varchar(300) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `kategoria` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `sorszam` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO `esemeny` (`nev`, `idopont`, `id`, `leiras`, `kategoria`, `sorszam`) VALUES
('Konferencia', '2026-05-10', 1, 'Nemzetközi tech konferencia', 'Technológia',  AUTO_INCREMENT),
('Workshop', '2026-06-15', 2, 'Haladó SQL workshop', 'Oktatás',  AUTO_INCREMENT),
('Fesztivál', '2026-07-20', 3, 'Nyári zenei fesztivál', 'Zene',  AUTO_INCREMENT),
('Találkozó', '2026-08-05', 4, 'Startup üzleti találkozó', 'Üzlet',  AUTO_INCREMENT),
('Sportnap', '2026-09-01', 5, 'Céges sportnap és versenyek', 'Sport', AUTO_INCREMENTNULL);

CREATE TABLE `kapcsolo` (
  `telefonszam` varchar(15) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `id` int DEFAULT NULL,
  `szerep` tinyint(1) DEFAULT NULL,
  `sorszam` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO `kapcsolo` (`telefonszam`, `id`, `szerep`, `sorszam`) VALUES
('+3611111111', 1, 1,  AUTO_INCREMENT),
('+3611111112', 1, 0,  AUTO_INCREMENT),
('+3611111113', 1, 0,  AUTO_INCREMENT),
('+3611111114', 2, 1,  AUTO_INCREMENT),
('+3611111115', 2, 0,  AUTO_INCREMENT),
('+3611111116', 2, 0,  AUTO_INCREMENT),
('+3611111117', 3, 1,  AUTO_INCREMENT),
('+3611111118', 3, 0,  AUTO_INCREMENT),
('+3611111119', 3, 0,  AUTO_INCREMENT),
('+3611111120', 4, 1,  AUTO_INCREMENT),
('+3611111121', 4, 0,  AUTO_INCREMENT),
('+3611111122', 4, 0,  AUTO_INCREMENT),
('+3611111123', 5, 1,  AUTO_INCREMENT),
('+3611111124', 5, 0,  AUTO_INCREMENT),
('+3611111125', 5, 0,  AUTO_INCREMENT),
('+3611111126', 1, 0,  AUTO_INCREMENT),
('+3611111127', 2, 0,  AUTO_INCREMENT),
('+3611111128', 3, 0,  AUTO_INCREMENT),
('+3611111129', 4, 0,  AUTO_INCREMENT),
('+3611111130', 5, 0,  AUTO_INCREMENT);

ALTER TABLE `emberek`
  ADD PRIMARY KEY (`telefonszam`),
  ADD KEY `sorszam` (`sorszam`);

ALTER TABLE `esemeny`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorszam` (`sorszam`);

ALTER TABLE `kapcsolo`
  ADD PRIMARY KEY (`sorszam`);

ALTER TABLE `esemeny`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `kapcsolo`
  MODIFY `sorszam` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `emberek`
  ADD CONSTRAINT `emberek_ibfk_1` FOREIGN KEY (`sorszam`) REFERENCES `kapcsolo` (`sorszam`);

ALTER TABLE `esemeny`
  ADD CONSTRAINT `esemeny_ibfk_1` FOREIGN KEY (`sorszam`) REFERENCES `kapcsolo` (`sorszam`);
COMMIT;
