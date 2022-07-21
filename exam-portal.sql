-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2021 at 09:11 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrolment_results`
--

CREATE TABLE `enrolment_results` (
  `id` int(11) NOT NULL,
  `student_code` varchar(55) NOT NULL,
  `examinations_id` int(11) NOT NULL,
  `result` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrolment_results`
--

INSERT INTO `enrolment_results` (`id`, `student_code`, `examinations_id`, `result`) VALUES
(66, '12345', 7, '100%');

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

CREATE TABLE `examinations` (
  `id` int(11) NOT NULL,
  `module_code` varchar(8) DEFAULT NULL,
  `start_time` varchar(55) DEFAULT NULL,
  `completion_time` varchar(55) DEFAULT NULL,
  `exam_type` varchar(11) NOT NULL DEFAULT 'MCQ',
  `exam_date` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `examinations`
--

INSERT INTO `examinations` (`id`, `module_code`, `start_time`, `completion_time`, `exam_type`, `exam_date`) VALUES
(7, 'ICT1521', '11AM', '12PM', 'MCQ', '11/20/2021'),
(8, 'ICT2611', '9AM', '12PM', 'MCQ', '11/21/2021');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_code` varchar(8) NOT NULL,
  `module_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_code`, `module_name`) VALUES
(1, 'BSM1501', 'Business Management IA'),
(2, 'ENN1504', 'Practising Workplace English'),
(3, 'EUP1501', 'Ethical Information and Comm'),
(4, 'FAC1501', 'Introduction to Financial Accounting'),
(5, 'ICT1511', 'Introduction to Programming'),
(6, 'ICT1512', 'Introduction to Interactive Programming'),
(7, 'ICT1513', 'Introduction to Web Design'),
(8, 'ICT1521', 'Introduction to Databases'),
(9, 'ICT1531', 'Workstation Technical Skills'),
(10, 'ICT1532', 'Network Technical Skills'),
(11, 'ICT1541', 'Business Informatics I'),
(12, 'ICT2611', 'Graphical user Interface Pro'),
(13, 'ICT2612', 'Interactive Programming'),
(14, 'ICT2613', 'Internet Programming'),
(15, 'ICT2621', 'Structured Systems Analysis'),
(16, 'ICT2631', 'Operating Systems Practice'),
(17, 'ICT2641', 'Business Informatics IIA'),
(18, 'ICT2642', 'Business Informatics IIB'),
(19, 'ICT3611', 'Advanced Graphical user Interface Programming'),
(20, 'ICT3612', 'Advanced Internet Programming'),
(21, 'ICT3621', 'Database Design'),
(22, 'ICT3631', 'Advanced Operating System Practice'),
(23, 'ICT3641', 'Business Informatics IIIA'),
(24, 'ICT3642', 'Business Informatics IIIB'),
(25, 'ICT3715', 'Information and Communication Technology project'),
(26, 'ICT3722', 'Database Practice'),
(27, 'INF3708', 'Software Project Management');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `examinations_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `option_1` text DEFAULT NULL,
  `option_2` text DEFAULT NULL,
  `option_3` text DEFAULT NULL,
  `option_4` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `examinations_id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `answer`) VALUES
(4, 7, 'What format is the # for colors stand for in programming?', 'Hexidecimal', 'Binary', 'DOS', 'RAM', 'option_1'),
(5, 7, 'What does PHP stand for?', 'Javacript', 'Hypertext Preprocessor', 'Personal Hub Port', 'Pine Number Port', 'option_2'),
(6, 8, 'What does MIA mean?', 'Miss Incredible Ann', 'More Ideal Areas', 'Missing In Action', 'Might I Add', 'option_3'),
(7, 8, 'Who is the best soccer player?', 'Messi', 'Tevez', 'Fish', 'Ranaldo', 'option_4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `id_number` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `student` tinyint(1) DEFAULT 0,
  `student_number` varchar(55) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `surname`, `id_number`, `email`, `password`, `admin`, `student`, `student_number`, `created`) VALUES
(23, 'nic.mantzivis@gmail.com', 'nic', 'mantzivis', '946516843186581', 'nic.mantzivis@gmail.com', '$2y$10$T37WAZpsBGFob5.103oMNOie9ROYw0pPPQkSxYraFke2.smQOJ31e', 0, 1, '12345', '2021-11-20 03:37:26'),
(26, '30024552@mylife.unisa.ac.za', 'Mervin', 'Douwdies', '123456789', '30024552@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '30024552', '2021-11-19 09:39:02'),
(27, '31518567@mylife.unisa.ac.za', 'William Ramogatsane', 'Matlala', '35131515615135', '31518567@mylife.unisa.ac.za', '$2y$10$BDEZVGkR9bYU7ixoVK1A..Uni2EqYE8mL2gai.dqSPAHD9x5JHoP6', 0, 1, '31518567', '2021-11-19 09:40:08'),
(28, '31624855@mylife.unisa.ac.za', 'Charlene', 'Noome', '356465351531', '31624855@mylife.unisa.ac.za', '$2y$10$ihbBjG7N1q9YWCmHgdJwxews5.PkeRVm.edBgrzLRHjtA..PkETIu', 0, 1, '31624855', '2021-11-19 09:41:04'),
(29, '31796958@mylife.unisa.ac.za', 'Anastasia', 'Makgoba', '684631351351', '31796958@mylife.unisa.ac.za', '$2y$10$QvDbduNrEv5J/9awmbi35eI2s1Qx3cDpac7BIRwCUYBWapa6ubAdy', 0, 1, '31796958', '2021-11-19 09:42:08'),
(30, '49973592@mylife.unisa.ac.za', 'Bandi', 'Shana', '6546516546541', '49973592@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '32165498', '2021-11-19 09:56:54'),
(31, '50319477@mylife.unisa.ac.za', 'Daniel', 'Mbedla', '6546516546541', '50319477@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '33553171', '2021-11-19 09:56:54'),
(32, '34576851@mylife.unisa.ac.za', 'Craig', 'Brickhill', '6546516546541', '34576851@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '34576851', '2021-11-19 09:56:54'),
(33, '34605363@mylife.unisa.ac.za', 'Boni', 'Mthembu', '6546516546541', '34605363@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '34605363', '2021-11-19 09:56:54'),
(34, '35164034@mylife.unisa.ac.za', 'Amos', 'Muravha', '6546516546541', '35164034@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '35164034', '2021-11-19 09:56:54'),
(35, '35375132@mylife.unisa.ac.za', 'Kgaugelo', 'Maake', '6546516546541', '35375132@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '35375132', '2021-11-19 09:56:54'),
(36, '35619759@mylife.unisa.ac.za', 'Sibusiso Charles', 'Sithole', '6546516546541', '35619759@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '35619759', '2021-11-19 09:56:54'),
(37, '35859334@mylife.unisa.ac.za', 'Amukelani Isaac', 'Maasungwini', '6546516546541', '35859334@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '35859334', '2021-11-19 09:56:54'),
(38, '36565571@mylife.unisa.ac.za', 'Tim', 'Talk', '6546516546541', '36565571@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '36456678', '2021-11-19 09:56:54'),
(39, '36525936@mylife.unisa.ac.za', 'Mmadineo Mavis', 'Phakwago', '6546516546541', '36525936@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '36525936', '2021-11-19 09:56:54'),
(40, '36833118@mylife.unisa.ac.za', 'Faith', 'Moshoadiba', '6546516546541', '36833118@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '36833118', '2021-11-19 09:56:54'),
(41, '36904848@mylife.unisa.ac.za', 'Andile', 'Phakathi', '6546516546541', '36904848@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '36904848', '2021-11-19 09:56:54'),
(42, '37043196@mylife.unisa.ac.za', 'Adam', 'Mphaphuli', '6546516546541', '37043196@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '37043196', '2021-11-19 09:56:54'),
(43, '37130730@mylife.unisa.ac.za', 'Khotso', 'Mokoena', '6546516546541', '37130730@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '37130730', '2021-11-19 09:56:54'),
(44, '37366424@mylife.unisa.ac.za', 'Thabisa', 'Yeki', '6546516546541', '37366424@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '37366424', '2021-11-19 09:56:54'),
(45, '37393901@mylife.unisa.ac.za', 'Zamani', 'Dubazana', '6546516546541', '37393901@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '37393901', '2021-11-19 09:56:54'),
(46, '39671801@mylife.unisa.ac.za', 'Aluwani Ewing', 'Phaswana', '6546516546541', '39671801@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '39671801', '2021-11-19 09:56:54'),
(47, '32899238@mylife.unisa.ac.za', 'Mamane', 'Maubane', '6546516546541', '32899238@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '40000444', '2021-11-19 09:56:54'),
(48, '40080269@mylife.unisa.ac.za', 'Daniel ', 'Louw', '6546516546541', '40080269@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '40080269', '2021-11-19 09:56:54'),
(49, '40544605@mylife.unisa.ac.za', 'Brigitte', 'Levendal', '6546516546541', '40544605@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '40544605', '2021-11-19 09:56:54'),
(50, '31281745@mylife.unisa.ac.za', 'Funny', 'Bunny', '6546516546541', '31281745@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '40587208', '2021-11-19 09:56:54'),
(51, '41148665@mylife.unisa.ac.za', 'Tendani Joubert', 'Tshikalange', '6546516546541', '41148665@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '41148665', '2021-11-19 09:56:54'),
(52, '51388944@mylife.unisa.ac.za', 'Themba Given', 'Seloana', '6546516546541', '51388944@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '41388944', '2021-11-19 09:56:54'),
(53, '41624815@mylife.unisa.ac.za', 'Martha', 'Makgoba', '6546516546541', '41624815@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '41624815', '2021-11-19 09:56:54'),
(54, '42039991@mylife.unisa.ac.za', 'Kelemogile', 'Lekalake', '6546516546541', '42039991@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '42039991', '2021-11-19 09:56:54'),
(55, '42103215@mylife.unisa.ac.za', 'Nkosana ', 'Duba', '6546516546541', '42103215@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '42103215', '2021-11-19 09:56:54'),
(56, '42116228@mylife.unisa.ac.za', 'Boitumelo', 'Seswike', '6546516546541', '42116228@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '42116228', '2021-11-19 09:56:54'),
(57, '43378080@mylife.unisa.ac.za', 'Ashley', 'Rhodes', '6546516546541', '43378080@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '43378080', '2021-11-19 09:56:54'),
(58, '44087810@mylife.unisa.ac.za', 'Liza', 'Boshoff', '6546516546541', '44087810@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '44087810', '2021-11-19 09:56:54'),
(59, '45319855@mylife.unisa.ac.za', 'Silulami ', 'Sokufudumala', '6546516546541', '45319855@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '44218963', '2021-11-19 09:56:54'),
(60, '44974825@mylife.unisa.ac.za', 'Hannah', 'Cummings', '6546516546541', '44974825@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '44769011', '2021-11-19 09:56:54'),
(61, '45015945@mylife.unisa.ac.za', 'Osca', 'Sibede', '6546516546541', '45015945@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45015945', '2021-11-19 09:56:54'),
(62, '45096937@mylife.unisa.ac.za', 'Ntsakisi', 'Shikwambana', '6546516546541', '45096937@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45096937', '2021-11-19 09:56:54'),
(63, '45319855@mylife.unisa.ac.za', 'Madoda', 'Tshutsha', '6546516546541', '45319855@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45218977', '2021-11-19 09:56:54'),
(64, '45319855@mylife.unisa.ac.za', 'Silulami ', 'Sokufudumala', '6546516546541', '45319855@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45319855', '2021-11-19 09:56:54'),
(65, '45563748@mylife.unisa.ac.za', 'Sebushi Joseph', 'Lehong', '6546516546541', '45563748@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45563748', '2021-11-19 09:56:54'),
(66, '45683921@mylife.unisa.ac.za', 'Louisa Ntombi ', 'Hlongwane', '6546516546541', '45683921@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45683921', '2021-11-19 09:56:54'),
(67, '45693315@mylife.unisa.ac.za', 'Rhandzu', 'Rikhotso', '6546516546541', '45693315@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45693315', '2021-11-19 09:56:54'),
(68, '42116228@mylife.unisa.ac.za', 'Bongi', 'Born', '6546516546541', '42116228@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45826431', '2021-11-19 09:56:54'),
(69, '50382276@mylife.unisa.ac.za', 'Sipho', 'Mahlangu', '6546516546541', '50382276@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '45838548', '2021-11-19 09:56:54'),
(70, '46069828@mylife.unisa.ac.za', 'Koena ', 'Cholo', '6546516546541', '46069828@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '46069828', '2021-11-19 09:56:54'),
(71, '46148302@mylife.unisa.ac.za', 'Tshepo', 'Mulaudzi', '6546516546541', '46148302@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '46148302', '2021-11-19 09:56:54'),
(72, '46240314@mylife.unisa.ac.za', 'Lungile', 'Ndlovu', '6546516546541', '46240314@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '46240315', '2021-11-19 09:56:54'),
(73, '46240314@mylife.unisa.ac.za', 'Sifundo', 'Bhengu', '6546516546541', '46240314@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '46250315', '2021-11-19 09:56:54'),
(74, '46466029@mylife.unisa.ac.za', 'Bryan', 'Brown', '6546516546541', '46466029@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '46466029', '2021-11-19 09:56:54'),
(75, '48202177@mylife.unisa.ac.za', 'Lesedi ', 'Modiri', '6546516546541', '48202177@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47201222', '2021-11-19 09:56:54'),
(76, '47275154@mylife.unisa.ac.za', 'Phillip', 'Odendaal', '6546516546541', '47275154@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47275154', '2021-11-19 09:56:54'),
(77, '47304413@mylife.unisa.ac.za', 'Jodie', 'Roos', '6546516546541', '47304413@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47304413', '2021-11-19 09:56:54'),
(78, '47576545@mylife.unisa.ac.za', 'Dustin Booysen', 'Marcus', '6546516546541', '47576545@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47576545', '2021-11-19 09:56:54'),
(79, '47589310@mylife.unisa.ac.za', 'Lungile Lloyd', 'Fondile', '6546516546541', '47589310@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47589310', '2021-11-19 09:56:54'),
(80, '47655453@mylife.unisa.ac.za', 'Ledwaba', 'Mashiane', '6546516546541', '47655453@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47655453', '2021-11-19 09:56:54'),
(81, '47713690@mylife.unisa.ac.za', 'Lee', 'Liebenberg', '6546516546541', '47713690@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '47713690', '2021-11-19 09:56:54'),
(82, '48202177@mylife.unisa.ac.za', 'Nomvula ', 'Mahlangu ', '6546516546541', '48202177@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '48202177', '2021-11-19 09:56:54'),
(83, '48615544@mylife.unisa.ac.za', 'Cynthia', 'Magumura', '6546516546541', '48615544@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '48615544', '2021-11-19 09:56:54'),
(84, '48783854@mylife.unisa.ac.za', 'Zukiswa Vivian', 'Mapeyi', '6546516546541', '48783854@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '48783854', '2021-11-19 09:56:54'),
(85, '48949027@mylife.unisa.ac.za', 'William Kagiso', 'Mashabane', '6546516546541', '48949027@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '48949027', '2021-11-19 09:56:54'),
(86, '49222457@mylife.unisa.ac.za', 'Freddy', 'Mkhari', '6546516546541', '49222457@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49222457', '2021-11-19 09:56:54'),
(87, '49301500@mylife.unisa.ac.za', 'Reuben', 'Mokeretla', '6546516546541', '49301500@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49301500', '2021-11-19 09:56:54'),
(88, '49301500@mylife.unisa.ac.za', 'Thabo', 'Lebese', '6546516546541', '49301500@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49301522', '2021-11-19 09:56:54'),
(89, '49391933@mylife.unisa.ac.za', 'Sivuyile', 'Kwaza', '6546516546541', '49391933@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49391933', '2021-11-19 09:56:54'),
(90, '49690493@mylife.unisa.ac.za', 'Palesa', 'Mahlangu ', '6546516546541', '49690493@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49690493', '2021-11-19 09:56:54'),
(91, '49724169@mylife.unisa.ac.za', 'Johanna', 'Ramushi', '6546516546541', '49724169@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49724169', '2021-11-19 09:56:54'),
(92, '49844458@mylife.unisa.ac.za', 'Godfrey', 'Olifant', '6546516546541', '49844458@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49844458', '2021-11-19 09:56:54'),
(93, '49265822@mylife.unisa.ac.za', 'Nomcebo', 'Sekgoto', '6546516546541', '49265822@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49865822', '2021-11-19 09:56:54'),
(94, '49973592@mylife.unisa.ac.za', 'Babalwa ', 'Lukashe', '6546516546541', '49973592@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '49973592', '2021-11-19 09:56:54'),
(95, '50319477@mylife.unisa.ac.za', 'Daniel', 'Mbedla', '6546516546541', '50319477@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '50319477', '2021-11-19 09:56:54'),
(96, '50369512@mylife.unisa.ac.za', 'Kagiso', 'Sebolao', '6546516546541', '50369512@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '50369512', '2021-11-19 09:56:54'),
(97, '50382276@mylife.unisa.ac.za', 'William', 'Masombuka', '6546516546541', '50382276@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '50382276', '2021-11-19 09:56:54'),
(98, '53043537@mylife.unisa.ac.za', 'Elsie ', 'Moloko', '6546516546541', '53043537@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '50636753', '2021-11-19 09:56:54'),
(99, '50727567@mylife.unisa.ac.za', 'Ndivhuho ', 'Magwede', '6546516546541', '50727567@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '50727567', '2021-11-19 09:56:54'),
(100, '51092387@mylife.unisa.ac.za', 'Lutendo Patric', 'Nethononda', '6546516546541', '51092387@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51092387', '2021-11-19 09:56:54'),
(101, '51300265@mylife.unisa.ac.za', 'Mapotlaganye Nicholas', 'Maripane', '6546516546541', '51300265@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51300265', '2021-11-19 09:56:54'),
(102, '51318679@mylife.unisa.ac.za', 'Kholofelo', 'Kgole', '6546516546541', '51318679@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51318769', '2021-11-19 09:56:54'),
(103, '51348020@mylife.unisa.ac.za', 'Mokhudu Suzan ', 'Mogale', '6546516546541', '51348020@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51348020', '2021-11-19 09:56:54'),
(104, '51548283@mylife.unisa.ac.za', 'Olebogeng ', 'Mahlonoko ', '6546516546541', '51548283@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51548283', '2021-11-19 09:56:54'),
(105, '51847787@mylife.unisa.ac.za', 'Siphumle', 'Kolisi', '6546516546541', '51847787@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51847787', '2021-11-19 09:56:54'),
(106, '51856867@mylife.unisa.ac.za', 'Eric', 'Friedenthal', '6546516546541', '51856867@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '51856867', '2021-11-19 09:56:54'),
(107, '53007328@mylife.unisa.ac.za', 'Sandise', 'Phili', '6546516546541', '53007328@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53007328', '2021-11-19 09:56:54'),
(108, '55334792@mylife.unisa.ac.za', 'Alfred', 'Kobus', '6546516546541', '55334792@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53016821', '2021-11-19 09:56:54'),
(109, '53043537@mylife.unisa.ac.za', 'Rachael ', 'Mahlangu ', '6546516546541', '53043537@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53043537', '2021-11-19 09:56:54'),
(110, '53436164@mylife.unisa.ac.za', 'Katlego', 'Namola', '6546516546541', '53436164@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53436164', '2021-11-19 09:56:54'),
(111, '53508459@mylife.unisa.ac.za', 'Kabelo', 'Motlhabane', '6546516546541', '53508459@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53508359', '2021-11-19 09:56:54'),
(112, '53508459@mylife.unisa.ac.za', 'Kabelo', 'Motlhabane', '6546516546541', '53508459@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53508459', '2021-11-19 09:56:54'),
(113, '53885767@mylife.unisa.ac.za', 'Sylvester', 'Mamabolo', '6546516546541', '53885767@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53885767', '2021-11-19 09:56:54'),
(114, '53905547@mylife.unisa.ac.za', 'Christopher', 'Khumalo', '6546516546541', '53905547@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '53905547', '2021-11-19 09:56:54'),
(115, '54042070@mylife.unisa.ac.za', 'Tebogo', 'Twala', '6546516546541', '54042070@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54042070', '2021-11-19 09:56:54'),
(116, '45015945@mylife.unisa.ac.za', 'Nditshe', 'Sibe', '6546516546541', '45015945@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54109554', '2021-11-19 09:56:54'),
(117, '55422349@mylife.unisa.ac.za', 'Amanda', 'Norris', '6546516546541', '55422349@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54462832', '2021-11-19 09:56:54'),
(118, '54511909@mylife.unisa.ac.za', 'Sisanda', 'Kimbili', '6546516546541', '54511909@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54511909', '2021-11-19 09:56:54'),
(119, '54657628@mylife.unisa.ac.za', 'Lehlohonolo', 'Lekhelebane', '6546516546541', '54657628@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54657628', '2021-11-19 09:56:54'),
(120, '54756731@mylife.unisa.ac.za', 'Pakama ', 'Daniso', '6546516546541', '54756731@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54756731', '2021-11-19 09:56:54'),
(121, '54760372@mylife.unisa.ac.za', 'Ashly', 'Raju', '6546516546541', '54760372@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54760372', '2021-11-19 09:56:54'),
(122, '54787602@mylife.unisa.ac.za', 'Vivian', 'Govender ', '6546516546541', '54787602@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54787602', '2021-11-19 09:56:54'),
(123, '54803977@mylife.unisa.ac.za', 'Pieter', 'Skhosana', '6546516546541', '54803977@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54803977', '2021-11-19 09:56:54'),
(124, '50178695@mylife.unisa.ac.za', 'Thabo', 'Mmala', '6546516546541', '50178695@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54889612', '2021-11-19 09:56:54'),
(125, '54935369@mylife.unisa.ac.za', 'Kabelo ', 'Ledimo ', '6546516546541', '54935369@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '54935369', '2021-11-19 09:56:54'),
(126, '55189660@mylife.unisa.ac.za', 'Shaun ', 'De Witt', '6546516546541', '55189660@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55189660', '2021-11-19 09:56:54'),
(127, '55923542@mylife.unisa.ac.za', 'Sbabalwe ', 'Hanise', '6546516546541', '55923542@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55425392', '2021-11-19 09:56:54'),
(128, '55437451@mylife.unisa.ac.za', 'Thembi', 'Chabangu', '6546516546541', '55437451@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55435793', '2021-11-19 09:56:54'),
(129, '55457037@mylife.unisa.ac.za', 'Kyle ', 'Gounden', '6546516546541', '55457037@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55457037', '2021-11-19 09:56:54'),
(130, '55796257@mylife.unisa.ac.za', 'Neall', 'Siems', '6546516546541', '55796257@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55796257', '2021-11-19 09:56:54'),
(131, '55815022@mylife.unisa.ac.za', 'Clement ', 'Jakalase', '6546516546541', '55815022@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55815022', '2021-11-19 09:56:54'),
(132, '55830242@mylife.unisa.ac.za', 'Phemza', 'Disco', '6546516546541', '55830242@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55830242', '2021-11-19 09:56:54'),
(133, '55858058@mylife.unisa.ac.za', 'Lenny', 'Naicker', '6546516546541', '55858058@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55858058', '2021-11-19 09:56:54'),
(134, '55872433@mylife.unisa.ac.za', 'Stephen', 'Koekemoer', '6546516546541', '55872433@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55872433', '2021-11-19 09:56:54'),
(135, '55900801@mylife.unisa.ac.za', 'Arno', 'Heunis', '6546516546541', '55900801@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '55900801', '2021-11-19 09:56:54'),
(136, '56161204@mylife.unisa.ac.za', 'Lebogang', 'Sebothoma', '6546516546541', '56161204@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56123648', '2021-11-19 09:56:54'),
(137, '45563748@mylife.unisa.ac.za', 'Joseph ', 'Lehong ', '6546516546541', '45563748@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56234512', '2021-11-19 09:56:54'),
(138, '56252226@mylife.unisa.ac.za', 'Justice ', 'Mabunda ', '6546516546541', '56252226@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56252226', '2021-11-19 09:56:54'),
(139, '56320035@mylife.unisa.ac.za', 'Gerald ', 'Manda', '6546516546541', '56320035@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56320035', '2021-11-19 09:56:54'),
(140, '56993048@mylife.unisa.ac.za', 'Sylvester', 'Stallone', '6546516546541', '56993048@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56345377', '2021-11-19 09:56:54'),
(141, '56353073@mylife.unisa.ac.za', 'Makhosazana ', 'Mkhatshwa ', '6546516546541', '56353073@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56353073', '2021-11-19 09:56:54'),
(142, '55334792@mylife.unisa.ac.za', 'James', 'Bond', '6546516546541', '55334792@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56453218', '2021-11-19 09:56:54'),
(143, '56624727@mylife.unisa.ac.za', 'Molebogeng ', 'Sehularo', '6546516546541', '56624727@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56624727', '2021-11-19 09:56:54'),
(144, '56643772@mylife.unisa.ac.za', 'Wesley', 'Jacobs', '6546516546541', '56643772@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56643772', '2021-11-19 09:56:54'),
(145, '56693141@mylife.unisa.ac.za', 'Portia', 'Nyathi', '6546516546541', '56693141@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56693141', '2021-11-19 09:56:54'),
(146, '56775520@mylife.unisa.ac.za', 'Khathutshelo', 'Munyai', '6546516546541', '56775520@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56775520', '2021-11-19 09:56:54'),
(147, '56891326@mylife.unisa.ac.za', 'Mahesh', 'Jina', '6546516546541', '56891326@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56891326', '2021-11-19 09:56:54'),
(148, '56941773@mylife.unisa.ac.za', 'Matimba', 'Konjane', '6546516546541', '56941773@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56941773', '2021-11-19 09:56:54'),
(149, '56997914@mylife.unisa.ac.za', 'Evidance', 'Sithole', '6546516546541', '56997914@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '56997914', '2021-11-19 09:56:54'),
(150, '57031002@mylife.unisa.ac.za', 'Qondile', 'Khoza', '6546516546541', '57031002@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57031002', '2021-11-19 09:56:54'),
(151, '57135746@mylife.unisa.ac.za', 'Godwill', 'Gwaindepi', '6546516546541', '57135746@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57135746', '2021-11-19 09:56:54'),
(152, '57145903@mylife.unisa.ac.za', 'Farisani', 'Farisani', '6546516546541', '57145903@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57145903', '2021-11-19 09:56:54'),
(153, '64211592@mylife.unisa.ac.za', 'Thobi', 'Xeni', '6546516546541', '64211592@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57373356', '2021-11-19 09:56:54'),
(154, '57389004@mylife.unisa.ac.za', 'Israel', 'Mncube ', '6546516546541', '57389004@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57389004', '2021-11-19 09:56:54'),
(155, '57452210@mylife.unisa.ac.za', 'Vuyiseka', 'Magazi', '6546516546541', '57452210@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57452210', '2021-11-19 09:56:54'),
(156, '57685584@mylife.unisa.ac.za', 'Seholastic', 'Mokole', '6546516546541', '57685584@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57685584', '2021-11-19 09:56:54'),
(157, '57739129@mylife.unisa.ac.za', 'Sanele', 'Mtshali', '6546516546541', '57739129@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57739129', '2021-11-19 09:56:54'),
(158, '57957541@mylife.unisa.ac.za', 'Welcome ', 'Sthebe', '6546516546541', '57957541@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '57957541', '2021-11-19 09:56:54'),
(159, '58034099@mylife.unisa.ac.za', 'Ressick', 'Mashishi', '6546516546541', '58034099@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58034099', '2021-11-19 09:56:54'),
(160, '58125310@mylife.unisa.ac.za', 'Dawid', 'Schutte', '6546516546541', '58125310@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58125310', '2021-11-19 09:56:54'),
(161, '58129960@mylife.unisa.ac.za', 'Judith', 'Maganelisa', '6546516546541', '58129960@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58129960', '2021-11-19 09:56:54'),
(162, '58278362@mylife.unisa.ac.za', 'Roan', 'Jacobs', '6546516546541', '58278362@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58278362', '2021-11-19 09:56:54'),
(163, '58308377@mylife.unisa.ac.za', 'Nondumiso', 'Ngobese', '6546516546541', '58308377@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58308377', '2021-11-19 09:56:54'),
(164, '58355251@mylife.unisa.ac.za', 'Gopolang', 'Dikgale', '6546516546541', '58355251@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58355251', '2021-11-19 09:56:54'),
(165, '58160329@mylife.unisa.ac.za', 'Asanda', 'Matini', '6546516546541', '58160329@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58762469', '2021-11-19 09:56:54'),
(166, '55830242@mylife.unisa.ac.za', 'Thindi', 'Good', '6546516546541', '55830242@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '58986611', '2021-11-19 09:56:54'),
(167, '59012552@mylife.unisa.ac.za', 'Paul', 'Van Der Merwe', '6546516546541', '59012552@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '59012552', '2021-11-19 09:56:54'),
(168, '59258497@mylife.unisa.ac.za', 'Sifiso ', 'Mabaso ', '6546516546541', '59258497@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '59258497', '2021-11-19 09:56:54'),
(169, '59362111@mylife.unisa.ac.za', 'Tsheko', 'Kutumela', '6546516546541', '59362111@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '59362111', '2021-11-19 09:56:54'),
(170, '59480815@mylife.unisa.ac.za', 'Zareena', 'Daya', '6546516546541', '59480815@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '59480815', '2021-11-19 09:56:54'),
(171, '60322551@mylife.unisa.ac.za', 'Teneal', 'Moonsamy', '6546516546541', '60322551@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '60322551', '2021-11-19 09:56:54'),
(172, '60688645@mylife.unisa.ac.za', 'John', 'Wick', '6546516546541', '60688645@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '60639384', '2021-11-19 09:56:54'),
(173, '60977345@mylife.unisa.ac.za', 'Mike', 'Smith', '6546516546541', '60977345@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '60843591', '2021-11-19 09:56:54'),
(174, '65921097@mylife.unisa.ac.za', 'Dipuo', 'Talks', '6546516546541', '65921097@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '60921096', '2021-11-19 09:56:54'),
(175, '61033979@mylife.unisa.ac.za', 'Koketso', 'Manabile', '6546516546541', '61033979@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '61033979', '2021-11-19 09:56:54'),
(176, '61384380@mylife.unisa.ac.za', 'Mmapula ', 'Rammutla ', '6546516546541', '61384380@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '61384380', '2021-11-19 09:56:54'),
(177, '61691534@mylife.unisa.ac.za', 'Lebogang Mailaila', 'Phatlane', '6546516546541', '61691534@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '61691534', '2021-11-19 09:56:54'),
(178, '62140957@mylife.unisa.ac.za', 'Khomotso Joseph ', 'Ntlema ', '6546516546541', '62140957@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '62140957', '2021-11-19 09:56:54'),
(179, '62142941@mylife.unisa.ac.za', 'Thapelo', 'Rapatje', '6546516546541', '62142941@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '62142941', '2021-11-19 09:56:54'),
(180, '62503464@mylife.unisa.ac.za', 'Nkateko', 'Nkosi', '6546516546541', '62503464@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '62503464', '2021-11-19 09:56:54'),
(181, '62711563@mylife.unisa.ac.za', 'Aniel', 'Feyt', '6546516546541', '62711563@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '62711563', '2021-11-19 09:56:54'),
(182, '62732765@mylife.unisa.ac.za', 'Ardlight', 'Gutukunuhwa', '6546516546541', '62732765@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '62732765', '2021-11-19 09:56:54'),
(183, '63384140@mylife.unisa.ac.za', 'Yogan', 'Chetty', '6546516546541', '63384140@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '63384140', '2021-11-19 09:56:54'),
(184, '63627922@mylife.unisa.ac.za', 'Liziwe ', 'Dantile', '6546516546541', '63627922@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '63627922', '2021-11-19 09:56:54'),
(185, '63633337@mylife.unisa.ac.za', 'Frans', 'Rautenbach', '6546516546541', '63633337@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '63633337', '2021-11-19 09:56:54'),
(186, '63989948@mylife.unisa.ac.za', 'Gift Mthokozisi ', 'Sekhosana ', '6546516546541', '63989948@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '63989948', '2021-11-19 09:56:54'),
(187, '64235955@mylife.unisa.ac.za', 'Khangwelo', 'Maphaha', '6546516546541', '64235955@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '64235955', '2021-11-19 09:56:54'),
(188, '64317765@mylife.unisa.ac.za', 'Nkosinathi', 'Mkhize', '6546516546541', '64317765@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '64317765', '2021-11-19 09:56:54'),
(189, '64891178@mylife.unisa.ac.za', 'Recommend ', 'Khoza ', '6546516546541', '64891178@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '64891178', '2021-11-19 09:56:54'),
(190, '64898741@mylife.unisa.ac.za', 'Khangweni', 'Mulovhedzi', '6546516546541', '64898741@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '64898741', '2021-11-19 09:56:54'),
(191, '65921097@mylife.unisa.ac.za', 'Nhlanhla', 'Ndobe', '6546516546541', '65921097@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '65921097', '2021-11-19 09:56:54'),
(192, '62835599@mylife.unisa.ac.za', 'Phuthi', 'Phongolo', '6546516546541', '62835599@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '66003478', '2021-11-19 09:56:54'),
(193, '36622567@mylife.unisa.ac.za', 'Serame', 'Ngoakomonye', '6546516546541', '36622567@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '70755361', '2021-11-19 09:56:54'),
(194, '54803977@mylife.unisa.ac.za', 'Pat', 'Muzi', '6546516546541', '54803977@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '74803514', '2021-11-19 09:56:54'),
(195, '56775520@mylife.unisa.ac.za', 'Mudau ', 'John', '6546516546541', '56775520@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '76895540', '2021-11-19 09:56:54'),
(196, '60635495@mylife.unisa.ac.za', 'Dorothy Malesia', 'Pitso', '6546516546541', '60635495@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '78569043', '2021-11-19 09:56:54'),
(197, '37027166@mylife.unisa.ac.za', 'Devendhra', 'Naran', '6546516546541', '37027166@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '78901236', '2021-11-19 09:56:54'),
(198, '59079541@mylife.unisa.ac.za', 'Tshilewu Gael', 'Mutombo', '6546516546541', '59079541@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '81234566', '2021-11-19 09:56:54'),
(199, '49365339@mylife.unisa.ac.za', 'Ali', 'Barber', '6546516546541', '49365339@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '82456910', '2021-11-19 09:56:54'),
(200, '61384380@mylife.unisa.ac.za', 'Mmapula ', 'Rammutla ', '6546516546541', '61384380@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '96072403', '2021-11-19 09:56:54'),
(201, '57031002@mylife.unisa.ac.za', 'Necky', 'Khoza', '6546516546541', '57031002@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '96701002', '2021-11-19 09:56:54'),
(202, '44512406@mylife.unisa.ac.za', 'Jane', 'Doe', '6546516546541', '44512406@mylife.unisa.ac.za', '$2y$10$YdcNy62ZmfxRvmWwY3VOVuL3T32u3EjKgr2c68zi3zkkd7JxUnVTe', 0, 1, '98752146', '2021-11-19 09:56:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrolment_results`
--
ALTER TABLE `enrolment_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examinations`
--
ALTER TABLE `examinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrolment_results`
--
ALTER TABLE `enrolment_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `examinations`
--
ALTER TABLE `examinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
