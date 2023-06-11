-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 03:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
('Block Chain Nonce', 'assignment', '<p>kuch b</p>', '2023-05-12', 0x2e2e2f75706c6f6164732f636f6e74656e742f36343639303639376333663838302e36383132393133382e706466, 2, 1);

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
  `id` int(255) DEFAULT NULL,
  `course_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_name`, `course_id`, `course_intsructor`, `course_duration`, `course_price`, `course_description`, `id`, `course_image`) VALUES
('physics', 1, 'sameer', '2 months', 5000, 'onvufbd', NULL, 'courses-5.jpg'),
('physics', 2, 'asd', '2 months', 5000, 'ahoo', NULL, 'courses-80x80.jpg'),
('physics', 3, 'jawad', '2 months', 5000, 'asd', NULL, 'img3.jpg'),
('no', 4, 'jawad', 'no', 0, 'no', NULL, 'IMG_4954.jpg');

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
(1, 6, 1, '', '2023-05-19 20:12:40', 'ali', 'physics'),
(5, 6, 1, '', '2023-05-20 17:49:26', 'ali', 'physics'),
(6, 7, 1, '', '2023-05-20 17:53:36', 'jawad', 'physics'),
(7, 7, 1, '', '2023-05-21 13:42:04', 'jawad', 'physics'),
(8, 7, 2, '', '2023-05-21 13:45:40', 'jawad', 'physics');

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
(55, 'jawad', 'jawad516@gmail.com', 'daska', 'lahore', 'punjab', '10000', 'jawad', 'kK+XbhGMWwGfvylpVgMRMw==', 'se', '2019', '352', 'physics', 2, 5000, 'asd', 7, 3900, 1100);

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
(22);

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
(1, 'English', 0),
(2, 'Urdu', 80);

-- --------------------------------------------------------

--
-- Table structure for table `tsa_questions`
--

CREATE TABLE `tsa_questions` (
  `id` int(11) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `correct_answer` varchar(110) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `marks` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tsa_questions`
--

INSERT INTO `tsa_questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `subject`, `marks`, `created_at`, `updated_at`) VALUES
(1, 'What is sentence?', 'A group of words', 'A combination of words', 'none of these', 'all of above', 'none of these', 'English', 1, '2023-05-19 10:29:21', '2023-05-19 10:29:21'),
(2, 'What is word?', 'A group of words', 'A combination of words', 'none of these', 'all of above', 'all of above', 'English', 10, '2023-05-19 10:42:39', '2023-05-19 10:42:39'),
(3, 'what is speaking?', 'sound waves', 'A combination of words', 'none of these', 'all of above', 'none of these', 'English', 3, '2023-05-19 10:43:23', '2023-05-19 10:43:23'),
(4, 'kesy ho?', 'aisa hu', 'waisa hu', 'theek hu', 'nai hu', 'nai hu', 'Urdu', 1, '2023-05-19 11:35:02', '2023-05-19 11:35:02'),
(5, 'kya kr rhy ho', 'kuch ni', 'vaila', 'kaam', 'tum btao', 'kaam', 'Urdu', 1, '2023-05-19 11:35:45', '2023-05-19 11:35:45');

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
(1, 1, 'English', 100, '2023-05-19 10:31:14', 0),
(2, 1, 'English', 100, '2023-05-19 10:31:55', 0),
(3, 1, 'English', 100, '2023-05-19 10:33:03', 0),
(4, 1, 'English', 100, '2023-05-19 10:35:46', 0),
(5, 1, 'English', 0, '2023-05-19 10:36:10', 0),
(6, 1, 'English', 100, '2023-05-19 10:36:19', 0),
(7, 1, 'English', 100, '2023-05-19 10:38:16', 0),
(8, 1, 'English', 0, '2023-05-19 10:45:00', 0),
(9, 1, 'English', 0, '2023-05-19 10:45:20', 0),
(10, 1, 'English', 66.6667, '2023-05-19 10:46:11', 0),
(12, 1, 'English', 100, '2023-05-20 21:34:41', 1),
(13, 1, 'English', 100, '2023-05-20 21:40:57', 1),
(14, 1, 'English', 100, '2023-05-20 21:48:18', 1),
(15, 1, 'English', 100, '2023-05-20 21:49:12', 1),
(16, 1, 'English', 100, '2023-05-20 21:52:12', 1);

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
  `hourly_rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `phone`, `email`, `user_type`, `password`, `verification_code`, `create_date`, `address`, `postal_code`, `area`, `country`, `state`, `ehistory`, `experience`, `degree`, `picture`, `hourly_rate`) VALUES
(1, 'jawad', 'ahmed', 87654, 'jawad.ahmed.dhillow56@gmail.com', 'Admin', '$2y$10$qJGwWIMuf2oVBZC82tmCcuEAURIli/o3bNAKz76VQUhPeRmZ.Oeca', 'ccd6a8383d94bf394c5b53e12c5238a8', '2023-05-18 13:27:08', 'House 3', '51010', 'Daska', 'Pakistan', 'Punjab', '', '', '', 0x7465616d2d312e6a7067, 0.00),
(2, 'asd', 'asd', 1231243, 'asd@gmail.com', 'Teacher', '$2y$10$EOAC7zxuuKVQWOduohMlDOhYroyuuKKPBP9bf0D5t4WUEinaAKjxW', 'a80cb7d7a0125b70ab3399806964aa6f', '2023-05-18 13:56:09', '', '', '', '', '', '', '', '', '', 0.00),
(3, 'sameer', 'sohail', 3137550, 'sameersohail0009@gmail.com', 'Teacher', '$2y$10$5D8jGN6TzrsRT4GtC8LoCebmh.rf9AedSrlNz1FIVDkX6BIWU0t/6', 'd3e08a3cd89110a88e12727c1bed83ed', '2023-05-19 03:29:48', 'adasds', '10001', 'Phool Nagar', 'Pakistan', 'Punjab', 'nill', '2 y', 0x696d67332e6a7067, 0x7465616d2d342e6a7067, 50.00),
(4, 'umar', 'ali', 659856, 'umarali@gmail.com', 'Teacher', '$2y$10$4PcKB9C/VaBHYiqyAp4bWuuGzrpfwsZve1e5xLFYwkHT/tEvgayI2', '80e7baea88e7ceed366c22ea3f292a95', '2023-05-19 03:44:38', '', '', '', '', '', '', '', '', '', 0.00),
(5, 'usa', 'ma', 54858, 'usama@gmail.com', 'Teacher', '$2y$10$n1AWspcoCNG.aq7hTZdfOO4e6l9jHtVkj3DCO/XXEnwyuC/AU79uG', '260273098f5e0e6992cc24826ff8d89c', '2023-05-19 04:36:25', '', '', '', '', '', '', '', '', '', 0.00),
(6, 'ali', 'ishq', 5655555, 'ali@gmail.com', 'Student', '$2y$10$TGJ8kw8LyV.8cNsUDhqV4eKclKkN91nStWdMpMzaVdmi7BbhFBLFa', '87fc7f16f54761b664207b5f42f3012e', '2023-05-19 05:39:26', 'adasds', '10001', 'Daska', 'Pakistan', 'Punjab', '', '', '', 0x666561747572652e6a7067, 0.00),
(7, 'jawad', 'ahmed', 87654, 'jawad516@gmail.com', 'Student', '$2y$10$GHJl5.lXkBtk8Ozm7h1K3uRWn6fjNoREwddjI9z8geGcFpGpn/kSa', 'c28230f6c2d6dd4dddd33cc192166380', '2023-05-20 10:51:27', 'daska', '10000', 'lahore', 'pakistan', 'punjab', '', '', '', 0x494d475f343935342e6a7067, 0.00),
(12, 'jawad', 'ahmed', 87654, 'asda@gmail.com', 'Student', '$2y$10$6mMZ/kCP6JTIsaPL8EGeaujNHlVf6xGVwSBhBd7Kg/al4CAaA2TKm', '8da23a23e38263f33b4eb53e40011714', '2023-05-20 14:50:55', '', '', '', '', '', '', '', '', '', 0.00),
(13, 'jawad', 'ahmed', 87654, 'asdaa@gmail.com', 'Teacher', '$2y$10$gqnVau0bJ0x8XBye21JxZuuZstoucwx92JAlJHzYd7HdYffDg5YTy', '00be21d98ece12146f322561a3ca4a57', '2023-05-20 14:52:12', '', '', '', '', '', '', '', '', '', 0.00);

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
  MODIFY `assesment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_content`
--
ALTER TABLE `course_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `enrolmentt`
--
ALTER TABLE `enrolmentt`
  MODIFY `enrolment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tsa_questions`
--
ALTER TABLE `tsa_questions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tsa_quiz_results`
--
ALTER TABLE `tsa_quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tutor_reviews`
--
ALTER TABLE `tutor_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
