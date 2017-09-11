
CREATE DATABASE `sekolah` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sekolah`;

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `siswa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `nama_siswa` varchar(256) NOT NULL COMMENT 'Nama siswa',
  `kelamin` char(1) NOT NULL COMMENT 'Jenis kelamin',
  `tanggal_lahir` date NOT NULL COMMENT 'Tanggal lahir siswa',
  PRIMARY KEY (`siswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `siswa` (`siswa_id`, `nama_siswa`, `kelamin`, `tanggal_lahir`) VALUES
(4,	'David Owen Adwiguna',	'L',	'2001-11-18'),
(6,	'Elisabeth Tiara Maharani',	'P',	'1998-08-07'),
(7,	'Evan Tobias fds f dsf',	'L',	'1999-09-27'),
(9,	'Fransiska Setyawati',	'P',	'2000-09-11'),
(10,	'Harbert Yonathan',	'L',	'1998-12-03'),
(11,	'Irene Valentina Kosasih',	'L',	'1999-09-18'),
(12,	'Joice Angelika',	'P',	'1998-06-04'),
(13,	'Kevin Natanael',	'L',	'2001-12-12'),
(14,	'Marlina Herlambang',	'L',	'2000-02-08'),
(15,	'Neysa Gustin',	'P',	'2001-08-06'),
(16,	'Patrick Steven',	'L',	'1999-08-23'),
(17,	'Rosella Veltin',	'P',	'1998-03-16'),
(18,	'Steffanie Florentina Sutanto',	'P',	'1998-08-09'),
(19,	'Thadeus Raphael Gunawan',	'L',	'1998-12-01'),
(20,	'Timothy Elvin ',	'L',	'2000-10-01'),
(21,	'Veronica Margie Andriani',	'P',	'2000-07-21'),
(22,	'Vivian Justiana',	'P',	'2001-05-06'),
(23,	'Vivian Valentina',	'P',	'2001-06-05'),
(24,	'Yoel Anthony Sugianto',	'L',	'1999-12-07'),
(25,	'Yoga Christanto Aji',	'L',	'1998-01-25'),
(26,	'Catharina Rosa',	'P',	'2001-09-15'),
(27,	'Cecilia Antonius',	'P',	'1998-08-20'),
(28,	'Christian Douglas Hot Asi Parulian',	'L',	'2000-07-09'),
(29,	'Christina Noviyanti Wijaya',	'L',	'1999-06-08'),
(30,	'Citra Kurnia Putri',	'P',	'1999-10-03'),
(31,	'Cristiana Devina Wigono',	'P',	'1998-02-18'),
(32,	'Densel Febian',	'L',	'2000-03-28'),
(33,	'Erick Surya Ciputra',	'L',	'1999-05-14'),
(34,	'Ervan Jovian',	'L',	'1998-12-12'),
(35,	'Fendy Candhadinata',	'L',	'2001-10-13'),
(36,	'Graciella Anna Maria Fidela',	'P',	'1998-11-05'),
(37,	'Hans Christian Mulyawan',	'L',	'2000-09-24'),
(38,	'Jesse Jonathan',	'L',	'2001-02-11'),
(39,	'Johanes Farlan Susanto',	'L',	'2000-11-23'),
(40,	'Juan Benhard',	'L',	'1999-08-17'),
(41,	'Julia Anastasia Wijaya',	'L',	'1998-05-21'),
(42,	'Mayfilio Alby Jonathan Hamdani',	'L',	'2000-10-27'),
(43,	'Michael Sardo Nababan',	'L',	'2000-06-10'),
(44,	'Michelle Rosa Magdalena',	'L',	'1998-04-09'),
(45,	'Mikha Putra Wijaya',	'L',	'2000-04-04'),
(46,	'Nadia Anastasia Giovani',	'P',	'1999-04-01'),
(47,	'Tiara Kharisma Kristanto',	'P',	'1998-09-22'),
(48,	'Veren Gabriella Sunarto',	'P',	'1999-11-26'),
(49,	'Vincent Antonius',	'L',	'2001-04-22'),
(51,	'Andrea Reynalda',	'L',	'2000-09-23');


