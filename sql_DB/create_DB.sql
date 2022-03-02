DROP DATABASE IF EXISTS `sportradar`;
CREATE DATABASE `sportradar`;
USE `sportradar`;

CREATE TABLE `impressions` (
  `impression_id` int(11) NOT NULL,
  `url_address` varchar(75) NOT NULL,
  `user_id` int(50) NOT NULL,
  `request_country` varchar(50) NOT NULL,
  `request_browser_name` varchar(50) NOT NULL,
  `imperession_timestamp` date NOT NULL,
  PRIMARY KEY (`impression_id`),
  KEY (`user_id`)
) ENGINE=InnoDB;

INSERT INTO `impressions` VALUES (1,'novacheck.com',123,'AT', 'firefox', '2022-01-01');
INSERT INTO `impressions` VALUES (2,'lawrence.net',134,'DE', 'chrome', '2021-05-14');
INSERT INTO `impressions` VALUES (3,'beautifulworld.com',561,'US', 'safari', '2021-09-13');
INSERT INTO `impressions` VALUES (4,'fbsucks.com',362,'US', 'brave', '2020-04-06');
INSERT INTO `impressions` VALUES (5,'twitter.com',321,'EG', 'edge', '2022-02-07');
INSERT INTO `impressions` VALUES (6,'nanometer.com',447,'FR', 'tor', '2022-01-14');
INSERT INTO `impressions` VALUES (7, 'blabla.com', 123, 'AT', 'firefox', '2022-02-10');
INSERT INTO `impressions` VALUES (8, 'scott.com', 321, 'EG', 'firefox', '2022-02-01');

CREATE TABLE `conversions` (
  `conversion_id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`conversion_id`),
  
  -- For each conversion there exists at least one impression
  CONSTRAINT `user_id`
  FOREIGN KEY (`user_id`) 
	REFERENCES `impressions`(`user_id`)

) ENGINE=InnoDB;
-- ALTER TABLE `conversions` 
--    ADD FOREIGN KEY (`user_id`) REFERENCES `impressions`(`user_id`);
INSERT INTO `conversions` VALUES (1,123,'2022-01-01');
INSERT INTO `conversions` VALUES (2,321,'2022-02-07');
INSERT INTO `conversions` VALUES (3,134,'2021-05-14');
INSERT INTO `conversions` VALUES (4,447,'2022-01-14');
INSERT INTO `conversions` VALUES (5,321,'2022-02-01');