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
('Kiss Péter', 'peter1@email.hu', '+3611111111', 'user', NULL),
('Nagy Anna', 'anna2@email.hu', '+3611111112', 'user', NULL),
('Tóth László', 'laszlo3@email.hu', '+3611111113', 'user', NULL),
('Szabó Éva', 'eva4@email.hu', '+3611111114', 'user', NULL),
('Kovács Gábor', 'gabor5@email.hu', '+3611111115', 'user', NULL),
('Molnár Zoltán', 'zoltan6@email.hu', '+3611111116', 'user', NULL),
('Varga Júlia', 'julia7@email.hu', '+3611111117', 'user', NULL),
('Horváth Tamás', 'tamas8@email.hu', '+3611111118', 'user', NULL),
('Balogh Dóra', 'dora9@email.hu', '+3611111119', 'user', NULL),
('Papp András', 'andras10@email.hu', '+3611111120', 'user', NULL),
('Farkas Krisztina', 'kriszti11@email.hu', '+3611111121', 'user', NULL),
('Takács Márk', 'mark12@email.hu', '+3611111122', 'user', NULL),
('Juhász Rita', 'rita13@email.hu', '+3611111123', 'user', NULL),
('Mészáros Bence', 'bence14@email.hu', '+3611111124', 'user', NULL),
('Oláh Noémi', 'noemi15@email.hu', '+3611111125', 'user', NULL),
('Simon Ádám', 'adam16@email.hu', '+3611111126', 'user', NULL),
('Lakatos Eszter', 'eszter17@email.hu', '+3611111127', 'user', NULL),
('Németh Dávid', 'david18@email.hu', '+3611111128', 'user', NULL),
('Szalai Kata', 'kata19@email.hu', '+3611111129', 'user', NULL),
('Veres Bálint', 'balint20@email.hu', '+3611111130', 'user', NULL);

CREATE TABLE `esemeny` (
  `nev` varchar(20) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `idopont` date NOT NULL,
  `id` int NOT NULL,
  `leiras` varchar(300) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `kategoria` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `sorszam` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO `esemeny` (`nev`, `idopont`, `id`, `leiras`, `kategoria`, `sorszam`) VALUES
('Konferencia', '2026-05-10', 1, 'Nemzetközi tech konferencia', 'Technológia', NULL),
('Workshop', '2026-06-15', 2, 'Haladó SQL workshop', 'Oktatás', NULL),
('Fesztivál', '2026-07-20', 3, 'Nyári zenei fesztivál', 'Zene', NULL),
('Találkozó', '2026-08-05', 4, 'Startup üzleti találkozó', 'Üzlet', NULL),
('Sportnap', '2026-09-01', 5, 'Céges sportnap és versenyek', 'Sport', NULL);

CREATE TABLE `kapcsolo` (
  `telefonszam` varchar(15) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `id` int DEFAULT NULL,
  `szerep` tinyint(1) DEFAULT NULL,
  `sorszam` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO `kapcsolo` (`telefonszam`, `id`, `szerep`, `sorszam`) VALUES
('+3611111111', 1, 1, 1),
('+3611111112', 1, 0, 2),
('+3611111113', 1, 0, 3),
('+3611111114', 2, 1, 4),
('+3611111115', 2, 0, 5),
('+3611111116', 2, 0, 6),
('+3611111117', 3, 1, 7),
('+3611111118', 3, 0, 8),
('+3611111119', 3, 0, 9),
('+3611111120', 4, 1, 10),
('+3611111121', 4, 0, 11),
('+3611111122', 4, 0, 12),
('+3611111123', 5, 1, 13),
('+3611111124', 5, 0, 14),
('+3611111125', 5, 0, 15),
('+3611111126', 1, 0, 16),
('+3611111127', 2, 0, 17),
('+3611111128', 3, 0, 18),
('+3611111129', 4, 0, 19),
('+3611111130', 5, 0, 20);

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
