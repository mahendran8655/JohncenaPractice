#SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
#SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
#SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
#
#DROP SCHEMA IF EXISTS `pss2_6_4_snapshot` ;
#CREATE SCHEMA IF NOT EXISTS `pss2_6_4_snapshot` DEFAULT CHARACTER SET latin1 ;
#USE `pss2_6_4_snapshot` ;
#
#-- -----------------------------------------------------
#-- Table `baseline_model`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `baseline_model` ;
#
#CREATE  TABLE IF NOT EXISTS `baseline_model` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `calcImplClass` LONGTEXT NULL DEFAULT NULL ,
#  `dayPickerImplClass` LONGTEXT NULL DEFAULT NULL ,
#  `description` LONGTEXT NULL DEFAULT NULL ,
#  `implClass` LONGTEXT NULL DEFAULT NULL ,
#  `name` LONGTEXT NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `baseline_model` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `baseline_config`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `baseline_config` ;
#
#CREATE  TABLE IF NOT EXISTS `baseline_config` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `description` LONGTEXT NULL DEFAULT NULL ,
#  `excludeAbnormalDayImplClass` LONGTEXT NULL DEFAULT NULL ,
#  `excludeHoliday` BIT(1) NULL DEFAULT NULL ,
#  `excludeHolidayFromCalc` BIT(1) NULL DEFAULT NULL ,
#  `excludedDaysOfWeek` INT(11) NULL DEFAULT NULL ,
#  `excludedDaysOfWeekFromCalc` INT(11) NULL DEFAULT NULL ,
#  `name` LONGTEXT NOT NULL ,
#  `owner_uuid` VARCHAR(32) NULL DEFAULT NULL,
#  `baseline_model_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK2D82F27C44B725B3`
#    FOREIGN KEY (`baseline_model_uuid` )
#    REFERENCES `baseline_model` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `baseline_config` (`uuid` ASC) ;
#
#CREATE INDEX `FK2D82F27C44B725B3` ON `baseline_config` (`baseline_model_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `bid_config`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `bid_config` ;
#
#CREATE  TABLE IF NOT EXISTS `bid_config` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `acceptTimeoutPeriodM` INT(11) NULL DEFAULT NULL ,
#  `defaultBidKW` DOUBLE NULL DEFAULT NULL ,
#  `drasBidding` BIT(1) NULL DEFAULT NULL ,
#  `drasRespondByPeriodM` INT(11) NULL DEFAULT NULL ,
#  `minBidKW` DOUBLE NULL DEFAULT NULL ,
#  `minConsectutiveBlocks` INT(11) NULL DEFAULT NULL ,
#  `respondByTimeH` INT(11) NULL DEFAULT NULL ,
#  `respondByTimeM` INT(11) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `bid_config` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `bid_block`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `bid_block` ;
#
#CREATE  TABLE IF NOT EXISTS `bid_block` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTimeH` INT(11) NULL DEFAULT NULL ,
#  `endTimeM` INT(11) NULL DEFAULT NULL ,
#  `startTimeH` INT(11) NULL DEFAULT NULL ,
#  `startTimeM` INT(11) NULL DEFAULT NULL ,
#  `bid_config_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKAF3132CBE97E185C`
#    FOREIGN KEY (`bid_config_uuid` )
#    REFERENCES `bid_config` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `bid_block` (`uuid` ASC) ;
#
#CREATE INDEX `FKAF3132CBE97E185C` ON `bid_block` (`bid_config_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program` ;
#
#CREATE  TABLE IF NOT EXISTS `program` (
#  `programType` VARCHAR(64) NOT NULL ,
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `autoAccept` BIT(1) NULL DEFAULT NULL ,
#  `autoRepeatTimeOfDay` TIME NULL DEFAULT NULL ,
#  `beginEffectiveTime` DATETIME NULL DEFAULT NULL ,
#  `className` VARCHAR(255) NULL DEFAULT NULL ,
#  `description` VARCHAR(255) NULL DEFAULT NULL ,
#  `endEffectiveTime` DATETIME NULL DEFAULT NULL ,
#  `lastErrorOpContact` DATETIME NULL DEFAULT NULL ,
#  `manualCreatable` BIT(1) NULL DEFAULT NULL ,
#  `maxDurationM` INT(11) NULL DEFAULT NULL ,
#  `maxEndTimeH` INT(11) NULL DEFAULT NULL ,
#  `maxEndTimeM` INT(11) NULL DEFAULT NULL ,
#  `maxIssueTimeH` INT(11) NULL DEFAULT NULL ,
#  `maxIssueTimeM` INT(11) NULL DEFAULT NULL ,
#  `maxStartTimeH` INT(11) NULL DEFAULT NULL ,
#  `maxStartTimeM` INT(11) NULL DEFAULT NULL ,
#  `minDurationM` INT(11) NULL DEFAULT NULL ,
#  `minEndTimeH` INT(11) NULL DEFAULT NULL ,
#  `minEndTimeM` INT(11) NULL DEFAULT NULL ,
#  `minIssueToStartM` INT(11) NULL DEFAULT NULL ,
#  `minStartTimeH` INT(11) NULL DEFAULT NULL ,
#  `minStartTimeM` INT(11) NULL DEFAULT NULL ,
#  `mustIssueBDBE` BIT(1) NULL DEFAULT NULL ,
#  `name` VARCHAR(255) NULL DEFAULT NULL ,
#  `notificationParam1` VARCHAR(255) NULL DEFAULT NULL ,
#  `pendingTimeDBEH` INT(11) NULL DEFAULT NULL ,
#  `pendingTimeDBEM` INT(11) NULL DEFAULT NULL ,
#  `priority` INT(11) NOT NULL ,
#  `programState` INT(11) NULL DEFAULT NULL ,
#  `repeatingEvents` BIT(1) NULL DEFAULT NULL ,
#  `testProgram` BIT(1) NULL DEFAULT NULL ,
#  `uiConfigureEventString` VARCHAR(255) NULL DEFAULT NULL ,
#  `uiConfigureProgramString` VARCHAR(255) NULL DEFAULT NULL ,
#  `uiScheduleEventString` VARCHAR(255) NULL DEFAULT NULL ,
#  `utilityProgramName` VARCHAR(255) NULL DEFAULT NULL ,
#  `validatorClass` VARCHAR(255) NULL DEFAULT NULL ,
#  `validatorConfigFile` VARCHAR(255) NULL DEFAULT NULL ,
#  `bid_config_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKED8F1E84E97E185C`
#    FOREIGN KEY (`bid_config_uuid` )
#    REFERENCES `bid_config` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program` (`uuid` ASC) ;
#
#CREATE UNIQUE INDEX `priority` ON `program` (`priority` ASC) ;
#
#CREATE INDEX `FKED8F1E84E97E185C` ON `program` (`bid_config_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_participant_constraint`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_participant_constraint` ;
#
#CREATE  TABLE IF NOT EXISTS `program_participant_constraint` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `activeAction` VARCHAR(60) NULL DEFAULT NULL ,
#  `consecutiveAction` VARCHAR(60) NULL DEFAULT NULL ,
#  `durationAction` VARCHAR(60) NULL DEFAULT NULL ,
#  `maxActive` DATETIME NULL DEFAULT NULL ,
#  `maxConsecutiveD` INT(11) NULL DEFAULT NULL ,
#  `maxDuration` DATETIME NULL DEFAULT NULL ,
#  `maxNotify` DATETIME NULL DEFAULT NULL ,
#  `minActive` DATETIME NULL DEFAULT NULL ,
#  `minDuration` DATETIME NULL DEFAULT NULL ,
#  `minNotify` DATETIME NULL DEFAULT NULL ,
#  `notifyAction` VARCHAR(60) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_participant_constraint` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `participant`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `participant` ;
#
#CREATE  TABLE IF NOT EXISTS `participant` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `account` VARCHAR(128) NOT NULL ,
#  `activated` BIT(1) NOT NULL ,
#  `address` VARCHAR(128) NULL DEFAULT NULL ,
#  `client` BIT(1) NOT NULL ,
#  `commTime` DATETIME NULL DEFAULT NULL ,
#  `dataEnabler` BIT(1) NULL DEFAULT NULL ,
#  `feedback` BIT(1) NOT NULL ,
#  `firstName` VARCHAR(45) NULL DEFAULT NULL ,
#  `gridLocation` VARCHAR(45) NULL DEFAULT NULL ,
#  `hostAddress` LONGTEXT NULL DEFAULT NULL ,
#  `lastName` VARCHAR(45) NULL DEFAULT NULL ,
#  `lastPrice` DOUBLE NOT NULL ,
#  `latitude` DOUBLE NOT NULL ,
#  `longitude` DOUBLE NOT NULL ,
#  `manualControl` BIT(1) NOT NULL ,
#  `manualControlExpires` DATETIME NULL DEFAULT NULL ,
#  `meterId` VARCHAR(128) NULL DEFAULT NULL ,
#  `meterName` VARCHAR(128) NULL DEFAULT NULL ,
#  `notificationLevel` INT(11) NULL DEFAULT NULL ,
#  `offlineWarning` BIT(1) NOT NULL ,
#  `parent` VARCHAR(64) NULL DEFAULT NULL ,
#  `participantName` VARCHAR(64) NOT NULL ,
#  `shedPerHourKW` DOUBLE NOT NULL ,
#  `status` SMALLINT(6) NULL DEFAULT NULL ,
#  `testAccount` BIT(1) NOT NULL ,
#  `type` TINYINT(4) NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `participant` (`uuid` ASC) ;
#
#CREATE UNIQUE INDEX `participantName` ON `participant` (`participantName` ASC, `client` ASC) ;
#
#CREATE UNIQUE INDEX `account` ON `participant` (`account` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_participant`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_participant` ;
#
#CREATE  TABLE IF NOT EXISTS `program_participant` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `clientConfig` INT(11) NULL DEFAULT NULL ,
#  `programParticipantState` INT(11) NULL DEFAULT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  `program_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK6E0BC5F8A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FK6E0BC5F82BE2B827`
#    FOREIGN KEY (`program_participant_uuid` )
#    REFERENCES `program_participant_constraint` (`uuid` ),
#  CONSTRAINT `FK6E0BC5F83DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_participant` (`uuid` ASC) ;
#
#CREATE INDEX `FK6E0BC5F83DE22BD0` ON `program_participant` (`participant_uuid` ASC) ;
#
#CREATE INDEX `FK6E0BC5F82BE2B827` ON `program_participant` (`program_participant_uuid` ASC) ;
#
#CREATE INDEX `FK6E0BC5F8A5F74041` ON `program_participant` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `bid_level_mapping`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `bid_level_mapping` ;
#
#CREATE  TABLE IF NOT EXISTS `bid_level_mapping` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `high` VARCHAR(45) NOT NULL ,
#  `moderate` VARCHAR(45) NOT NULL ,
#  `normal` VARCHAR(45) NOT NULL ,
#  `timeBlock` VARCHAR(45) NOT NULL ,
#  `program_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK46F9E751EB5C502A`
#    FOREIGN KEY (`program_participant_uuid` )
#    REFERENCES `program_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `bid_level_mapping` (`uuid` ASC) ;
#
#CREATE INDEX `FK46F9E751EB5C502A` ON `bid_level_mapping` (`program_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `constraint_invalid_date`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `constraint_invalid_date` ;
#
#CREATE  TABLE IF NOT EXISTS `constraint_invalid_date` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `invalidDate` DATETIME NOT NULL ,
#  `program_participant_constraint_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKE2BEDC186D58BB1B`
#    FOREIGN KEY (`program_participant_constraint_uuid` )
#    REFERENCES `program_participant_constraint` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `constraint_invalid_date` (`uuid` ASC) ;
#
#CREATE INDEX `FKE2BEDC186D58BB1B` ON `constraint_invalid_date` (`program_participant_constraint_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `message_filter_setting`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `message_filter_setting` ;
#
#CREATE  TABLE IF NOT EXISTS `message_filter_setting` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `cleanMsgHour` INT(11) NULL DEFAULT NULL ,
#  `cleanMsgMinute` INT(11) NULL DEFAULT NULL ,
#  `duration` INT(11) NULL DEFAULT NULL ,
#  `filterStatus` INT(11) NULL DEFAULT NULL ,
#  `frequency` INT(11) NULL DEFAULT NULL ,
#  `msgExpireTime` INT(11) NULL DEFAULT NULL ,
#  `msgThreshold` INT(11) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `message_filter_setting` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `contact`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `contact` ;
#
#CREATE  TABLE IF NOT EXISTS `contact` (
#  `DTYPE` VARCHAR(31) NOT NULL ,
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `address` VARCHAR(255) NULL DEFAULT NULL ,
#  `commNotification` BIT(1) NULL DEFAULT NULL ,
#  `contactState` INT(11) NULL DEFAULT NULL ,
#  `contactType` VARCHAR(255) NULL DEFAULT NULL ,
#  `description` VARCHAR(255) NULL DEFAULT NULL ,
#  `eventNotification` VARCHAR(75) NULL DEFAULT NULL ,
#  `externalContact` BIT(1) NULL DEFAULT NULL ,
#  `firstName` VARCHAR(255) NULL DEFAULT NULL ,
#  `lastName` VARCHAR(255) NULL DEFAULT NULL ,
#  `offSeasonNotiHours` DOUBLE NULL DEFAULT NULL ,
#  `offlineError` BIT(1) NULL DEFAULT NULL ,
#  `onSeasonNotiHours` DOUBLE NULL DEFAULT NULL ,
#  `ownerType` VARCHAR(64) NULL DEFAULT NULL ,
#  `priority` INT(11) NULL DEFAULT NULL ,
#  `supportType` VARCHAR(255) NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NULL DEFAULT NULL ,
#  `message_filter_setting_uuid` VARCHAR(32) NOT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK38B724203DE6DA1E`
#    FOREIGN KEY (`message_filter_setting_uuid` )
#    REFERENCES `message_filter_setting` (`uuid` ),
#  CONSTRAINT `FK38B724203DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ),
#  CONSTRAINT `FK38B72420A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `contact` (`uuid` ASC) ;
#
#CREATE INDEX `FK38B724203DE22BD0` ON `contact` (`participant_uuid` ASC) ;
#
#CREATE INDEX `FK38B72420A5F74041` ON `contact` (`program_uuid` ASC) ;
#
#CREATE INDEX `FK38B724203DE6DA1E` ON `contact` (`message_filter_setting_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `contacts_offline_error`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `contacts_offline_error` ;
#
#CREATE  TABLE IF NOT EXISTS `contacts_offline_error` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#?  `contactsUuid` VARCHAR(255) NULL DEFAULT NULL ,
#  `offlineError` BIT(1) NOT NULL ,
#?  `participantUuid` VARCHAR(255) NULL DEFAULT NULL ,
#  `programName` VARCHAR(255) NULL DEFAULT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  `contact_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK1DF2B1C0A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FK1DF2B1C03C0C52F0`
#    FOREIGN KEY (`contact_uuid` )
#    REFERENCES `contact` (`uuid` ),
#  CONSTRAINT `FK1DF2B1C03DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `contacts_offline_error` (`uuid` ASC) ;
#
#CREATE INDEX `FK1DF2B1C03DE22BD0` ON `contacts_offline_error` (`participant_uuid` ASC) ;
#
#CREATE INDEX `FK1DF2B1C03C0C52F0` ON `contacts_offline_error` (`contact_uuid` ASC) ;
#
#CREATE INDEX `FK1DF2B1C0A5F74041` ON `contacts_offline_error` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `custom_rule`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `custom_rule` ;
#
#CREATE  TABLE IF NOT EXISTS `custom_rule` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endDateTime` DATETIME NULL DEFAULT NULL ,
#  `mode` VARCHAR(60) NULL DEFAULT NULL ,
#  `operator` VARCHAR(60) NULL DEFAULT NULL ,
#  `sortOrder` INT(11) NULL DEFAULT NULL ,
#  `source` VARCHAR(60) NULL DEFAULT NULL ,
#  `startDateTime` DATETIME NULL DEFAULT NULL ,
#  `variableName` VARCHAR(60) NULL DEFAULT NULL ,
#  `variableValue` DOUBLE NULL DEFAULT NULL ,
#  `program_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK960C430AEB5C502A`
#    FOREIGN KEY (`program_participant_uuid` )
#    REFERENCES `program_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `custom_rule` (`uuid` ASC) ;
#
#CREATE INDEX `FK960C430AEB5C502A` ON `custom_rule` (`program_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `datasource`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `datasource` ;
#
#CREATE  TABLE IF NOT EXISTS `datasource` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `enabled` BIT(1) NULL DEFAULT NULL ,
#  `name` VARCHAR(255) NOT NULL ,
#  `ownerID` VARCHAR(64) NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `datasource` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `dataset`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `dataset` ;
#
#CREATE  TABLE IF NOT EXISTS `dataset` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `calcImplClass` VARCHAR(128) NULL DEFAULT NULL ,
#  `datasetPeriod` BIGINT(20) NOT NULL ,
#  `name` VARCHAR(128) NOT NULL ,
#  `sync` BIT(1) NOT NULL ,
#  `unit` VARCHAR(45) NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `dataset` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `dataentry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `dataentry` ;
#
#CREATE  TABLE IF NOT EXISTS `dataentry` (
#  `DTYPE` VARCHAR(31) NOT NULL ,
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `actual` BIT(1) NULL DEFAULT NULL ,
#  `dataEntrytime` DATETIME NOT NULL ,
#  `dataEntryValue` DOUBLE NULL DEFAULT NULL ,
#  `stringValue` VARCHAR(128) NULL DEFAULT NULL ,
#  `valueType` VARCHAR(255) NOT NULL ,
#  `dataset_uuid` VARCHAR(32) NOT NULL ,
#  `datasource_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKEAA95308731C25B6`
#    FOREIGN KEY (`datasource_uuid` )
#    REFERENCES `datasource` (`uuid` ),
#  CONSTRAINT `FKEAA953083DDDC31E`
#    FOREIGN KEY (`dataset_uuid` )
#    REFERENCES `dataset` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `dataentry` (`uuid` ASC) ;
#
#CREATE INDEX `FKEAA953083DDDC31E` ON `dataentry` (`dataset_uuid` ASC) ;#
#
#CREATE INDEX `FKEAA95308731C25B6` ON `dataentry` (`datasource_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `db_version`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `db_version` ;
#
#CREATE  TABLE IF NOT EXISTS `db_version` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `dateApplied` DATETIME NOT NULL ,
#  `upgradeScriptFilename` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `db_version` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event` ;
#
#CREATE  TABLE IF NOT EXISTS `event` (
#  `DTYPE` VARCHAR(31) NOT NULL ,
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTime` DATETIME NOT NULL ,
#  `eventName` VARCHAR(64) NOT NULL ,
#  `issuedTime` DATETIME NOT NULL ,
#  `manual` BIT(1) NOT NULL ,
#  `nearTime` DATETIME NOT NULL ,
#  `receivedTime` DATETIME NOT NULL ,
#  `startTime` DATETIME NOT NULL ,
#  `status` VARCHAR(45) NOT NULL ,
#  `amended` BIT(1) NOT NULL ,
#  `highTemperature` DOUBLE NULL DEFAULT NULL ,
#  `reportingWeatherStation` VARCHAR(8) NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK5C6729AA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event` (`uuid` ASC) ;
#
#CREATE INDEX `FK5C6729AA5F74041` ON `event` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_bid_block`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_bid_block` ;
#
#CREATE  TABLE IF NOT EXISTS `event_bid_block` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTime` INT(11) NOT NULL ,
#  `startTime` INT(11) NOT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKC5E5A766CF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_bid_block` (`uuid` ASC) ;
#
#CREATE INDEX `FKC5E5A766CF46EF97` ON `event_bid_block` (`event_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_participant`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_participant` ;
#
#CREATE  TABLE IF NOT EXISTS `event_participant` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `bidState` VARCHAR(45) NULL DEFAULT NULL ,
#  `eventModNumber` INT(11) NOT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK6927A90E3DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ),
#  CONSTRAINT `FK6927A90ECF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_participant` (`uuid` ASC) ;
#
#CREATE INDEX `FK6927A90ECF46EF97` ON `event_participant` (`event_uuid` ASC) ;
#
#CREATE INDEX `FK6927A90E3DE22BD0` ON `event_participant` (`participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_participant_bid_entry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_participant_bid_entry` ;
#
#CREATE  TABLE IF NOT EXISTS `event_participant_bid_entry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `active` BIT(1) NOT NULL ,
#  `endTime` DATETIME NOT NULL ,
#  `priceLevel` DOUBLE NOT NULL ,
#  `reductionKW` DOUBLE NOT NULL ,
#  `startTime` DATETIME NOT NULL ,
#  `event_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKD987A0BFFA2301A8`
#    FOREIGN KEY (`event_participant_uuid` )
#    REFERENCES `event_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_participant_bid_entry` (`uuid` ASC) ;
#
#CREATE INDEX `FKD987A0BFFA2301A8` ON `event_participant_bid_entry` (`event_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_participant_rule`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_participant_rule` ;
#
#CREATE  TABLE IF NOT EXISTS `event_participant_rule` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endDateTime` DATETIME NULL DEFAULT NULL ,
#  `mode` VARCHAR(60) NULL DEFAULT NULL ,
#  `operator` VARCHAR(60) NULL DEFAULT NULL ,
#  `sortOrder` INT(11) NULL DEFAULT NULL ,
#  `source` VARCHAR(60) NULL DEFAULT NULL ,
#  `startDateTime` DATETIME NULL DEFAULT NULL ,
#  `variableName` VARCHAR(60) NULL DEFAULT NULL ,
#  `variableValue` DOUBLE NULL DEFAULT NULL ,
#  `event_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKB78E1F8DFA2301A8`
#    FOREIGN KEY (`event_participant_uuid` )
#    REFERENCES `event_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_participant_rule` (`uuid` ASC) ;
#
#CREATE INDEX `FKB78E1F8DFA2301A8` ON `event_participant_rule` (`event_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `signal_def`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `signal_def` ;
#
#CREATE  TABLE IF NOT EXISTS `signal_def` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `inputSignal` BIT(1) NULL DEFAULT NULL ,
#  `levelSignal` BIT(1) NULL DEFAULT NULL ,
#  `signalName` VARCHAR(255) NULL DEFAULT NULL ,
#  `type` VARCHAR(255) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `signal_def` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_participant_signal`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_participant_signal` ;
#
#CREATE  TABLE IF NOT EXISTS `event_participant_signal` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `event_participant_uuid` VARCHAR(32) NOT NULL ,
#  `signal_def_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKD8E16F9EFF3EBE6`
#    FOREIGN KEY (`signal_def_uuid` )
#    REFERENCES `signal_def` (`uuid` ),
#  CONSTRAINT `FKD8E16F9FA2301A8`
#    FOREIGN KEY (`event_participant_uuid` )
#    REFERENCES `event_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_participant_signal` (`uuid` ASC) ;
#
#CREATE INDEX `FKD8E16F9FA2301A8` ON `event_participant_signal` (`event_participant_uuid` ASC) ;
#
#CREATE INDEX `FKD8E16F9EFF3EBE6` ON `event_participant_signal` (`signal_def_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_participant_signal_entry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_participant_signal_entry` ;
#
#CREATE  TABLE IF NOT EXISTS `event_participant_signal_entry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `entryTime` DATETIME NOT NULL ,
#  `expired` BIT(1) NOT NULL ,
#  `numberValue` DOUBLE NULL DEFAULT NULL ,
#  `stringValue` VARCHAR(45) NOT NULL ,
#  `ruleId` INT(11) NULL DEFAULT NULL ,
#  `event_participant_signal_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKFF4A3AC6F9B7465`
#    FOREIGN KEY (`event_participant_signal_uuid` )
#    REFERENCES `event_participant_signal` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_participant_signal_entry` (`uuid` ASC) ;
#
#CREATE INDEX `FKFF4A3AC6F9B7465` ON `event_participant_signal_entry` (`event_participant_signal_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_signal`
#-- -----------------------------------------------------
#
#DROP TABLE IF EXISTS `event_signal` ;
#
#CREATE  TABLE IF NOT EXISTS `event_signal` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  `signal_def_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK3E8FB7EDEFF3EBE6`
#    FOREIGN KEY (`signal_def_uuid` )
#    REFERENCES `signal_def` (`uuid` ),
#  CONSTRAINT `FK3E8FB7EDCF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_signal` (`uuid` ASC) ;
#
#CREATE INDEX `FK3E8FB7EDCF46EF97` ON `event_signal` (`event_uuid` ASC) ;
#
#CREATE INDEX `FK3E8FB7EDEFF3EBE6` ON `event_signal` (`signal_def_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_signal_entry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_signal_entry` ;
#
#CREATE  TABLE IF NOT EXISTS `event_signal_entry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `entryTime` DATETIME NOT NULL ,
#  `expired` BIT(1) NOT NULL ,
#  `numberValue` DOUBLE NULL DEFAULT NULL ,
#  `stringValue` VARCHAR(45) NOT NULL ,
#  `event_signal_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKCAEBDA0710BC3AC`
#    FOREIGN KEY (`event_signal_uuid` )
#    REFERENCES `event_signal` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_signal_entry` (`uuid` ASC) ;
#
#CREATE INDEX `FKCAEBDA0710BC3AC` ON `event_signal_entry` (`event_signal_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_state`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_state` ;
#
#CREATE  TABLE IF NOT EXISTS `event_state` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `commTime` DATETIME NOT NULL ,
#  `drasClientId` VARCHAR(255) NULL DEFAULT NULL ,
#  `eventModNumber` INT(11) NOT NULL ,
#  `eventStateId` INT(11) NOT NULL ,
#  `programName` VARCHAR(255) NULL DEFAULT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK1ACFBEACA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FK1ACFBEAC3DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ),
#  CONSTRAINT `FK1ACFBEACCF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_state` (`uuid` ASC) ;
#
#CREATE INDEX `FK1ACFBEACCF46EF97` ON `event_state` (`event_uuid` ASC) ;
#
#CREATE INDEX `FK1ACFBEAC3DE22BD0` ON `event_state` (`participant_uuid` ASC) ;
#
#CREATE INDEX `FK1ACFBEACA5F74041` ON `event_state` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_template`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_template` ;
#
#CREATE  TABLE IF NOT EXISTS `event_template` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `name` VARCHAR(64) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK7827D87FA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_template` (`uuid` ASC) ;
#
#CREATE UNIQUE INDEX `name` ON `event_template` (`name` ASC) ;
#
#CREATE INDEX `FK7827D87FA5F74041` ON `event_template` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_template_signalentry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_template_signalentry` ;
#
#CREATE  TABLE IF NOT EXISTS `event_template_signalentry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `entryValue` VARCHAR(45) NOT NULL ,
#  `name` VARCHAR(64) NOT NULL ,
#  `relativeStartTime` BIGINT(20) NOT NULL ,
#  `signalType` VARCHAR(64) NOT NULL ,
#  `event_template_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK5980F30A54245A6C`
#    FOREIGN KEY (`event_template_uuid` )
#    REFERENCES `event_template` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_template_signalentry` (`uuid` ASC) ;
#
#CREATE INDEX `FK5980F30A54245A6C` ON `event_template_signalentry` (`event_template_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `event_timeblock`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `event_timeblock` ;
#
#CREATE  TABLE IF NOT EXISTS `event_timeblock` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTime` INT(11) NOT NULL ,
#  `startTime` INT(11) NOT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK190A9E7BCF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `event_timeblock` (`uuid` ASC) ;
#
#CREATE INDEX `FK190A9E7BCF46EF97` ON `event_timeblock` (`event_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `message`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `message` ;
#
#CREATE  TABLE IF NOT EXISTS `message` (
  `DTYPE` VARCHAR(31) NOT NULL ,
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
  `creator` VARCHAR(255) NULL DEFAULT NULL ,
  `modifiedTime` DATETIME NULL DEFAULT NULL ,
  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
  `version` INT(11) NULL DEFAULT NULL ,
  `contactId` VARCHAR(255) NULL DEFAULT NULL ,
  `content` LONGTEXT NULL DEFAULT NULL ,
  `contentType` VARCHAR(64) NULL DEFAULT NULL ,
  `eventName` VARCHAR(255) NULL DEFAULT NULL ,
  `fromEmailAddress` LONGTEXT NULL DEFAULT NULL ,
  `messageType` VARCHAR(45) NULL DEFAULT NULL ,
  `priority` INT(11) NOT NULL ,
  `programName` VARCHAR(255) NULL DEFAULT NULL ,
  `sentTime` DATETIME NULL DEFAULT NULL ,
  `status` INT(11) NOT NULL ,
  `subject` LONGTEXT NULL DEFAULT NULL ,
  `toEmailAddress` LONGTEXT NULL DEFAULT NULL ,
  `userName` VARCHAR(64) NULL DEFAULT NULL ,
  `contact_uuid` VARCHAR(32) NOT NULL ,
  `event_uuid` VARCHAR(32) NOT NULL ,
  `program_uuid` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`uuid`) ,
  CONSTRAINT `FK38EB0007A5F74041`
    FOREIGN KEY (`program_uuid` )
    REFERENCES `program` (`uuid` ),
  CONSTRAINT `FK38EB00073C0C52F0`
    FOREIGN KEY (`contact_uuid` )
    REFERENCES `contact` (`uuid` ),
  CONSTRAINT `FK38EB0007CF46EF97`
    FOREIGN KEY (`event_uuid` )
    REFERENCES `event` (`uuid` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `uuid` ON `message` (`uuid` ASC) ;

CREATE INDEX `FK38EB0007CF46EF97` ON `message` (`event_uuid` ASC) ;

CREATE INDEX `FK38EB00073C0C52F0` ON `message` (`contact_uuid` ASC) ;

CREATE INDEX `FK38EB0007A5F74041` ON `message` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `noaa_weather`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `noaa_weather` ;
#
#CREATE  TABLE IF NOT EXISTS `noaa_weather` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `forecastDate` DATE NOT NULL ,
#  `forecastHigh0` DOUBLE NOT NULL ,
#  `forecastHigh1` DOUBLE NOT NULL ,
#  `forecastHigh2` DOUBLE NOT NULL ,
#  `forecastHigh3` DOUBLE NOT NULL ,
#  `forecastHigh4` DOUBLE NOT NULL ,
#  `forecastHigh5` DOUBLE NOT NULL ,
#  `high` DOUBLE NULL DEFAULT NULL ,
#  `isFinal` BIT(1) NULL DEFAULT NULL ,
#  `reportingStation` VARCHAR(8) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `noaa_weather` (`uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `participant_manualsignal`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `participant_manualsignal` ;
#
#CREATE  TABLE IF NOT EXISTS `participant_manualsignal` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `name` VARCHAR(64) NOT NULL ,
#  `signalValue` VARCHAR(64) NOT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK4235EF7A3DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `participant_manualsignal` (`uuid` ASC) ;
#
#CREATE INDEX `FK4235EF7A3DE22BD0` ON `participant_manualsignal` (`participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_matrix`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_matrix` ;
#
#CREATE  TABLE IF NOT EXISTS `program_matrix` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `coexist` BIT(1) NULL DEFAULT NULL ,
#  `program1UUID` VARCHAR(32) NOT NULL ,
#  `program2UUID` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKD7EBD9DCA37D1E94`
#    FOREIGN KEY (`program2UUID` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FKD7EBD9DCA36F0713`
#    FOREIGN KEY (`program1UUID` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_matrix` (`uuid` ASC) ;
#
#CREATE INDEX `FKD7EBD9DCA36F0713` ON `program_matrix` (`program1UUID` ASC) ;
#
#CREATE INDEX `FKD7EBD9DCA37D1E94` ON `program_matrix` (`program2UUID` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_participant_bid_entry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_participant_bid_entry` ;
#
#CREATE  TABLE IF NOT EXISTS `program_participant_bid_entry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `active` BIT(1) NULL DEFAULT NULL ,
#  `blockEnd` DATETIME NULL DEFAULT NULL ,
#  `blockStart` DATETIME NULL DEFAULT NULL ,
#  `priceLevel` DOUBLE NULL DEFAULT NULL ,
#  `reductionKW` DOUBLE NULL DEFAULT NULL ,
#  `program_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK2E042129EB5C502A`
#    FOREIGN KEY (`program_participant_uuid` )
#    REFERENCES `program_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_participant_bid_entry` (`uuid` ASC) ;
#
#CREATE INDEX `FK2E042129EB5C502A` ON `program_participant_bid_entry` (`program_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `signal_level_def`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `signal_level_def` ;
#
#CREATE  TABLE IF NOT EXISTS `signal_level_def` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `defaultValue` BIT(1) NULL DEFAULT NULL ,
#  `stringValue` VARCHAR(255) NULL DEFAULT NULL ,
#  `signal_def_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK8B6723F3EFF3EBE6`
#    FOREIGN KEY (`signal_def_uuid` )
#    REFERENCES `signal_def` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `signal_level_def` (`uuid` ASC) ;
#
#CREATE INDEX `FK8B6723F3EFF3EBE6` ON `signal_level_def` (`signal_def_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_participant_bid_level_map`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_participant_bid_level_map` ;
#
#CREATE  TABLE IF NOT EXISTS `program_participant_bid_level_map` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endKW` DOUBLE NULL DEFAULT NULL ,
#  `startKW` DOUBLE NULL DEFAULT NULL ,
#  `signal_level_def_uuid` VARCHAR(32) NULL DEFAULT NULL ,
#  `program_participant_bid_entry_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK1954F358972FD92E`
#   FOREIGN KEY (`program_participant_bid_entry_uuid` )
#    REFERENCES `program_participant_bid_entry` (`uuid` ),
#  CONSTRAINT `FK1954F358B2BB5713`
#    FOREIGN KEY (`signal_level_def_uuid` )
#    REFERENCES `signal_level_def` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_participant_bid_level_map` (`uuid` ASC) ;
#
#CREATE INDEX `FK1954F358B2BB5713` ON `program_participant_bid_level_map` (`signal_level_def_uuid` ASC) ;
#
#CREATE INDEX `FK1954F358972FD92E` ON `program_participant_bid_level_map` (`program_participant_bid_entry_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_participant_rule`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_participant_rule` ;
#
#CREATE  TABLE IF NOT EXISTS `program_participant_rule` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endDateTime` DATETIME NULL DEFAULT NULL ,
#  `mode` VARCHAR(60) NULL DEFAULT NULL ,
#  `operator` VARCHAR(60) NULL DEFAULT NULL ,
#  `sortOrder` INT(11) NULL DEFAULT NULL ,
#  `source` VARCHAR(60) NULL DEFAULT NULL ,
#  `startDateTime` DATETIME NULL DEFAULT NULL ,
#  `variableName` VARCHAR(60) NULL DEFAULT NULL ,
#  `variableValue` DOUBLE NULL DEFAULT NULL ,
#  `program_participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK782984E3EB5C502A`
#    FOREIGN KEY (`program_participant_uuid` )
#    REFERENCES `program_participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_participant_rule` (`uuid` ASC) ;
#
#CREATE INDEX `FK782984E3EB5C502A` ON `program_participant_rule` (`program_participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_rtp_config`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_rtp_config` ;
#
#CREATE  TABLE IF NOT EXISTS `program_rtp_config` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTemperature` DOUBLE NULL DEFAULT NULL ,
#  `endTime` TIME NULL DEFAULT NULL ,
#  `name` VARCHAR(255) NULL DEFAULT NULL ,
#  `rate` DOUBLE NULL DEFAULT NULL ,
#  `seasonName` VARCHAR(255) NULL DEFAULT NULL ,
#  `startTemperature` DOUBLE NULL DEFAULT NULL ,
#  `startTime` TIME NULL DEFAULT NULL ,
#  `unit` VARCHAR(255) NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK17D38ACEA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_rtp_config` (`uuid` ASC) ;
#
#CREATE INDEX `FK17D38ACEA5F74041` ON `program_rtp_config` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_rule`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_rule` ;
#
#CREATE  TABLE IF NOT EXISTS `program_rule` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endDateTime` DATETIME NULL DEFAULT NULL ,
#  `mode` VARCHAR(60) NULL DEFAULT NULL ,
#  `operator` VARCHAR(60) NULL DEFAULT NULL ,
#  `sortOrder` INT(11) NULL DEFAULT NULL ,
#  `source` VARCHAR(60) NULL DEFAULT NULL ,
#  `startDateTime` DATETIME NULL DEFAULT NULL ,
#  `variableName` VARCHAR(60) NULL DEFAULT NULL ,
#  `variableValue` DOUBLE NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NULL DEFAULT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK4BE3A3D7A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_rule` (`uuid` ASC) ;
#
#CREATE INDEX `FK4BE3A3D7A5F74041` ON `program_rule` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_signal`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_signal` ;
#
#CREATE  TABLE IF NOT EXISTS `program_signal` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `signal_def_uuid` VARCHAR(32) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKE293B0C3A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FKE293B0C3EFF3EBE6`
#    FOREIGN KEY (`signal_def_uuid` )
#    REFERENCES `signal_def` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_signal` (`uuid` ASC) ;
#
#CREATE INDEX `FKE293B0C3EFF3EBE6` ON `program_signal` (`signal_def_uuid` ASC) ;
#
#CREATE INDEX `FKE293B0C3A5F74041` ON `program_signal` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `program_signal_entry`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `program_signal_entry` ;
#
#CREATE  TABLE IF NOT EXISTS `program_signal_entry` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `entryTime` DATETIME NOT NULL ,
#  `expired` BIT(1) NOT NULL ,
#  `numberValue` DOUBLE NULL DEFAULT NULL ,
#  `stringValue` VARCHAR(45) NOT NULL ,
#  `program_signal_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKA44E3DF6FEF7EBEA`
#    FOREIGN KEY (`program_signal_uuid` )
#    REFERENCES `program_signal` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `program_signal_entry` (`uuid` ASC) ;
#
#CREATE INDEX `FKA44E3DF6FEF7EBEA` ON `program_signal_entry` (`program_signal_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `report_event`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `report_event` ;
#
#CREATE  TABLE IF NOT EXISTS `report_event` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endTime` DATETIME NULL DEFAULT NULL ,
#  `startTime` DATETIME NULL DEFAULT NULL ,
#  `event_uuid` VARCHAR(32) NOT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK379F73CFA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ),
#  CONSTRAINT `FK379F73CFCF46EF97`
#    FOREIGN KEY (`event_uuid` )
#    REFERENCES `event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `report_event` (`uuid` ASC) ;
#
#CREATE INDEX `FK379F73CFCF46EF97` ON `report_event` (`event_uuid` ASC) ;
#
#CREATE INDEX `FK379F73CFA5F74041` ON `report_event` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `report_event_participation`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `report_event_participation` ;
#
#CREATE  TABLE IF NOT EXISTS `report_event_participation` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `accountId` VARCHAR(128) NOT NULL ,
#  `entryTime` DATETIME NOT NULL ,
#  `reason` VARCHAR(64) NOT NULL ,
#  `type` VARCHAR(64) NOT NULL ,
#  `report_event_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FKB5D47CD112BEADC6`
#    FOREIGN KEY (`report_event_uuid` )
#    REFERENCES `report_event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `report_event_participation` (`uuid` ASC) ;
#
#CREATE INDEX `FKB5D47CD112BEADC6` ON `report_event_participation` (`report_event_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `report_event_signal`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `report_event_signal` ;
#
#CREATE  TABLE IF NOT EXISTS `report_event_signal` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `accountId` VARCHAR(128) NOT NULL ,
#  `actualLevel` VARCHAR(64) NOT NULL ,
#  `signalLevel` VARCHAR(64) NOT NULL ,
#  `signalTime` DATETIME NOT NULL ,
#  `report_event_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK5961E11812BEADC6`
#    FOREIGN KEY (`report_event_uuid` )
#    REFERENCES `report_event` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `report_event_signal` (`uuid` ASC) ;
#
#CREATE INDEX `FK5961E11812BEADC6` ON `report_event_signal` (`report_event_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `rtp_remote_price`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `rtp_remote_price` ;
#
#CREATE  TABLE IF NOT EXISTS `rtp_remote_price` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `intervalTime` DATETIME NOT NULL ,
#  `price` DOUBLE NOT NULL ,
#  `programName` VARCHAR(255) NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK8FA9D241A5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `rtp_remote_price` (`uuid` ASC) ;
#
#CREATE INDEX `FK8FA9D241A5F74041` ON `rtp_remote_price` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `season_config`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `season_config` ;
#
#CREATE  TABLE IF NOT EXISTS `season_config` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `endDate` DATE NULL DEFAULT NULL ,
#  `name` VARCHAR(255) NULL DEFAULT NULL ,
#  `startDate` DATE NULL DEFAULT NULL ,
#  `program_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK92B4A01EA5F74041`
#    FOREIGN KEY (`program_uuid` )
#    REFERENCES `program` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `season_config` (`uuid` ASC) ;
#
#CREATE INDEX `FK92B4A01EA5F74041` ON `season_config` (`program_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `sub_account`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `sub_account` ;
#
#CREATE  TABLE IF NOT EXISTS `sub_account` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `comment` LONGTEXT NULL DEFAULT NULL ,
#  `endDate` DATETIME NULL DEFAULT NULL ,
#  `enrollmentDate` DATETIME NULL DEFAULT NULL ,
#  `premiseNumber` LONGTEXT NOT NULL ,
#  `startDate` DATETIME NULL DEFAULT NULL ,
#  `subAccountId` LONGTEXT NOT NULL ,
#  `participant_uuid` VARCHAR(32) NOT NULL ,
#  PRIMARY KEY (`uuid`) ,
#  CONSTRAINT `FK90E2AF2E3DE22BD0`
#    FOREIGN KEY (`participant_uuid` )
#    REFERENCES `participant` (`uuid` ))
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `sub_account` (`uuid` ASC) ;
#
#CREATE INDEX `FK90E2AF2E3DE22BD0` ON `sub_account` (`participant_uuid` ASC) ;
#
#
#-- -----------------------------------------------------
#-- Table `usage_summary`
#-- -----------------------------------------------------
#DROP TABLE IF EXISTS `usage_summary` ;
#
#CREATE  TABLE IF NOT EXISTS `usage_summary` (
#  `uuid` VARCHAR(32) NOT NULL ,
#  `creationTime` DATETIME NOT NULL ,
#  `creator` VARCHAR(255) NULL DEFAULT NULL ,
#  `modifiedTime` DATETIME NULL DEFAULT NULL ,
#  `modifier` VARCHAR(255) NULL DEFAULT NULL ,
#  `version` INT(11) NULL DEFAULT NULL ,
#  `average` DOUBLE NOT NULL ,
#  `name` VARCHAR(255) NULL DEFAULT NULL ,
#  `total` DOUBLE NOT NULL ,
#  PRIMARY KEY (`uuid`) )
#ENGINE = InnoDB
#DEFAULT CHARACTER SET = latin1;
#
#CREATE UNIQUE INDEX `uuid` ON `usage_summary` (`uuid` ASC) ;
#
#
#
#SET SQL_MODE=@OLD_SQL_MODE;
#SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
#SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
#