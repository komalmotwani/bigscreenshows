/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.0.67-community-nt : Database - ticketdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ticketdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ticketdb`;

/*Table structure for table `admin_data` */

DROP TABLE IF EXISTS `admin_data`;

CREATE TABLE `admin_data` (
  `user_id` int(10) NOT NULL,
  `username` varchar(40) default NULL,
  `password` varchar(40) default NULL,
  `email` varchar(40) default NULL,
  `phone` int(15) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_data` */

insert  into `admin_data`(`user_id`,`username`,`password`,`email`,`phone`) values (1,'kamal','jangir','jangirkamal21@gmail.com',2147483647);

/*Table structure for table `cinema_master` */

DROP TABLE IF EXISTS `cinema_master`;

CREATE TABLE `cinema_master` (
  `cinema_id` int(20) NOT NULL,
  `cinema_name` varchar(40) default NULL,
  `medium` varchar(40) default NULL,
  `isLive` varchar(10) default NULL,
  PRIMARY KEY  (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cinema_master` */

insert  into `cinema_master`(`cinema_id`,`cinema_name`,`medium`,`isLive`) values (13254192,'EP','English','active'),(38954214,'EP','English','active'),(67686123,'EP','English','active');

/*Table structure for table `city_master` */

DROP TABLE IF EXISTS `city_master`;

CREATE TABLE `city_master` (
  `city_id` int(20) NOT NULL auto_increment,
  `state_id` int(20) NOT NULL,
  `city` varchar(40) default NULL,
  PRIMARY KEY  (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

/*Data for the table `city_master` */

insert  into `city_master`(`city_id`,`state_id`,`city`) values (123,1,'jaipur'),(124,2,'chandigarh');

/*Table structure for table `movie_master` */

DROP TABLE IF EXISTS `movie_master`;

CREATE TABLE `movie_master` (
  `movie_id` int(20) NOT NULL auto_increment,
  `movie_name` varchar(40) default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `image` blob,
  `rating` double(10,1) default NULL,
  PRIMARY KEY  (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `movie_master` */

insert  into `movie_master`(`movie_id`,`movie_name`,`start_date`,`end_date`,`image`,`rating`) values (30,'Avengers','2015-12-31','2015-12-31',NULL,5.0),(31,'aaaaaa','2015-12-31','2015-12-31',NULL,5.0),(32,'ABS','2015-12-31','2015-12-31',NULL,5.0);

/*Table structure for table `show_time` */

DROP TABLE IF EXISTS `show_time`;

CREATE TABLE `show_time` (
  `show_time_id` int(20) NOT NULL,
  `time` varchar(10) NOT NULL,
  PRIMARY KEY  (`show_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `show_time` */

insert  into `show_time`(`show_time_id`,`time`) values (1,'09:00:00 A'),(2,'09:30:00 A'),(3,'12:00:00 P'),(4,'12:30:00 P'),(5,'03:00:00 P'),(6,'03:30:00 P'),(7,'06:00:00 P'),(8,'06:30:00 P'),(9,'09:00:00 P'),(10,'09:30:00 P');

/*Table structure for table `state_master` */

DROP TABLE IF EXISTS `state_master`;

CREATE TABLE `state_master` (
  `state_id` int(20) NOT NULL,
  `state_name` varchar(40) default NULL,
  PRIMARY KEY  (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `state_master` */

insert  into `state_master`(`state_id`,`state_name`) values (1,'Rajasthan'),(2,'Punjab'),(3,'Hariyana'),(4,'UP'),(5,'MP'),(6,'Gujrat');

/*Table structure for table `theatre_of_city` */

DROP TABLE IF EXISTS `theatre_of_city`;

CREATE TABLE `theatre_of_city` (
  `theatre_id` int(20) NOT NULL,
  `city_id` int(20) default NULL,
  `cinema_id` int(20) default NULL,
  `row` int(10) default NULL,
  `col` int(10) default NULL,
  PRIMARY KEY  (`theatre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `theatre_of_city` */

insert  into `theatre_of_city`(`theatre_id`,`city_id`,`cinema_id`,`row`,`col`) values (128915,123,13254192,20,20),(136796,123,67686123,20,20),(378282,124,38954214,20,20);

/*Table structure for table `theatre_show_time` */

DROP TABLE IF EXISTS `theatre_show_time`;

CREATE TABLE `theatre_show_time` (
  `theatre_show_time_id` int(20) NOT NULL,
  `theatre_id` int(20) default NULL,
  `show_time_id` int(20) default NULL,
  `cinema_id` int(20) default NULL,
  `movie_id` int(10) default NULL,
  PRIMARY KEY  (`theatre_show_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `theatre_show_time` */

insert  into `theatre_show_time`(`theatre_show_time_id`,`theatre_id`,`show_time_id`,`cinema_id`,`movie_id`) values (6513144,378282,1,38954214,31),(8332568,136796,1,67686123,30),(9429793,128915,1,13254192,32);

/*Table structure for table `ticket_rate` */

DROP TABLE IF EXISTS `ticket_rate`;

CREATE TABLE `ticket_rate` (
  `ticket_rate_id` int(20) NOT NULL auto_increment,
  `theatre_id` int(20) default NULL,
  `type` varchar(20) default NULL,
  `price` int(10) default NULL,
  `rows` int(10) default NULL,
  PRIMARY KEY  (`ticket_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

/*Data for the table `ticket_rate` */

insert  into `ticket_rate`(`ticket_rate_id`,`theatre_id`,`type`,`price`,`rows`) values (79,136796,'Platinum',500,5),(80,136796,'Gold',400,10),(81,136796,'Silver',300,5),(82,378282,'Platinum',500,5),(83,378282,'Gold',400,10),(84,378282,'Silver',200,5),(85,128915,'Platinum',500,5),(86,128915,'Gold',400,10),(87,128915,'Silver',300,5);

/*Table structure for table `user_selected` */

DROP TABLE IF EXISTS `user_selected`;

CREATE TABLE `user_selected` (
  `user_select_seat_id` int(20) NOT NULL auto_increment,
  `user_id` int(20) default NULL,
  `theatre_id` int(20) default NULL,
  `cinema_id` int(20) default NULL,
  `show_time_id` int(20) default NULL,
  `seat_no` varchar(40) default NULL,
  `selected_date` date default NULL,
  `booking_id` int(20) default NULL,
  PRIMARY KEY  (`user_select_seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `user_selected` */

/*Table structure for table `user_table` */

DROP TABLE IF EXISTS `user_table`;

CREATE TABLE `user_table` (
  `user_id` int(20) NOT NULL,
  `username` varchar(40) default NULL,
  `password` varchar(40) default NULL,
  `email` varchar(40) default NULL,
  `phone` varchar(40) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_table` */

insert  into `user_table`(`user_id`,`username`,`password`,`email`,`phone`) values (1,'kamal','jangir','jangirkamal21@gmail.com','9782282386');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
