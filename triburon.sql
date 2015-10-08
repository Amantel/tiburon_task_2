/*Script tested with MySQL 5.6.16*/
/*Table creation*/
CREATE TABLE `test`.`triburon`(`Number` VARCHAR(12), `Status` SMALLINT, `Time` DATETIME ) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci; 
/*Data insertion*/ 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79008007060',1,'2015-01-01 00:00:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79008007060',2,'2015-01-01 00:02:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79008007060',1,'2015-01-01 00:04:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79008007060',2,'2015-01-01 00:04:30'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',1,'2015-01-02 12:03:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',2,'2015-01-02 12:03:45'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',1,'2015-01-02 12:05:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',2,'2015-01-02 12:06:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',1,'2015-01-02 12:07:00'); 
INSERT INTO `test`.`triburon` (`Number`,`Status`,`Time`) VALUES ('+79007006050',2,'2015-01-02 12:09:00'); 
 
/*SQL Query*/ 
SELECT `No телефона`,  DATE_FORMAT(`time_start`,'%d.%m.%Y %H:%i:%S') AS 'Время начала разговора', DATE_FORMAT(`time_end`,'%d.%m.%Y %H:%i:%S') AS 'Время окончания разговора', DATE_FORMAT(TIMEDIFF(time_end,time_start),'%iмин %Sсек') AS "Длительность" FROM (SELECT A.`Number` AS 'No телефона', (SELECT MAX(`Time`) FROM triburon B WHERE `status`=1 AND A.`Number`=B.`Number` AND A.`Time` > B.`Time`)  AS time_start  , A.`Time` AS time_end FROM triburon A WHERE `status`=2) AS final_table


/*Warning! If call takes longer than 59 minutes it does not work;*/
/*Warning! If number can make several parallel calls this does not work;*/