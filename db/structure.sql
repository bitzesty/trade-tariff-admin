-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tariff_development
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_code_description_periods`
--

DROP TABLE IF EXISTS `additional_code_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_code_description_periods` (
  `additional_code_description_period_sid` int(11) DEFAULT NULL,
  `additional_code_sid` int(11) DEFAULT NULL,
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`additional_code_description_period_sid`,`additional_code_sid`,`additional_code_type_id`),
  KEY `code_type_id` (`additional_code_type_id`),
  KEY `description_period_sid` (`additional_code_description_period_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional_code_descriptions`
--

DROP TABLE IF EXISTS `additional_code_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_code_descriptions` (
  `additional_code_description_period_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `additional_code_sid` int(11) DEFAULT NULL,
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`additional_code_description_period_sid`,`additional_code_type_id`,`additional_code_sid`),
  KEY `language_id` (`language_id`),
  KEY `period_sid` (`additional_code_description_period_sid`),
  KEY `sid` (`additional_code_sid`),
  KEY `type_id` (`additional_code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional_code_type_descriptions`
--

DROP TABLE IF EXISTS `additional_code_type_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_code_type_descriptions` (
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`additional_code_type_id`),
  KEY `index_additional_code_type_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional_code_type_measure_types`
--

DROP TABLE IF EXISTS `additional_code_type_measure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_code_type_measure_types` (
  `measure_type_id` varchar(3) DEFAULT NULL,
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_type_id`,`additional_code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional_code_types`
--

DROP TABLE IF EXISTS `additional_code_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_code_types` (
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `application_code` varchar(255) DEFAULT NULL,
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`additional_code_type_id`),
  KEY `index_additional_code_types_on_meursing_table_plan_id` (`meursing_table_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional_codes`
--

DROP TABLE IF EXISTS `additional_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_codes` (
  `additional_code_sid` int(11) DEFAULT NULL,
  `additional_code_type_id` varchar(1) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`additional_code_sid`),
  KEY `type_id` (`additional_code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_regulations`
--

DROP TABLE IF EXISTS `base_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_regulations` (
  `base_regulation_role` int(11) DEFAULT NULL,
  `base_regulation_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `community_code` int(11) DEFAULT NULL,
  `regulation_group_id` varchar(255) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `stopped_flag` tinyint(1) DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `effective_end_date` date DEFAULT NULL,
  `antidumping_regulation_role` int(11) DEFAULT NULL,
  `related_antidumping_regulation_id` varchar(255) DEFAULT NULL,
  `complete_abrogation_regulation_role` int(11) DEFAULT NULL,
  `complete_abrogation_regulation_id` varchar(255) DEFAULT NULL,
  `explicit_abrogation_regulation_role` int(11) DEFAULT NULL,
  `explicit_abrogation_regulation_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`base_regulation_id`,`base_regulation_role`),
  KEY `antidumping_regulation` (`antidumping_regulation_role`,`related_antidumping_regulation_id`),
  KEY `complete_abrogation_regulation` (`complete_abrogation_regulation_role`,`complete_abrogation_regulation_id`),
  KEY `explicit_abrogation_regulation` (`explicit_abrogation_regulation_role`,`explicit_abrogation_regulation_id`),
  KEY `index_base_regulations_on_regulation_group_id` (`regulation_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_description_periods`
--

DROP TABLE IF EXISTS `certificate_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_description_periods` (
  `certificate_description_period_sid` int(11) DEFAULT NULL,
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `certificate_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`certificate_description_period_sid`),
  KEY `certificate` (`certificate_code`,`certificate_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_descriptions`
--

DROP TABLE IF EXISTS `certificate_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_descriptions` (
  `certificate_description_period_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `certificate_code` varchar(3) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`certificate_description_period_sid`),
  KEY `certificate` (`certificate_code`,`certificate_type_code`),
  KEY `index_certificate_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_type_descriptions`
--

DROP TABLE IF EXISTS `certificate_type_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_type_descriptions` (
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`certificate_type_code`),
  KEY `index_certificate_type_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificate_types`
--

DROP TABLE IF EXISTS `certificate_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_types` (
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  KEY `primary_key` (`certificate_type_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `certificate_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  `national_abbrev` varchar(255) DEFAULT NULL,
  KEY `primary_key` (`certificate_code`,`certificate_type_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chapter_notes`
--

DROP TABLE IF EXISTS `chapter_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `chapter_notes_section_id_index` (`section_id`),
  KEY `chapter_notes_chapter_id_index` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chapters_sections`
--

DROP TABLE IF EXISTS `chapters_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapters_sections` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  UNIQUE KEY `index_chapters_sections_on_goods_nomenclature_sid_and_section_id` (`goods_nomenclature_sid`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_comm`
--

DROP TABLE IF EXISTS `chief_comm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_comm` (
  `fe_tsmp` datetime DEFAULT NULL,
  `amend_indicator` varchar(1) DEFAULT NULL,
  `cmdty_code` varchar(12) DEFAULT NULL,
  `le_tsmp` datetime DEFAULT NULL,
  `add_rlf_alwd_ind` tinyint(1) DEFAULT NULL,
  `alcohol_cmdty` tinyint(1) DEFAULT NULL,
  `audit_tsmp` datetime DEFAULT NULL,
  `chi_doti_rqd` tinyint(1) DEFAULT NULL,
  `cmdty_bbeer` tinyint(1) DEFAULT NULL,
  `cmdty_beer` tinyint(1) DEFAULT NULL,
  `cmdty_euse_alwd` tinyint(1) DEFAULT NULL,
  `cmdty_exp_rfnd` tinyint(1) DEFAULT NULL,
  `cmdty_mdecln` tinyint(1) DEFAULT NULL,
  `exp_lcnc_rqd` tinyint(1) DEFAULT NULL,
  `ex_ec_scode_rqd` tinyint(1) DEFAULT NULL,
  `full_dty_adval1` decimal(6,3) DEFAULT NULL,
  `full_dty_adval2` decimal(6,3) DEFAULT NULL,
  `full_dty_exch` varchar(3) DEFAULT NULL,
  `full_dty_spfc1` decimal(8,4) DEFAULT NULL,
  `full_dty_spfc2` decimal(8,4) DEFAULT NULL,
  `full_dty_ttype` varchar(3) DEFAULT NULL,
  `full_dty_uoq_c2` varchar(3) DEFAULT NULL,
  `full_dty_uoq1` varchar(3) DEFAULT NULL,
  `full_dty_uoq2` varchar(3) DEFAULT NULL,
  `full_duty_type` varchar(2) DEFAULT NULL,
  `im_ec_score_rqd` tinyint(1) DEFAULT NULL,
  `imp_exp_use` tinyint(1) DEFAULT NULL,
  `nba_id` varchar(6) DEFAULT NULL,
  `perfume_cmdty` tinyint(1) DEFAULT NULL,
  `rfa` varchar(255) DEFAULT NULL,
  `season_end` int(11) DEFAULT NULL,
  `season_start` int(11) DEFAULT NULL,
  `spv_code` varchar(7) DEFAULT NULL,
  `spv_xhdg` tinyint(1) DEFAULT NULL,
  `uoq_code_cdu1` varchar(3) DEFAULT NULL,
  `uoq_code_cdu2` varchar(3) DEFAULT NULL,
  `uoq_code_cdu3` varchar(3) DEFAULT NULL,
  `whse_cmdty` tinyint(1) DEFAULT NULL,
  `wines_cmdty` tinyint(1) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  KEY `cmdty_code_index` (`cmdty_code`),
  KEY `uoq_code_cdu2_index` (`uoq_code_cdu2`),
  KEY `uoq_code_cdu3_index` (`uoq_code_cdu3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_country_code`
--

DROP TABLE IF EXISTS `chief_country_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_country_code` (
  `chief_country_cd` varchar(2) DEFAULT NULL,
  `country_cd` varchar(2) DEFAULT NULL,
  KEY `primary_key` (`chief_country_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_country_group`
--

DROP TABLE IF EXISTS `chief_country_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_country_group` (
  `chief_country_grp` varchar(4) DEFAULT NULL,
  `country_grp_region` varchar(4) DEFAULT NULL,
  `country_exclusions` varchar(100) DEFAULT NULL,
  KEY `primary_key` (`chief_country_grp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_duty_expression`
--

DROP TABLE IF EXISTS `chief_duty_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_duty_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adval1_rate` tinyint(1) DEFAULT NULL,
  `adval2_rate` tinyint(1) DEFAULT NULL,
  `spfc1_rate` tinyint(1) DEFAULT NULL,
  `spfc2_rate` tinyint(1) DEFAULT NULL,
  `duty_expression_id_spfc1` varchar(2) DEFAULT NULL,
  `monetary_unit_code_spfc1` varchar(3) DEFAULT NULL,
  `duty_expression_id_spfc2` varchar(2) DEFAULT NULL,
  `monetary_unit_code_spfc2` varchar(3) DEFAULT NULL,
  `duty_expression_id_adval1` varchar(2) DEFAULT NULL,
  `monetary_unit_code_adval1` varchar(3) DEFAULT NULL,
  `duty_expression_id_adval2` varchar(2) DEFAULT NULL,
  `monetary_unit_code_adval2` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_measure_type_adco`
--

DROP TABLE IF EXISTS `chief_measure_type_adco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_measure_type_adco` (
  `measure_group_code` varchar(2) DEFAULT NULL,
  `measure_type` varchar(3) DEFAULT NULL,
  `tax_type_code` varchar(11) DEFAULT NULL,
  `measure_type_id` varchar(3) DEFAULT NULL,
  `adtnl_cd_type_id` varchar(1) DEFAULT NULL,
  `adtnl_cd` varchar(3) DEFAULT NULL,
  `zero_comp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_measure_type_cond`
--

DROP TABLE IF EXISTS `chief_measure_type_cond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_measure_type_cond` (
  `measure_group_code` varchar(2) DEFAULT NULL,
  `measure_type` varchar(3) DEFAULT NULL,
  `cond_cd` varchar(1) DEFAULT NULL,
  `comp_seq_no` varchar(3) DEFAULT NULL,
  `cert_type_cd` varchar(1) DEFAULT NULL,
  `cert_ref_no` varchar(3) DEFAULT NULL,
  `act_cd` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_measure_type_footnote`
--

DROP TABLE IF EXISTS `chief_measure_type_footnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_measure_type_footnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_type_id` varchar(3) DEFAULT NULL,
  `footn_type_id` varchar(2) DEFAULT NULL,
  `footn_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_measurement_unit`
--

DROP TABLE IF EXISTS `chief_measurement_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_measurement_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spfc_cmpd_uoq` varchar(3) DEFAULT NULL,
  `spfc_uoq` varchar(3) DEFAULT NULL,
  `measurem_unit_cd` varchar(3) DEFAULT NULL,
  `measurem_unit_qual_cd` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_mfcm`
--

DROP TABLE IF EXISTS `chief_mfcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_mfcm` (
  `fe_tsmp` datetime DEFAULT NULL,
  `msrgp_code` varchar(5) DEFAULT NULL,
  `msr_type` varchar(5) DEFAULT NULL,
  `tty_code` varchar(5) DEFAULT NULL,
  `le_tsmp` datetime DEFAULT NULL,
  `audit_tsmp` datetime DEFAULT NULL,
  `cmdty_code` varchar(12) DEFAULT NULL,
  `cmdty_msr_xhdg` varchar(255) DEFAULT NULL,
  `null_tri_rqd` varchar(255) DEFAULT NULL,
  `exports_use_ind` tinyint(1) DEFAULT NULL,
  `tar_msr_no` varchar(12) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  `amend_indicator` varchar(1) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  KEY `chief_mfcm_msrgp_code_index` (`msrgp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_tame`
--

DROP TABLE IF EXISTS `chief_tame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_tame` (
  `fe_tsmp` datetime DEFAULT NULL,
  `msrgp_code` varchar(5) DEFAULT NULL,
  `msr_type` varchar(5) DEFAULT NULL,
  `tty_code` varchar(5) DEFAULT NULL,
  `tar_msr_no` varchar(12) DEFAULT NULL,
  `le_tsmp` datetime DEFAULT NULL,
  `adval_rate` decimal(8,3) DEFAULT NULL,
  `alch_sgth` decimal(8,3) DEFAULT NULL,
  `audit_tsmp` datetime DEFAULT NULL,
  `cap_ai_stmt` varchar(255) DEFAULT NULL,
  `cap_max_pct` decimal(8,3) DEFAULT NULL,
  `cmdty_msr_xhdg` varchar(255) DEFAULT NULL,
  `comp_mthd` varchar(255) DEFAULT NULL,
  `cpc_wvr_phb` varchar(255) DEFAULT NULL,
  `ec_msr_set` varchar(255) DEFAULT NULL,
  `mip_band_exch` varchar(255) DEFAULT NULL,
  `mip_rate_exch` varchar(255) DEFAULT NULL,
  `mip_uoq_code` varchar(255) DEFAULT NULL,
  `nba_id` varchar(255) DEFAULT NULL,
  `null_tri_rqd` varchar(255) DEFAULT NULL,
  `qta_code_uk` varchar(255) DEFAULT NULL,
  `qta_elig_use` varchar(255) DEFAULT NULL,
  `qta_exch_rate` varchar(255) DEFAULT NULL,
  `qta_no` varchar(255) DEFAULT NULL,
  `qta_uoq_code` varchar(255) DEFAULT NULL,
  `rfa` text,
  `rfs_code_1` varchar(255) DEFAULT NULL,
  `rfs_code_2` varchar(255) DEFAULT NULL,
  `rfs_code_3` varchar(255) DEFAULT NULL,
  `rfs_code_4` varchar(255) DEFAULT NULL,
  `rfs_code_5` varchar(255) DEFAULT NULL,
  `tdr_spr_sur` varchar(255) DEFAULT NULL,
  `exports_use_ind` tinyint(1) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  `amend_indicator` varchar(1) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `ec_sctr` varchar(10) DEFAULT NULL,
  KEY `index_chief_tame` (`msrgp_code`,`msr_type`,`tty_code`,`tar_msr_no`,`fe_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_tamf`
--

DROP TABLE IF EXISTS `chief_tamf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_tamf` (
  `fe_tsmp` datetime DEFAULT NULL,
  `msrgp_code` varchar(5) DEFAULT NULL,
  `msr_type` varchar(5) DEFAULT NULL,
  `tty_code` varchar(5) DEFAULT NULL,
  `tar_msr_no` varchar(12) DEFAULT NULL,
  `adval1_rate` decimal(8,3) DEFAULT NULL,
  `adval2_rate` decimal(8,3) DEFAULT NULL,
  `ai_factor` varchar(255) DEFAULT NULL,
  `cmdty_dmql` decimal(8,3) DEFAULT NULL,
  `cmdty_dmql_uoq` varchar(255) DEFAULT NULL,
  `cngp_code` varchar(255) DEFAULT NULL,
  `cntry_disp` varchar(255) DEFAULT NULL,
  `cntry_orig` varchar(255) DEFAULT NULL,
  `duty_type` varchar(255) DEFAULT NULL,
  `ec_supplement` varchar(255) DEFAULT NULL,
  `ec_exch_rate` varchar(255) DEFAULT NULL,
  `spcl_inst` varchar(255) DEFAULT NULL,
  `spfc1_cmpd_uoq` varchar(255) DEFAULT NULL,
  `spfc1_rate` decimal(8,4) DEFAULT NULL,
  `spfc1_uoq` varchar(255) DEFAULT NULL,
  `spfc2_rate` decimal(8,4) DEFAULT NULL,
  `spfc2_uoq` varchar(255) DEFAULT NULL,
  `spfc3_rate` decimal(8,4) DEFAULT NULL,
  `spfc3_uoq` varchar(255) DEFAULT NULL,
  `tamf_dt` varchar(255) DEFAULT NULL,
  `tamf_sta` varchar(255) DEFAULT NULL,
  `tamf_ty` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  `amend_indicator` varchar(1) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  KEY `index_chief_tamf` (`fe_tsmp`,`msrgp_code`,`msr_type`,`tty_code`,`tar_msr_no`,`amend_indicator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chief_tbl9`
--

DROP TABLE IF EXISTS `chief_tbl9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief_tbl9` (
  `fe_tsmp` datetime DEFAULT NULL,
  `amend_indicator` varchar(1) DEFAULT NULL,
  `tbl_type` varchar(4) DEFAULT NULL,
  `tbl_code` varchar(10) DEFAULT NULL,
  `txtlnno` int(11) DEFAULT NULL,
  `tbl_txt` varchar(100) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  KEY `tbl_type_index` (`tbl_type`),
  KEY `tbl_code_index` (`tbl_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `complete_abrogation_regulations`
--

DROP TABLE IF EXISTS `complete_abrogation_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complete_abrogation_regulations` (
  `complete_abrogation_regulation_role` int(11) DEFAULT NULL,
  `complete_abrogation_regulation_id` varchar(255) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`complete_abrogation_regulation_id`,`complete_abrogation_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `duty_expression_descriptions`
--

DROP TABLE IF EXISTS `duty_expression_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duty_expression_descriptions` (
  `duty_expression_id` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `abbreviation` varchar(30) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`duty_expression_id`),
  KEY `index_duty_expression_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `duty_expressions`
--

DROP TABLE IF EXISTS `duty_expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duty_expressions` (
  `duty_expression_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `duty_amount_applicability_code` int(11) DEFAULT NULL,
  `measurement_unit_applicability_code` int(11) DEFAULT NULL,
  `monetary_unit_applicability_code` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`duty_expression_id`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explicit_abrogation_regulations`
--

DROP TABLE IF EXISTS `explicit_abrogation_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explicit_abrogation_regulations` (
  `explicit_abrogation_regulation_role` int(11) DEFAULT NULL,
  `explicit_abrogation_regulation_id` varchar(8) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `abrogation_date` date DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`explicit_abrogation_regulation_id`,`explicit_abrogation_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_refund_nomenclature_description_periods`
--

DROP TABLE IF EXISTS `export_refund_nomenclature_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_refund_nomenclature_description_periods` (
  `export_refund_nomenclature_description_period_sid` int(11) DEFAULT NULL,
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `additional_code_type` varchar(255) DEFAULT NULL,
  `export_refund_code` varchar(255) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`export_refund_nomenclature_sid`,`export_refund_nomenclature_description_period_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_refund_nomenclature_descriptions`
--

DROP TABLE IF EXISTS `export_refund_nomenclature_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_refund_nomenclature_descriptions` (
  `export_refund_nomenclature_description_period_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `additional_code_type` varchar(255) DEFAULT NULL,
  `export_refund_code` varchar(255) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`export_refund_nomenclature_description_period_sid`),
  KEY `export_refund_nomenclature` (`export_refund_nomenclature_sid`),
  KEY `index_export_refund_nomenclature_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_refund_nomenclature_indents`
--

DROP TABLE IF EXISTS `export_refund_nomenclature_indents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_refund_nomenclature_indents` (
  `export_refund_nomenclature_indents_sid` int(11) DEFAULT NULL,
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `number_export_refund_nomenclature_indents` varchar(255) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `additional_code_type` varchar(255) DEFAULT NULL,
  `export_refund_code` varchar(255) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`export_refund_nomenclature_indents_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_refund_nomenclatures`
--

DROP TABLE IF EXISTS `export_refund_nomenclatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_refund_nomenclatures` (
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `additional_code_type` varchar(1) DEFAULT NULL,
  `export_refund_code` varchar(3) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`export_refund_nomenclature_sid`),
  KEY `index_export_refund_nomenclatures_on_goods_nomenclature_sid` (`goods_nomenclature_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_association_additional_codes`
--

DROP TABLE IF EXISTS `footnote_association_additional_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_association_additional_codes` (
  `additional_code_sid` int(11) DEFAULT NULL,
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `additional_code_type_id` varchar(255) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`footnote_type_id`,`additional_code_sid`),
  KEY `additional_code_type` (`additional_code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_association_erns`
--

DROP TABLE IF EXISTS `footnote_association_erns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_association_erns` (
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `footnote_type` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `additional_code_type` varchar(255) DEFAULT NULL,
  `export_refund_code` varchar(255) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`export_refund_nomenclature_sid`,`footnote_id`,`footnote_type`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_association_goods_nomenclatures`
--

DROP TABLE IF EXISTS `footnote_association_goods_nomenclatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_association_goods_nomenclatures` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `footnote_type` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`footnote_type`,`goods_nomenclature_sid`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_association_measures`
--

DROP TABLE IF EXISTS `footnote_association_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_association_measures` (
  `measure_sid` int(11) DEFAULT NULL,
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  KEY `measure_sid` (`measure_sid`),
  KEY `footnote_id` (`footnote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_association_meursing_headings`
--

DROP TABLE IF EXISTS `footnote_association_meursing_headings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_association_meursing_headings` (
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `meursing_heading_number` varchar(255) DEFAULT NULL,
  `row_column_code` int(11) DEFAULT NULL,
  `footnote_type` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`meursing_table_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_description_periods`
--

DROP TABLE IF EXISTS `footnote_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_description_periods` (
  `footnote_description_period_sid` int(11) DEFAULT NULL,
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`footnote_type_id`,`footnote_description_period_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_descriptions`
--

DROP TABLE IF EXISTS `footnote_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_descriptions` (
  `footnote_description_period_sid` int(11) DEFAULT NULL,
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `footnote_id` varchar(3) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`footnote_type_id`,`footnote_description_period_sid`),
  KEY `index_footnote_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_type_descriptions`
--

DROP TABLE IF EXISTS `footnote_type_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_type_descriptions` (
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_type_id`),
  KEY `index_footnote_type_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnote_types`
--

DROP TABLE IF EXISTS `footnote_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnote_types` (
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `application_code` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  KEY `primary_key` (`footnote_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footnotes`
--

DROP TABLE IF EXISTS `footnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footnotes` (
  `footnote_id` varchar(3) DEFAULT NULL,
  `footnote_type_id` varchar(2) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`footnote_id`,`footnote_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fts_regulation_actions`
--

DROP TABLE IF EXISTS `fts_regulation_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fts_regulation_actions` (
  `fts_regulation_role` int(11) DEFAULT NULL,
  `fts_regulation_id` varchar(8) DEFAULT NULL,
  `stopped_regulation_role` int(11) DEFAULT NULL,
  `stopped_regulation_id` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`fts_regulation_id`,`fts_regulation_role`,`stopped_regulation_id`,`stopped_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `full_temporary_stop_regulations`
--

DROP TABLE IF EXISTS `full_temporary_stop_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `full_temporary_stop_regulations` (
  `full_temporary_stop_regulation_role` int(11) DEFAULT NULL,
  `full_temporary_stop_regulation_id` varchar(8) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `effective_enddate` date DEFAULT NULL,
  `explicit_abrogation_regulation_role` int(11) DEFAULT NULL,
  `explicit_abrogation_regulation_id` varchar(8) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`full_temporary_stop_regulation_id`,`full_temporary_stop_regulation_role`),
  KEY `explicit_abrogation_regulation` (`explicit_abrogation_regulation_role`,`explicit_abrogation_regulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geographical_area_description_periods`
--

DROP TABLE IF EXISTS `geographical_area_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geographical_area_description_periods` (
  `geographical_area_description_period_sid` int(11) DEFAULT NULL,
  `geographical_area_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `geographical_area_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`geographical_area_description_period_sid`,`geographical_area_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geographical_area_descriptions`
--

DROP TABLE IF EXISTS `geographical_area_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geographical_area_descriptions` (
  `geographical_area_description_period_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `geographical_area_sid` int(11) DEFAULT NULL,
  `geographical_area_id` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`geographical_area_description_period_sid`,`geographical_area_sid`),
  KEY `index_geographical_area_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geographical_area_memberships`
--

DROP TABLE IF EXISTS `geographical_area_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geographical_area_memberships` (
  `geographical_area_sid` int(11) DEFAULT NULL,
  `geographical_area_group_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`geographical_area_sid`,`geographical_area_group_sid`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geographical_areas`
--

DROP TABLE IF EXISTS `geographical_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geographical_areas` (
  `geographical_area_sid` int(11) DEFAULT NULL,
  `parent_geographical_area_group_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `geographical_code` varchar(255) DEFAULT NULL,
  `geographical_area_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`geographical_area_sid`),
  UNIQUE KEY `geographical_area_id` (`geographical_area_id`),
  KEY `index_geographical_areas_on_parent_geographical_area_group_sid` (`parent_geographical_area_group_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_description_periods`
--

DROP TABLE IF EXISTS `goods_nomenclature_description_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_description_periods` (
  `goods_nomenclature_description_period_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_description_period_sid`),
  KEY `goods_nomenclature` (`goods_nomenclature_sid`,`validity_start_date`,`validity_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_descriptions`
--

DROP TABLE IF EXISTS `goods_nomenclature_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_descriptions` (
  `goods_nomenclature_description_period_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_sid`,`goods_nomenclature_description_period_sid`),
  KEY `index_goods_nomenclature_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_group_descriptions`
--

DROP TABLE IF EXISTS `goods_nomenclature_group_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_group_descriptions` (
  `goods_nomenclature_group_type` varchar(1) DEFAULT NULL,
  `goods_nomenclature_group_id` varchar(6) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_group_id`,`goods_nomenclature_group_type`),
  KEY `index_goods_nomenclature_group_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_groups`
--

DROP TABLE IF EXISTS `goods_nomenclature_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_groups` (
  `goods_nomenclature_group_type` varchar(1) DEFAULT NULL,
  `goods_nomenclature_group_id` varchar(6) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `nomenclature_group_facility_code` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_group_id`,`goods_nomenclature_group_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_indents`
--

DROP TABLE IF EXISTS `goods_nomenclature_indents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_indents` (
  `goods_nomenclature_indent_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `number_indents` int(11) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_indent_sid`),
  KEY `goods_nomenclature_sid` (`goods_nomenclature_sid`),
  KEY `goods_nomenclature_validity_dates` (`validity_start_date`,`validity_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_origins`
--

DROP TABLE IF EXISTS `goods_nomenclature_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_origins` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `derived_goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `derived_productline_suffix` varchar(2) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_sid`,`derived_goods_nomenclature_item_id`,`derived_productline_suffix`,`goods_nomenclature_item_id`,`productline_suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclature_successors`
--

DROP TABLE IF EXISTS `goods_nomenclature_successors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclature_successors` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `absorbed_goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `absorbed_productline_suffix` varchar(2) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_sid`,`absorbed_goods_nomenclature_item_id`,`absorbed_productline_suffix`,`goods_nomenclature_item_id`,`productline_suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_nomenclatures`
--

DROP TABLE IF EXISTS `goods_nomenclatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_nomenclatures` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `producline_suffix` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `statistical_indicator` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_sid`),
  KEY `item_id` (`goods_nomenclature_item_id`,`producline_suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hidden_goods_nomenclatures`
--

DROP TABLE IF EXISTS `hidden_goods_nomenclatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hidden_goods_nomenclatures` (
  `goods_nomenclature_item_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_descriptions`
--

DROP TABLE IF EXISTS `language_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_descriptions` (
  `language_code_id` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`language_id`,`language_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` varchar(5) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_action_descriptions`
--

DROP TABLE IF EXISTS `measure_action_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_action_descriptions` (
  `action_code` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`action_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_actions`
--

DROP TABLE IF EXISTS `measure_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_actions` (
  `action_code` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`action_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_components`
--

DROP TABLE IF EXISTS `measure_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_components` (
  `measure_sid` int(11) DEFAULT NULL,
  `duty_expression_id` varchar(255) DEFAULT NULL,
  `duty_amount` double DEFAULT NULL,
  `monetary_unit_code` varchar(255) DEFAULT NULL,
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_sid`,`duty_expression_id`),
  KEY `index_measure_components_on_measurement_unit_code` (`measurement_unit_code`),
  KEY `index_measure_components_on_measurement_unit_qualifier_code` (`measurement_unit_qualifier_code`),
  KEY `index_measure_components_on_monetary_unit_code` (`monetary_unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_condition_code_descriptions`
--

DROP TABLE IF EXISTS `measure_condition_code_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_condition_code_descriptions` (
  `condition_code` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`condition_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_condition_codes`
--

DROP TABLE IF EXISTS `measure_condition_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_condition_codes` (
  `condition_code` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`condition_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_condition_components`
--

DROP TABLE IF EXISTS `measure_condition_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_condition_components` (
  `measure_condition_sid` int(11) DEFAULT NULL,
  `duty_expression_id` varchar(255) DEFAULT NULL,
  `duty_amount` double DEFAULT NULL,
  `monetary_unit_code` varchar(255) DEFAULT NULL,
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_condition_sid`,`duty_expression_id`),
  KEY `index_measure_condition_components_on_duty_expression_id` (`duty_expression_id`),
  KEY `index_measure_condition_components_on_measurement_unit_code` (`measurement_unit_code`),
  KEY `index_measure_condition_components_on_monetary_unit_code` (`monetary_unit_code`),
  KEY `measurement_unit_qualifier_code` (`measurement_unit_qualifier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_conditions`
--

DROP TABLE IF EXISTS `measure_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_conditions` (
  `measure_condition_sid` int(11) DEFAULT NULL,
  `measure_sid` int(11) DEFAULT NULL,
  `condition_code` varchar(255) DEFAULT NULL,
  `component_sequence_number` int(11) DEFAULT NULL,
  `condition_duty_amount` double DEFAULT NULL,
  `condition_monetary_unit_code` varchar(255) DEFAULT NULL,
  `condition_measurement_unit_code` varchar(3) DEFAULT NULL,
  `condition_measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `action_code` varchar(255) DEFAULT NULL,
  `certificate_type_code` varchar(1) DEFAULT NULL,
  `certificate_code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_condition_sid`),
  KEY `certificate` (`certificate_code`,`certificate_type_code`),
  KEY `condition_measurement_unit_qualifier_code` (`condition_measurement_unit_qualifier_code`),
  KEY `index_measure_conditions_on_action_code` (`action_code`),
  KEY `index_measure_conditions_on_condition_measurement_unit_code` (`condition_measurement_unit_code`),
  KEY `index_measure_conditions_on_condition_monetary_unit_code` (`condition_monetary_unit_code`),
  KEY `index_measure_conditions_on_measure_sid` (`measure_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_excluded_geographical_areas`
--

DROP TABLE IF EXISTS `measure_excluded_geographical_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_excluded_geographical_areas` (
  `measure_sid` int(11) DEFAULT NULL,
  `excluded_geographical_area` varchar(255) DEFAULT NULL,
  `geographical_area_sid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_sid`,`excluded_geographical_area`,`geographical_area_sid`),
  KEY `geographical_area_sid` (`geographical_area_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_partial_temporary_stops`
--

DROP TABLE IF EXISTS `measure_partial_temporary_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_partial_temporary_stops` (
  `measure_sid` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `partial_temporary_stop_regulation_id` varchar(255) DEFAULT NULL,
  `partial_temporary_stop_regulation_officialjournal_number` varchar(255) DEFAULT NULL,
  `partial_temporary_stop_regulation_officialjournal_page` int(11) DEFAULT NULL,
  `abrogation_regulation_id` varchar(255) DEFAULT NULL,
  `abrogation_regulation_officialjournal_number` varchar(255) DEFAULT NULL,
  `abrogation_regulation_officialjournal_page` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_sid`,`partial_temporary_stop_regulation_id`),
  KEY `abrogation_regulation_id` (`abrogation_regulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_type_descriptions`
--

DROP TABLE IF EXISTS `measure_type_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_type_descriptions` (
  `measure_type_id` varchar(3) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_type_id`),
  KEY `index_measure_type_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_type_series`
--

DROP TABLE IF EXISTS `measure_type_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_type_series` (
  `measure_type_series_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `measure_type_combination` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_type_series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_type_series_descriptions`
--

DROP TABLE IF EXISTS `measure_type_series_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_type_series_descriptions` (
  `measure_type_series_id` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_type_series_id`),
  KEY `index_measure_type_series_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_types` (
  `measure_type_id` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `trade_movement_code` int(11) DEFAULT NULL,
  `priority_code` int(11) DEFAULT NULL,
  `measure_component_applicable_code` int(11) DEFAULT NULL,
  `origin_dest_code` int(11) DEFAULT NULL,
  `order_number_capture_code` int(11) DEFAULT NULL,
  `measure_explosion_level` int(11) DEFAULT NULL,
  `measure_type_series_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  `measure_type_acronym` varchar(3) DEFAULT NULL,
  KEY `index_measure_types_on_measure_type_series_id` (`measure_type_series_id`),
  KEY `primary_key` (`measure_type_id`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurement_unit_descriptions`
--

DROP TABLE IF EXISTS `measurement_unit_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_unit_descriptions` (
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measurement_unit_code`),
  KEY `index_measurement_unit_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurement_unit_qualifier_descriptions`
--

DROP TABLE IF EXISTS `measurement_unit_qualifier_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_unit_qualifier_descriptions` (
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measurement_unit_qualifier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurement_unit_qualifiers`
--

DROP TABLE IF EXISTS `measurement_unit_qualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_unit_qualifiers` (
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`measurement_unit_qualifier_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurement_units`
--

DROP TABLE IF EXISTS `measurement_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_units` (
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`measurement_unit_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurements`
--

DROP TABLE IF EXISTS `measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurements` (
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measurement_unit_code`,`measurement_unit_qualifier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measures` (
  `measure_sid` int(11) DEFAULT NULL,
  `measure_type` varchar(3) DEFAULT NULL,
  `geographical_area` varchar(255) DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `measure_generating_regulation_role` int(11) DEFAULT NULL,
  `measure_generating_regulation_id` varchar(255) DEFAULT NULL,
  `justification_regulation_role` int(11) DEFAULT NULL,
  `justification_regulation_id` varchar(255) DEFAULT NULL,
  `stopped_flag` tinyint(1) DEFAULT NULL,
  `geographical_area_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `ordernumber` varchar(255) DEFAULT NULL,
  `additional_code_type` varchar(255) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `additional_code_sid` int(11) DEFAULT NULL,
  `reduction_indicator` int(11) DEFAULT NULL,
  `export_refund_nomenclature_sid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  `tariff_measure_number` varchar(10) DEFAULT NULL,
  `invalidated_by` int(11) DEFAULT NULL,
  `invalidated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`measure_sid`),
  KEY `index_measures_on_additional_code_sid` (`additional_code_sid`),
  KEY `index_measures_on_geographical_area_sid` (`geographical_area_sid`),
  KEY `index_measures_on_goods_nomenclature_sid` (`goods_nomenclature_sid`),
  KEY `index_measures_on_measure_type` (`measure_type`),
  KEY `justification_regulation` (`justification_regulation_role`,`justification_regulation_id`),
  KEY `measure_generating_regulation` (`measure_generating_regulation_id`),
  KEY `measures_goods_nomenclature_item_id_index` (`goods_nomenclature_item_id`),
  KEY `measures_export_refund_nomenclature_sid_index` (`export_refund_nomenclature_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_additional_codes`
--

DROP TABLE IF EXISTS `meursing_additional_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_additional_codes` (
  `meursing_additional_code_sid` int(11) DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_additional_code_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_heading_texts`
--

DROP TABLE IF EXISTS `meursing_heading_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_heading_texts` (
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `meursing_heading_number` int(11) DEFAULT NULL,
  `row_column_code` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_table_plan_id`,`meursing_heading_number`,`row_column_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_headings`
--

DROP TABLE IF EXISTS `meursing_headings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_headings` (
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `meursing_heading_number` int(11) DEFAULT NULL,
  `row_column_code` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_table_plan_id`,`meursing_heading_number`,`row_column_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_subheadings`
--

DROP TABLE IF EXISTS `meursing_subheadings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_subheadings` (
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `meursing_heading_number` int(11) DEFAULT NULL,
  `row_column_code` int(11) DEFAULT NULL,
  `subheading_sequence_number` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_table_plan_id`,`meursing_heading_number`,`row_column_code`,`subheading_sequence_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_table_cell_components`
--

DROP TABLE IF EXISTS `meursing_table_cell_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_table_cell_components` (
  `meursing_additional_code_sid` int(11) DEFAULT NULL,
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `heading_number` int(11) DEFAULT NULL,
  `row_column_code` int(11) DEFAULT NULL,
  `subheading_sequence_number` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `additional_code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_table_plan_id`,`heading_number`,`row_column_code`,`meursing_additional_code_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meursing_table_plans`
--

DROP TABLE IF EXISTS `meursing_table_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meursing_table_plans` (
  `meursing_table_plan_id` varchar(2) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`meursing_table_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modification_regulations`
--

DROP TABLE IF EXISTS `modification_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modification_regulations` (
  `modification_regulation_role` int(11) DEFAULT NULL,
  `modification_regulation_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `base_regulation_role` int(11) DEFAULT NULL,
  `base_regulation_id` varchar(255) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `stopped_flag` tinyint(1) DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `explicit_abrogation_regulation_role` int(11) DEFAULT NULL,
  `explicit_abrogation_regulation_id` varchar(8) DEFAULT NULL,
  `effective_end_date` date DEFAULT NULL,
  `complete_abrogation_regulation_role` int(11) DEFAULT NULL,
  `complete_abrogation_regulation_id` varchar(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`modification_regulation_id`,`modification_regulation_role`),
  KEY `base_regulation` (`base_regulation_id`,`base_regulation_role`),
  KEY `complete_abrogation_regulation` (`complete_abrogation_regulation_id`,`complete_abrogation_regulation_role`),
  KEY `explicit_abrogation_regulation` (`explicit_abrogation_regulation_id`,`explicit_abrogation_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monetary_exchange_periods`
--

DROP TABLE IF EXISTS `monetary_exchange_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetary_exchange_periods` (
  `monetary_exchange_period_sid` int(11) DEFAULT NULL,
  `parent_monetary_unit_code` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`monetary_exchange_period_sid`,`parent_monetary_unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monetary_exchange_rates`
--

DROP TABLE IF EXISTS `monetary_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetary_exchange_rates` (
  `monetary_exchange_period_sid` int(11) DEFAULT NULL,
  `child_monetary_unit_code` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(16,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`monetary_exchange_period_sid`,`child_monetary_unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monetary_unit_descriptions`
--

DROP TABLE IF EXISTS `monetary_unit_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetary_unit_descriptions` (
  `monetary_unit_code` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `abbreviation` varchar(30) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`monetary_unit_code`),
  KEY `index_monetary_unit_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monetary_units`
--

DROP TABLE IF EXISTS `monetary_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetary_units` (
  `monetary_unit_code` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`monetary_unit_code`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nomenclature_group_memberships`
--

DROP TABLE IF EXISTS `nomenclature_group_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomenclature_group_memberships` (
  `goods_nomenclature_sid` int(11) DEFAULT NULL,
  `goods_nomenclature_group_type` varchar(1) DEFAULT NULL,
  `goods_nomenclature_group_id` varchar(6) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `goods_nomenclature_item_id` varchar(10) DEFAULT NULL,
  `productline_suffix` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`goods_nomenclature_sid`,`goods_nomenclature_group_id`,`goods_nomenclature_group_type`,`goods_nomenclature_item_id`,`validity_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prorogation_regulation_actions`
--

DROP TABLE IF EXISTS `prorogation_regulation_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prorogation_regulation_actions` (
  `prorogation_regulation_role` int(11) DEFAULT NULL,
  `prorogation_regulation_id` varchar(8) DEFAULT NULL,
  `prorogated_regulation_role` int(11) DEFAULT NULL,
  `prorogated_regulation_id` varchar(8) DEFAULT NULL,
  `prorogated_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`prorogation_regulation_id`,`prorogation_regulation_role`,`prorogated_regulation_id`,`prorogated_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prorogation_regulations`
--

DROP TABLE IF EXISTS `prorogation_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prorogation_regulations` (
  `prorogation_regulation_role` int(11) DEFAULT NULL,
  `prorogation_regulation_id` varchar(255) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `officialjournal_number` varchar(255) DEFAULT NULL,
  `officialjournal_page` int(11) DEFAULT NULL,
  `replacement_indicator` int(11) DEFAULT NULL,
  `information_text` text,
  `approved_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`prorogation_regulation_id`,`prorogation_regulation_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_associations`
--

DROP TABLE IF EXISTS `quota_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_associations` (
  `main_quota_definition_sid` int(11) DEFAULT NULL,
  `sub_quota_definition_sid` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `coefficient` decimal(16,5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`main_quota_definition_sid`,`sub_quota_definition_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_balance_events`
--

DROP TABLE IF EXISTS `quota_balance_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_balance_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `last_import_date_in_allocation` date DEFAULT NULL,
  `old_balance` int(11) DEFAULT NULL,
  `new_balance` int(11) DEFAULT NULL,
  `imported_amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_blocking_periods`
--

DROP TABLE IF EXISTS `quota_blocking_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_blocking_periods` (
  `quota_blocking_period_sid` int(11) DEFAULT NULL,
  `quota_definition_sid` int(11) DEFAULT NULL,
  `blocking_start_date` date DEFAULT NULL,
  `blocking_end_date` date DEFAULT NULL,
  `blocking_period_type` int(11) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_blocking_period_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_critical_events`
--

DROP TABLE IF EXISTS `quota_critical_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_critical_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `critical_state` varchar(255) DEFAULT NULL,
  `critical_state_change_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_definitions`
--

DROP TABLE IF EXISTS `quota_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_definitions` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `quota_order_number_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `quota_order_number_sid` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `initial_volume` int(11) DEFAULT NULL,
  `measurement_unit_code` varchar(3) DEFAULT NULL,
  `maximum_precision` int(11) DEFAULT NULL,
  `critical_state` varchar(255) DEFAULT NULL,
  `critical_threshold` int(11) DEFAULT NULL,
  `monetary_unit_code` varchar(255) DEFAULT NULL,
  `measurement_unit_qualifier_code` varchar(1) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`),
  KEY `index_quota_definitions_on_measurement_unit_code` (`measurement_unit_code`),
  KEY `index_quota_definitions_on_measurement_unit_qualifier_code` (`measurement_unit_qualifier_code`),
  KEY `index_quota_definitions_on_monetary_unit_code` (`monetary_unit_code`),
  KEY `index_quota_definitions_on_quota_order_number_id` (`quota_order_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_exhaustion_events`
--

DROP TABLE IF EXISTS `quota_exhaustion_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_exhaustion_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `exhaustion_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_order_number_origin_exclusions`
--

DROP TABLE IF EXISTS `quota_order_number_origin_exclusions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_order_number_origin_exclusions` (
  `quota_order_number_origin_sid` int(11) DEFAULT NULL,
  `excluded_geographical_area_sid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_order_number_origin_sid`,`excluded_geographical_area_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_order_number_origins`
--

DROP TABLE IF EXISTS `quota_order_number_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_order_number_origins` (
  `quota_order_number_origin_sid` int(11) DEFAULT NULL,
  `quota_order_number_sid` int(11) DEFAULT NULL,
  `geographical_area_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `geographical_area_sid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_order_number_origin_sid`),
  KEY `index_quota_order_number_origins_on_geographical_area_sid` (`geographical_area_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_order_numbers`
--

DROP TABLE IF EXISTS `quota_order_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_order_numbers` (
  `quota_order_number_sid` int(11) DEFAULT NULL,
  `quota_order_number_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_order_number_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_reopening_events`
--

DROP TABLE IF EXISTS `quota_reopening_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_reopening_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `reopening_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_suspension_periods`
--

DROP TABLE IF EXISTS `quota_suspension_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_suspension_periods` (
  `quota_suspension_period_sid` int(11) DEFAULT NULL,
  `quota_definition_sid` int(11) DEFAULT NULL,
  `suspension_start_date` date DEFAULT NULL,
  `suspension_end_date` date DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_suspension_period_sid`),
  KEY `index_quota_suspension_periods_on_quota_definition_sid` (`quota_definition_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_unblocking_events`
--

DROP TABLE IF EXISTS `quota_unblocking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_unblocking_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `unblocking_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_unsuspension_events`
--

DROP TABLE IF EXISTS `quota_unsuspension_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_unsuspension_events` (
  `quota_definition_sid` int(11) DEFAULT NULL,
  `occurrence_timestamp` datetime DEFAULT NULL,
  `unsuspension_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `primary_key` (`quota_definition_sid`,`occurrence_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regulation_group_descriptions`
--

DROP TABLE IF EXISTS `regulation_group_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation_group_descriptions` (
  `regulation_group_id` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`regulation_group_id`),
  KEY `index_regulation_group_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regulation_groups`
--

DROP TABLE IF EXISTS `regulation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation_groups` (
  `regulation_group_id` varchar(255) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`regulation_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regulation_replacements`
--

DROP TABLE IF EXISTS `regulation_replacements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation_replacements` (
  `geographical_area_id` varchar(255) DEFAULT NULL,
  `chapter_heading` varchar(255) DEFAULT NULL,
  `replacing_regulation_role` int(11) DEFAULT NULL,
  `replacing_regulation_id` varchar(255) DEFAULT NULL,
  `replaced_regulation_role` int(11) DEFAULT NULL,
  `replaced_regulation_id` varchar(255) DEFAULT NULL,
  `measure_type_id` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regulation_role_type_descriptions`
--

DROP TABLE IF EXISTS `regulation_role_type_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation_role_type_descriptions` (
  `regulation_role_type_id` varchar(255) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`regulation_role_type_id`),
  KEY `index_regulation_role_type_descriptions_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regulation_role_types`
--

DROP TABLE IF EXISTS `regulation_role_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation_role_types` (
  `regulation_role_type_id` int(11) DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `national` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `primary_key` (`regulation_role_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_info` (
  `version` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_references`
--

DROP TABLE IF EXISTS `search_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `section_notes`
--

DROP TABLE IF EXISTS `section_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `section_notes_section_id_index` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `numeral` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tariff_updates`
--

DROP TABLE IF EXISTS `tariff_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariff_updates` (
  `filename` varchar(30) NOT NULL,
  `update_type` varchar(50) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transmission_comments`
--

DROP TABLE IF EXISTS `transmission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transmission_comments` (
  `comment_sid` int(11) DEFAULT NULL,
  `language_id` varchar(5) DEFAULT NULL,
  `comment_text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `primary_key` (`comment_sid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `permissions` text,
  `remotely_signed_out` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-18 11:22:11
