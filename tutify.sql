-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 11:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutify`
--

-- --------------------------------------------------------

--
-- Table structure for table `assesment`
--

CREATE TABLE `assesment` (
  `assesment_title` varchar(255) NOT NULL,
  `assesment_type` varchar(255) NOT NULL,
  `assesment_description` longtext NOT NULL,
  `due_date` date NOT NULL,
  `attachment_files` longblob NOT NULL,
  `course_id` int(255) NOT NULL,
  `assesment_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assesment`
--

INSERT INTO `assesment` (`assesment_title`, `assesment_type`, `assesment_description`, `due_date`, `attachment_files`, `course_id`, `assesment_id`) VALUES
('Cloud', 'assignment', '<p>please submit on time</p>', '2023-05-26', 0x2e2e2f75706c6f6164732f6173736573736d656e74732f36343665343934393138373162342e39353133353730342e706466, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(11) NOT NULL,
  `class_time` time NOT NULL,
  `class_date` date NOT NULL,
  `class_duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_name` varchar(255) NOT NULL,
  `course_id` int(255) NOT NULL,
  `course_intsructor` varchar(255) NOT NULL,
  `course_duration` varchar(255) NOT NULL,
  `course_price` int(255) NOT NULL,
  `course_description` varchar(255) NOT NULL,
  `id` int(255) NOT NULL,
  `course_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_name`, `course_id`, `course_intsructor`, `course_duration`, `course_price`, `course_description`, `id`, `course_image`) VALUES
('Computer Science', 1, 'Muhammad Sameer', '2 months', 5000, 'this is for matric Students', 0, 'computerr.jpeg'),
('Physics ', 2, 'Muhammad Sameer', '2 months', 5000, 'this course is for first year students', 0, 'physc.png');

-- --------------------------------------------------------

--
-- Table structure for table `course_content`
--

CREATE TABLE `course_content` (
  `content_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `content_title` varchar(255) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `content_file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_content`
--

INSERT INTO `course_content` (`content_id`, `course_id`, `content_title`, `content_type`, `content_file`, `created_at`) VALUES
(1, 1, 'cloud Computing', 'documents', '../uploads/content/646e317aec4d56.84185339.pdf', '2023-05-24 15:47:06'),
(2, 1, 'cloud Computing A2', 'slides', '../uploads/content/646e319a7951f7.81023097.pdf', '2023-05-24 15:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `enrolmentt`
--

CREATE TABLE `enrolmentt` (
  `enrolment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enrolment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolmentt`
--

INSERT INTO `enrolmentt` (`enrolment_id`, `user_id`, `course_id`, `type`, `enrolment_date`, `user_name`, `course_name`) VALUES
(1, 3, 1, '', '2023-05-24 19:31:04', 'Abdullah', 'Computer Science'),
(2, 3, 1, '', '2023-05-25 06:36:31', 'Abdullah', 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `created_at`, `is_read`, `user_name`, `type`) VALUES
(0, 0, 'notification', '2023-05-24 19:56:35', 0, 'Muhammad Sameer', 'info');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` text NOT NULL,
  `expmonth` varchar(2) NOT NULL,
  `expyear` varchar(4) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_id` int(255) NOT NULL,
  `course_price` float NOT NULL,
  `course_instructor` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `tutor_fee` int(255) NOT NULL,
  `platform_fee` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `fullname`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expmonth`, `expyear`, `cvv`, `course_name`, `course_id`, `course_price`, `course_instructor`, `user_id`, `tutor_fee`, `platform_fee`) VALUES
(1, 'Abdullah', 'addullaharshadchoudhary@gmail.com', 'kot peer fazal shah', 'Lahore', 'Punjab', '55260', 'Abdullah', 'UjC3+KBhY+F3OgEf69ExpQ==', 'ju', '2025', '336', 'Computer Science', 1, 5000, 'Muhammad Sameer', 3, 4750, 250),
(2, 'Abdullah', 'addullaharshadchoudhary@gmail.com', 'kot peer fazal shah', 'Lahore', 'Punjab', '55260', 'Abdullah', 'sqnLeydFKWC3ZhSHnDsl1HxWN9NH5oKYRM1tvD+LeAw=', 'ju', '2023', '335', 'Computer Science', 1, 5000, 'Muhammad Sameer', 3, 4750, 250);

-- --------------------------------------------------------

--
-- Table structure for table `platform_fee`
--

CREATE TABLE `platform_fee` (
  `platform_percentage` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platform_fee`
--

INSERT INTO `platform_fee` (`platform_percentage`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) UNSIGNED NOT NULL,
  `question` varchar(1500) NOT NULL,
  `option1` varchar(500) NOT NULL,
  `option2` varchar(500) NOT NULL,
  `option3` varchar(500) NOT NULL,
  `option4` varchar(500) NOT NULL,
  `correct_answer` varchar(110) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `subject`, `marks`, `created_at`, `updated_at`, `course_id`) VALUES
(1, 'What is the main function of an operating system?', 'Running applications', 'Managing hardware resources', 'Providing internet connectivity', 'Creating graphical user interfaces', 'Managing hardware resources', '1', 2, '2023-05-24 17:32:31', '2023-05-24 17:32:31', 0),
(2, 'What does HTML stand for?', 'HyperText Markup Language', 'High Technical Markup Language', 'Home Tool Markup Language', ' Hyperlink Text Markup Language', ' HyperText Markup Language', '1', 1, '2023-05-24 17:33:08', '2023-05-24 17:33:08', 0),
(3, 'Which programming language is known for its use in artificial intelligence and machine learning?', 'Python', 'Java', 'C++', ' Ruby', 'Python', '1', 2, '2023-05-24 17:33:51', '2023-05-24 17:33:51', 0),
(4, 'What is the purpose of a firewall in computer networks?', 'To prevent unauthorized access', 'To increase network speed', 'To provide wireless connectivity', 'To store and manage data', 'To prevent unauthorized access', '1', 2, '2023-05-24 17:34:28', '2023-05-24 17:34:28', 0),
(5, 'What is the binary representation of the decimal number 10?', '1010', '1100', '1001', '1110', '1010', '1', 1, '2023-05-24 17:34:53', '2023-05-24 17:34:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `course_id` int(30) NOT NULL,
  `score` int(30) NOT NULL,
  `user_id` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `course_id`, `score`, `user_id`) VALUES
(3, 0, 80, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assesment_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `submission_date` datetime NOT NULL DEFAULT current_timestamp(),
  `file` varchar(500) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `passing_criteria` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `subject`, `passing_criteria`) VALUES
(1, 'English', 80),
(2, 'Physics ', 80),
(3, 'Chemistry', 80),
(4, 'Math', 50),
(5, 'Computer', 80),
(6, 'Urdu', 80);

-- --------------------------------------------------------

--
-- Table structure for table `tsa_questions`
--

CREATE TABLE `tsa_questions` (
  `id` int(11) UNSIGNED NOT NULL,
  `question` varchar(1500) NOT NULL,
  `option1` varchar(500) NOT NULL,
  `option2` varchar(500) NOT NULL,
  `option3` varchar(500) NOT NULL,
  `option4` varchar(500) NOT NULL,
  `correct_answer` varchar(500) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tsa_questions`
--

INSERT INTO `tsa_questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `subject`, `marks`, `created_at`, `updated_at`) VALUES
(1, 'What is the comparative form of the adjective \"good\"?', 'Gooder', 'Better', 'Best', 'More good', 'Better', 'English', 1, '2023-05-24 15:27:39', '2023-05-24 15:27:39'),
(2, 'Choose the correct spelling:', 'Acquaintence', 'Acquaintance', 'Acquantance', 'Acquaintanse', 'Acquaintance', 'English', 1, '2023-05-24 15:28:27', '2023-05-24 15:28:27'),
(3, 'Which of the following is a coordinating conjunction?', 'And', 'However', ' Because', 'Therefore', 'And', 'English', 1, '2023-05-24 15:29:12', '2023-05-24 15:29:12'),
(4, 'Which of the following words is a synonym for \"enormous\"?', ' Tiny', ' Huge ', ' Average', 'Small', 'Huge', 'English', 1, '2023-05-24 15:30:25', '2023-05-24 15:30:25'),
(5, 'Identify the correct spelling of the word:', 'Accomodate', 'Acommodate', 'Accommodate', 'Acomodate', 'Accommodate', 'English', 1, '2023-05-24 15:31:00', '2023-05-24 15:31:00'),
(6, 'What is the SI unit of force?', 'Newton (N)', 'Joule (J)', 'Watt (W)', 'Pascal (Pa)', 'Newton (N)', 'Physics', 1, '2023-05-24 15:32:24', '2023-05-24 15:32:24'),
(7, 'Which of the following is an example of a vector quantity?', 'Temperature', ' Mass', 'Speed', ' Displacement', 'Displacement', 'Physics', 3, '2023-05-24 15:33:01', '2023-05-24 15:33:01'),
(8, 'Which of the following electromagnetic waves has the highest frequency?', 'Radio waves', 'Microwaves', 'Visible light', 'X-rays', 'X-rays', 'Physics', 1, '2023-05-24 15:33:46', '2023-05-24 15:33:46'),
(9, 'Which of the following best defines momentum?', 'The force applied to an object', ' The mass of an object', 'The speed of an object', 'The product of mass and velocity of an object', 'The product of mass and velocity of an object', 'Physics', 1, '2023-05-24 15:34:46', '2023-05-24 15:34:46'),
(10, 'What is the SI unit of electric current?', 'Ampere', 'Volt', 'Ohm', 'Joule', ' Ampere', 'Physics', 1, '2023-05-24 15:35:23', '2023-05-24 15:35:23'),
(11, 'Which of the following elements has the chemical symbol \"Na\"?', 'Nitrogen', 'Sodium ', 'Nickel', 'Neodymium', 'Sodium', 'Chemistry', 1, '2023-05-24 15:36:43', '2023-05-24 15:36:43'),
(12, 'What is the chemical formula for water?', 'HO', 'H2O', 'O2', 'CO2', 'H2O', 'Chemistry', 1, '2023-05-24 15:37:20', '2023-05-24 15:37:20'),
(13, 'Which of the following is a noble gas?', 'Hydrogen', 'Helium', 'Oxygen', ' Carbon', 'Helium', 'Chemistry', 1, '2023-05-24 15:37:51', '2023-05-24 15:37:51'),
(14, 'What is the atomic number of carbon?', '12', ' 6 ', ' 8', '14', '6', 'Chemistry', 1, '2023-05-24 15:38:22', '2023-05-24 15:38:22'),
(15, 'Which of the following is an example of a base?', 'Vinegar', ' Lemon juice', 'Baking soda ', 'Hydrochloric acid', 'Baking soda ', 'Chemistry', 1, '2023-05-24 15:39:02', '2023-05-24 15:39:02'),
(16, 'What is the square root of 49?', '6', '7', '8', '9', '7', 'Math', 3, '2023-05-24 15:39:55', '2023-05-24 15:39:55'),
(17, 'What is the value of π (pi) rounded to two decimal places?', '3.14', '3.16', '3.18', '3.20', '3.14', 'Math', 3, '2023-05-24 15:40:30', '2023-05-24 15:40:30'),
(18, 'What is the result of 5² - 3²?', '4', '8', '16', '22', '16', 'Math', 2, '2023-05-24 15:41:07', '2023-05-24 15:41:07'),
(19, 'Which of the following is the smallest prime number?', '1', '2', '3', '4', '2', 'Math', 3, '2023-05-24 15:41:34', '2023-05-24 15:41:34'),
(20, 'Solve the equation: 2x + 5 = 17.', 'x = 6', 'x = 7', 'x = 8', 'x = 9', 'x = 6', 'Math', 5, '2023-05-24 15:42:12', '2023-05-24 15:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `tsa_quiz_results`
--

CREATE TABLE `tsa_quiz_results` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `passed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tsa_quiz_results`
--

INSERT INTO `tsa_quiz_results` (`id`, `subject_id`, `subject_name`, `score`, `created_at`, `passed`) VALUES
(1, 4, 'Math', 80, '2023-05-24 15:43:37', 1),
(2, 2, 'Physics ', 60, '2023-05-25 06:17:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tutor_reviews`
--

CREATE TABLE `tutor_reviews` (
  `id` int(255) NOT NULL,
  `feedback_tutor_id` int(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `student_name` varchar(255) NOT NULL,
  `tutor_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor_reviews`
--

INSERT INTO `tutor_reviews` (`id`, `feedback_tutor_id`, `student_id`, `rating`, `comment`, `created_at`, `student_name`, `tutor_name`) VALUES
(1, 2, 3, 5, 'method of teaching id good', '2023-05-24 17:27:16', 'Abdullah', 'Muhammad Sameer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `ehistory` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `degree` longblob NOT NULL,
  `picture` longblob NOT NULL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `phone`, `email`, `user_type`, `password`, `verification_code`, `create_date`, `address`, `postal_code`, `area`, `country`, `state`, `ehistory`, `experience`, `degree`, `picture`, `hourly_rate`, `reset_token`) VALUES
(1, 'admin', 'admin', 0, 'admin@gmail.com', 'Admin', '$2y$10$UvjwTyi/mRRAO/D6hRUsa..na2fvXI4jEEKd.594xoKjieSvpVUyS', '3454d24c04f25f921cc09a89cd4fb47d', '2023-05-24 20:19:22', '', '', '', '', '', '', '', '', '', '0.00', NULL),
(2, 'Muhammad Sameer', 'sohail', 2147483647, 'sameersohail0009@gmail.com', 'Teacher', '$2y$10$tznB35g/GIF9bfpzloBnhu8656wCXl6sEaxC41xBVRMDu6//risei', '8b74831af4a533fc17a342833110b239', '2023-05-24 20:43:37', 'malik colony near high school no 1 phool nagar', '55260', 'Lahore', 'Pakistan', 'Punjab', 'nill', '2 year', 0x73616d656572284356292e706466, 0x73616d6d6d6d6d6d6d2e6a7067, '50.00', '347310'),
(3, 'Abdullah', 'Arshad', 2147483647, 'addullaharshadchoudhary@gmail.com', 'Student', '$2y$10$2jzwtLZNDlvcY2hg3Tjo3uHpoF1ThPGnSdxx.zsyVe0WLTwtCByEi', 'cec5f1f8351c1a628c566cd5020e20d3', '2023-05-24 21:20:01', 'kot peer fazal shah', '55260', 'Lahore', 'Pakistan', 'Punjab', '', '', '', 0x63682e6a7067, '0.00', NULL),
(4, 'Jawad', 'Ahmed', 3177631, 'jawad.ahmed.dillhow56@gmail.com', 'Teacher', '$2y$10$On.IBrZJsy7WRaNt9EIksOrZx.DU106FOSPPUi4yR77tK85PynjBO', 'b60f74fa0e7207423bbef31450d86484', '2023-05-25 11:17:03', '', '', '', '', '', '', '', '', '', '0.00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assesment`
--
ALTER TABLE `assesment`
  ADD PRIMARY KEY (`assesment_id`);

--
-- Indexes for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `enrolmentt`
--
ALTER TABLE `enrolmentt`
  ADD PRIMARY KEY (`enrolment_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsa_questions`
--
ALTER TABLE `tsa_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsa_quiz_results`
--
ALTER TABLE `tsa_quiz_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutor_reviews`
--
ALTER TABLE `tutor_reviews`
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
-- AUTO_INCREMENT for table `assesment`
--
ALTER TABLE `assesment`
  MODIFY `assesment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_content`
--
ALTER TABLE `course_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrolmentt`
--
ALTER TABLE `enrolmentt`
  MODIFY `enrolment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tsa_questions`
--
ALTER TABLE `tsa_questions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tsa_quiz_results`
--
ALTER TABLE `tsa_quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tutor_reviews`
--
ALTER TABLE `tutor_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
