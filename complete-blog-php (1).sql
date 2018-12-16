-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Ne 16.Dec 2018, 17:55
-- Verzia serveru: 10.1.36-MariaDB
-- Verzia PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `complete-blog-php`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `image`, `body`, `published`, `created_at`, `updated_at`) VALUES
(12, 1, 'ddddd', 'ddddd', 0, 'sushobhan-badhai-372964-unsplash.jpg', '&lt;p&gt;dsdsdsds&lt;/p&gt;\r\n', 0, '2018-12-16 13:20:44', '2018-12-16 13:20:44'),
(13, 1, 'dsdsdsdsdsd', 'dsdsdsdsdsd', 0, 'sushobhan-badhai-372964-unsplash.jpg', '&lt;p&gt;dsdsdsdsd&lt;/p&gt;\r\n', 0, '2018-12-16 13:26:49', '2018-12-16 13:26:49'),
(14, 1, 'ahoj', 'ahoj', 0, 'sushobhan-badhai-372964-unsplash.jpg', '&lt;p&gt;dd&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 0, '2018-12-16 13:27:15', '2018-12-16 13:27:15'),
(17, 1, 'd', 'd', 0, 'sushobhan-badhai-372964-unsplash.jpg', '&lt;p&gt;d&lt;/p&gt;\r\n', 1, '2018-12-16 13:46:59', '2018-12-16 13:46:59');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(10, 12, 2),
(11, 13, 2),
(12, 14, 2),
(15, 17, 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(2, 'hmmm', 'hmmm'),
(3, 'hodina', 'hodina'),
(4, 'jjjj', 'jjjj');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Author','Admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'pilsner123', 'pilsner369@gmail.com', 'Admin', 'b00f9345fa45578581d5ad3066d8871c', '2018-11-26 20:36:32', '2018-11-26 20:36:32'),
(2, 'chrenka', 'pilsner@gmail.com', NULL, 'b00f9345fa45578581d5ad3066d8871c', '2018-11-27 07:52:00', '2018-11-27 07:52:00'),
(3, 'pilsner369', 'pilsner555@gmail.com', NULL, 'b00f9345fa45578581d5ad3066d8871c', '2018-11-28 16:59:49', '2018-11-28 16:59:49'),
(4, 'pilsner555', 'pilsner444@gmail.com', 'Author', 'b00f9345fa45578581d5ad3066d8871c', '2018-11-28 17:00:53', '2018-11-28 17:00:53'),
(5, 'stevo', 'sdsds@gmail.com', NULL, 'b00f9345fa45578581d5ad3066d8871c', '2018-12-09 12:53:32', '2018-12-09 12:53:32'),
(6, 'pilsner', 'petra.skola@centrum.sk', 'Admin', 'b00f9345fa45578581d5ad3066d8871c', '2018-12-16 13:37:55', '2018-12-16 13:37:55');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pre tabuľku `post_topic`
--
ALTER TABLE `post_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexy pre tabuľku `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pre tabuľku `post_topic`
--
ALTER TABLE `post_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pre tabuľku `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `post_topic`
--
ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
