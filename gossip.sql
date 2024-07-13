-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 04:14 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gossip`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `user_ref` text NOT NULL,
  `link` text NOT NULL,
  `title` text NOT NULL,
  `intro` text NOT NULL,
  `image` text NOT NULL,
  `date` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user`, `user_ref`, `link`, `title`, `intro`, `image`, `date`, `status`) VALUES
(1, 71, 'yL9IpAMvYjN', 'https://www.forbes.com/sites/alanohnsman/2024/02/20/how-rj-scaringe-is-driving-rivian-into-the-ev-mass-market/?sh=849e37741bd9', 'How RJ Scaringe Is Driving Rivian Straight At Elon Musk', 'With sales of costlier electric cars cooling, Rivian CEO RJ Scaringe is going to woo consumers with a smaller SUV and a smaller $45,000 price tag.', 'BlZqoKunyNDYShddSXvhRUuHuhmvmZpP.jpg', '1708497855', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `attachements`
--

CREATE TABLE `attachements` (
  `id` int(11) NOT NULL,
  `filename` text NOT NULL,
  `thumbnail` text NOT NULL,
  `post` int(11) NOT NULL,
  `date` text NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attachements`
--

INSERT INTO `attachements` (`id`, `filename`, `thumbnail`, `post`, `date`, `user`) VALUES
(1, 'pexels-photo-1006999.jpeg', 'pexels-photo-1006999.jpeg', 1, '1702811060', 45),
(2, 'pexels-photo-1050228.jpeg', 'pexels-photo-1050228.jpeg', 2, '1703491645', 19),
(3, 'pexels-photo-1080116.jpeg', 'pexels-photo-1080116.jpeg', 3, '1703132187', 67),
(4, 'pexels-photo-1092198.jpeg', 'pexels-photo-1092198.jpeg', 4, '1702737501', 39),
(5, 'pexels-photo-1144837.webp', 'pexels-photo-1144837.webp', 5, '1702979474', 65),
(6, 'pexels-photo-1146505.webp', 'pexels-photo-1146505.webp', 6, '1703636751', 34),
(7, 'pexels-photo-1191486.jpeg', 'pexels-photo-1191486.jpeg', 7, '1702974616', 53),
(8, 'pexels-photo-13187270.jpeg', 'pexels-photo-13187270.jpeg', 8, '1703409869', 48),
(9, 'pexels-photo-13191462.jpeg', 'pexels-photo-13191462.jpeg', 9, '1703023263', 39),
(10, 'pexels-photo-13530004.webp', 'pexels-photo-13530004.webp', 10, '1702616083', 21),
(11, 'pexels-photo-14041408.jpeg', 'pexels-photo-14041408.jpeg', 11, '1703023572', 62),
(12, 'pexels-photo-1436985.jpeg', 'pexels-photo-1436985.jpeg', 12, '1702643184', 42),
(13, 'pexels-photo-1442661.jpeg', 'pexels-photo-1442661.jpeg', 13, '1703497208', 38),
(14, 'pexels-photo-1467162.jpeg', 'pexels-photo-1467162.jpeg', 14, '1703159857', 37),
(15, 'pexels-photo-1467163.jpeg', 'pexels-photo-1467163.jpeg', 15, '1703043064', 53),
(16, 'pexels-photo-1498362.webp', 'pexels-photo-1498362.webp', 16, '1702550752', 30),
(17, 'pexels-photo-1605177.jpeg', 'pexels-photo-1605177.jpeg', 17, '1702570977', 48),
(18, 'pexels-photo-1690558.jpeg', 'pexels-photo-1690558.jpeg', 18, '1703589191', 18),
(19, 'pexels-photo-1727015.jpeg', 'pexels-photo-1727015.jpeg', 19, '1703424741', 35),
(20, 'pexels-photo-1826018.webp', 'pexels-photo-1826018.webp', 20, '1703078778', 30),
(21, 'pexels-photo-1856895.jpeg', 'pexels-photo-1856895.jpeg', 21, '1703449950', 62),
(22, 'pexels-photo-1856896.jpeg', 'pexels-photo-1856896.jpeg', 22, '1703268675', 3),
(23, 'pexels-photo-1884979.jpeg', 'pexels-photo-1884979.jpeg', 23, '1703177418', 60),
(24, 'pexels-photo-1936114.webp', 'pexels-photo-1936114.webp', 24, '1703099769', 51),
(25, 'pexels-photo-1937433.jpeg', 'pexels-photo-1937433.jpeg', 25, '1703645219', 19),
(26, 'pexels-photo-1970935.jpeg', 'pexels-photo-1970935.jpeg', 26, '1702710181', 50),
(27, 'pexels-photo-2004864.jpeg', 'pexels-photo-2004864.jpeg', 27, '1703017273', 61),
(28, 'pexels-photo-2081371.webp', 'pexels-photo-2081371.webp', 28, '1703484777', 23),
(29, 'pexels-photo-2115473.webp', 'pexels-photo-2115473.webp', 29, '1703305246', 16),
(30, 'pexels-photo-2180884.webp', 'pexels-photo-2180884.webp', 30, '1703239103', 1),
(31, 'pexels-photo-2249926.jpeg', 'pexels-photo-2249926.jpeg', 31, '1703332969', 67),
(32, 'pexels-photo-2269875.jpeg', 'pexels-photo-2269875.jpeg', 32, '1703010818', 17),
(33, 'pexels-photo-2269878.jpeg', 'pexels-photo-2269878.jpeg', 33, '1703592560', 40),
(34, 'pexels-photo-2269890.webp', 'pexels-photo-2269890.webp', 34, '1703538615', 44),
(35, 'pexels-photo-2279392.jpeg', 'pexels-photo-2279392.jpeg', 35, '1703047918', 29),
(36, 'pexels-photo-2479154.jpeg', 'pexels-photo-2479154.jpeg', 36, '1703611889', 41),
(37, 'pexels-photo-2569238.webp', 'pexels-photo-2569238.webp', 37, '1703468437', 3),
(38, 'pexels-photo-2747371.jpeg', 'pexels-photo-2747371.jpeg', 38, '1703121604', 40),
(39, 'pexels-photo-2748239.jpeg', 'pexels-photo-2748239.jpeg', 39, '1703264192', 22),
(40, 'pexels-photo-2791558.webp', 'pexels-photo-2791558.webp', 40, '1703105517', 46),
(41, 'pexels-photo-2791858.webp', 'pexels-photo-2791858.webp', 41, '1703024079', 38),
(42, 'pexels-photo-2808758.webp', 'pexels-photo-2808758.webp', 42, '1703131488', 15),
(43, 'pexels-photo-2820593.jpeg', 'pexels-photo-2820593.jpeg', 43, '1703289640', 43),
(44, 'pexels-photo-2904218.webp', 'pexels-photo-2904218.webp', 44, '1702668422', 44),
(45, 'pexels-photo-3081689.webp', 'pexels-photo-3081689.webp', 45, '1703255380', 11),
(46, 'pexels-photo-3321540.webp', 'pexels-photo-3321540.webp', 46, '1703432729', 7),
(47, 'pexels-photo-3409421.jpeg', 'pexels-photo-3409421.jpeg', 47, '1703240408', 23),
(48, 'pexels-photo-3542967.jpeg', 'pexels-photo-3542967.jpeg', 48, '1702690631', 66),
(49, 'pexels-photo-3587317.webp', 'pexels-photo-3587317.webp', 49, '1703437690', 10),
(50, 'pexels-photo-3893537.webp', 'pexels-photo-3893537.webp', 50, '1702523186', 6),
(51, 'pexels-photo-4065859.webp', 'pexels-photo-4065859.webp', 51, '1703452465', 58),
(52, 'pexels-photo-4099878.jpeg', 'pexels-photo-4099878.jpeg', 52, '1703526357', 39),
(53, 'pexels-photo-7624556.jpeg', 'pexels-photo-7624556.jpeg', 53, '1702840562', 8),
(54, 'pexels-photo-7761082.webp', 'pexels-photo-7761082.webp', 54, '1702560881', 46),
(55, 'pexels-photo-828604.jpeg', 'pexels-photo-828604.jpeg', 55, '1703606444', 35),
(56, 'pexels-photo-8578934.jpeg', 'pexels-photo-8578934.jpeg', 56, '1703670709', 48),
(57, 'pexels-photo-871495.jpeg', 'pexels-photo-871495.jpeg', 57, '1702893830', 25),
(58, 'pexels-photo-908935.jpeg', 'pexels-photo-908935.jpeg', 58, '1702674482', 65),
(59, 'pexels-photo-934699.jpeg', 'pexels-photo-934699.jpeg', 59, '1702721371', 9),
(60, 'pexels-photo-936001.webp', 'pexels-photo-936001.webp', 60, '1702754308', 24),
(61, 'pexels-photo-936031.jpeg', 'pexels-photo-936031.jpeg', 61, '1702802239', 44),
(62, 'pexels-photo-936035.jpeg', 'pexels-photo-936035.jpeg', 62, '1702966897', 45),
(63, 'pexels-photo-936060.webp', 'pexels-photo-936060.webp', 63, '1702853028', 48),
(64, 'pexels-photo-936140.jpeg', 'pexels-photo-936140.jpeg', 64, '1702978866', 24),
(65, 'pexels-photo-996635.webp', 'pexels-photo-996635.webp', 65, '1702859652', 61),
(66, 'pexels-photo-998851.jpeg', 'pexels-photo-998851.jpeg', 66, '1703173546', 55),
(67, 'IMG-20231229-WA0008.jpg', 'IMG-20231229-WA0008.jpg', 201, '1703922574', 69),
(68, '1703865029387.jpg', '1703865029387.jpg', 201, '1703922575', 69),
(69, 'IMG-20231228-WA0001.jpg', 'IMG-20231228-WA0001.jpg', 201, '1703922575', 69),
(70, 'Screenshot_20231228-192637.jpg', 'Screenshot_20231228-192637.jpg', 201, '1703922576', 69),
(71, 'IMG-20240220-WA0006.jpg', 'IMG-20240220-WA0006.jpg', 202, '1708457093', 0),
(72, 'IMG-20240220-WA0003.jpg', 'IMG-20240220-WA0003.jpg', 202, '1708457093', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE `blocked` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `type` text NOT NULL,
  `time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `story` int(11) NOT NULL,
  `content` text NOT NULL,
  `parent` int(11) NOT NULL,
  `time` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user`, `story`, `content`, `parent`, `time`, `status`) VALUES
(1, 1, 1, 'Hello world', 0, '1703745972', 'sent'),
(2, 1, 1, 'Hello world', 0, '1703745972', 'sent'),
(3, 1, 1, 'Reply comment', 1, '1703746318', 'sent'),
(4, 1, 1, 'I am send a reply', 0, '1703759208', 'sent'),
(5, 69, 2, 'A second comment 😀', 0, '1703759296', 'sent'),
(6, 69, 1, 'Pretty new 🆕', 0, '1703759819', 'sent'),
(7, 1, 1, 'this is a reply\ncoz it\'s new line', 4, '1703794254', 'sent'),
(8, 69, 1, 'how about another comment ', 0, '1703794451', 'sent'),
(9, 69, 1, 'and another', 0, '1703794462', 'sent'),
(10, 69, 1, 'another', 0, '1703931270', 'sent'),
(11, 69, 1, 'another again ', 0, '1703931279', 'sent'),
(12, 69, 11, 'this is not nice', 0, '1708458879', 'sent'),
(13, 69, 21, 'now this is nice ', 0, '1708459108', 'sent'),
(14, 1, 21, 'check now guys', 13, '1708459133', 'sent'),
(15, 69, 31, 'mukuti bwanj apa', 0, '1708459437', 'sent'),
(16, 1, 31, 'fukwa nde ndadab2a', 15, '1708459455', 'sent');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user`, `post`, `type`, `date`) VALUES
(2, 69, 1, 'post', '1703788771'),
(5, 69, 6, 'comment', '1703792915'),
(6, 69, 4, 'comment', '1703792916'),
(7, 69, 2, 'comment', '1703792917'),
(8, 69, 1, 'comment', '1703792923'),
(9, 0, 11, 'comment', '1708457177'),
(10, 69, 21, 'post', '1708458207'),
(11, 69, 15, 'comment', '1708459474');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `type` text NOT NULL,
  `ref` text NOT NULL,
  `date` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `story_cache`
--

CREATE TABLE `story_cache` (
  `id` int(11) NOT NULL,
  `story` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `user`, `text`, `date`, `status`) VALUES
(1, 45, 'Equality fosters a fair and just society. Technology has revolutionized the way we live. The internet connects people globally. History shapes our present and future.', '1702811060', 'active'),
(2, 19, 'Science helps us understand the world around us. Purpose gives meaning to life. Music transcends language barriers. History shapes our present and future.', '1703491645', 'active'),
(3, 67, 'Food nourishes not just the body, but also the soul. The power of collaboration drives innovation. Purpose gives direction in life. Empowerment encourages self-belief.', '1703132187', 'active'),
(4, 39, 'Purpose gives direction in life.', '1702737501', 'active'),
(5, 65, 'Individual actions create significant impacts. Purpose gives meaning to life. Technology enables global connectivity.', '1702979474', 'active'),
(6, 34, 'Community support is invaluable. Respect for diversity creates stronger communities. Hope is a potent motivator. Embracing change leads to personal development.', '1703636751', 'active'),
(7, 53, 'Food nourishes not just the body, but also the soul. Personal growth necessitates leaving comfort zones.', '1702974616', 'active'),
(8, 48, 'Understanding others promotes harmony. Books open doors to different worlds. Hope is a powerful motivator. Mental health is as important as physical health.', '1703409869', 'active'),
(9, 39, 'The power of collaboration drives innovation. Books open doors to different worlds. Perseverance leads to achievement.', '1703023263', 'active'),
(10, 21, 'Adventures fuel the soul. Support systems are crucial during tough times.', '1702616083', 'active'),
(11, 62, 'Adaptability is essential in a changing world. Adaptability is crucial in a changing world. Gratitude cultivates a positive mindset. Curiosity drives exploration and discovery.', '1703023572', 'active'),
(12, 42, 'Optimism can be contagious.', '1702643184', 'active'),
(13, 38, 'Generosity spreads positivity. Empathy fosters a more compassionate society.', '1703497208', 'active'),
(14, 37, 'Music has the power to evoke emotions. Happiness is subjective and can be found in simple moments. Failure is a part of the learning process. The pursuit of knowledge is a lifelong journey.', '1703159857', 'active'),
(15, 53, 'Leadership involves both responsibility and empathy.', '1703043064', 'active'),
(16, 30, 'Small acts of kindness can make a big difference. Self-acceptance leads to inner peace. Gratitude transforms perspectives. Nature has a calming effect on the mind.', '1702550752', 'active'),
(17, 48, 'Understanding promotes harmony. Change is inevitable and constant. Faith provides strength and comfort. Empowerment fosters self-belief.', '1702570977', 'active'),
(18, 18, 'Technology enables global connectivity.', '1703589191', 'active'),
(19, 35, 'Perseverance leads to achievement.', '1703424741', 'active'),
(20, 30, 'Teamwork amplifies individual strengths.', '1703078778', 'active'),
(21, 62, 'Humility allows for personal growth. The internet connects people globally. Success means different things to different people.', '1703449950', 'active'),
(22, 3, 'Small acts of kindness can make a big difference.', '1703268675', 'active'),
(23, 60, 'The arts enable diverse expressions.', '1703177418', 'active'),
(24, 51, 'Water is essential for life.', '1703099769', 'active'),
(25, 19, 'Small acts of kindness can make a big difference. Mistakes teach valuable lessons.', '1703645219', 'active'),
(26, 50, 'Hope is a powerful motivator.', '1702710181', 'active'),
(27, 61, 'Embracing change leads to personal evolution. Nature has a calming effect on the mind. Self-discipline leads to goal achievement.', '1703017273', 'active'),
(28, 23, 'Kindness makes the world a better place.', '1703484777', 'active'),
(29, 16, 'Adventures rejuvenate the spirit. Respect forms the bedrock of healthy relationships. Imagination fuels innovation. Nature has a calming effect on the mind.', '1703305246', 'active'),
(30, 1, 'Respect for diversity creates stronger communities.', '1703239103', 'active'),
(31, 67, 'Problem-solving skills are invaluable. Dreams have the power to inspire action. Education is a lifelong pursuit. Open-mindedness fosters growth.', '1703332969', 'active'),
(32, 17, 'Forgiveness can be liberating. Learning from mistakes signifies growth. Mental health is as important as physical health. Purpose gives direction in life.', '1703010818', 'active'),
(33, 40, 'Innovation drives progress.', '1703592560', 'active'),
(34, 44, 'Perseverance leads to achievement. Self-discipline leads to goal achievement.', '1703538615', 'active'),
(35, 29, 'Passion fuels dedication. The arts enable diverse expressions.', '1703047918', 'active'),
(36, 41, 'Responsibility comes with privilege.', '1703611889', 'active'),
(37, 3, 'Kindness makes the world a better place. Collaboration sparks innovation. The power of collaboration drives innovation. Inclusivity creates stronger communities.', '1703468437', 'active'),
(38, 40, 'Diversity enriches communities. Kindness can create a ripple effect. Embracing change leads to personal development. Science helps us understand the world around us.', '1703121604', 'active'),
(39, 22, 'Mistakes teach valuable lessons. Generosity spreads positivity. Diversity enriches communities.', '1703264192', 'active'),
(40, 46, 'Honesty builds strong relationships. Science helps us understand the world around us.', '1703105517', 'active'),
(41, 38, 'Water is essential for life. Understanding promotes harmony. Gratitude transforms perspectives. Gratitude transforms perspectives.', '1703024079', 'active'),
(42, 15, 'Teamwork amplifies individual strengths. Diversity enriches communities.', '1703131488', 'active'),
(43, 43, 'Mental health is as important as physical health. Adaptability is essential in a changing world. Innovation drives progress.', '1703289640', 'active'),
(44, 44, 'The pursuit of excellence drives progress.', '1702668422', 'active'),
(45, 11, 'Friendship brings joy and support. Responsibility accompanies privilege. Courage is facing fear despite uncertainty. Generosity spreads positivity.', '1703255380', 'active'),
(46, 7, 'Kindness creates ripples of positivity.', '1703432729', 'active'),
(47, 23, 'Self-discipline leads to goal achievement. Community support is invaluable.', '1703240408', 'active'),
(48, 66, 'Nature has a calming effect on the mind.', '1702690631', 'active'),
(49, 10, 'Happiness is subjective and can be found in simple moments.', '1703437690', 'active'),
(50, 6, 'Health is wealth. Empowerment leads to greater achievements. Diversity enriches communities. The pursuit of knowledge is a lifelong journey.', '1702523186', 'active'),
(51, 58, 'Collaboration sparks innovation. Love is a complex and beautiful emotion.', '1703452465', 'active'),
(52, 39, 'Honesty fosters strong relationships. Mental health is as crucial as physical health. Embracing change leads to personal evolution.', '1703526357', 'active'),
(53, 8, 'Technology facilitates global connectivity.', '1702840562', 'active'),
(54, 46, 'Adventures fuel the soul. Self-care is essential for well-being. Adaptability is essential in a changing world.', '1702560881', 'active'),
(55, 35, 'Resilience helps overcome adversity. Creativity is boundless. Respect for diversity creates stronger communities.', '1703606444', 'active'),
(56, 48, 'Patience is a virtue worth cultivating.', '1703670709', 'active'),
(57, 25, 'Mistakes teach valuable lessons. Inclusivity creates stronger communities.', '1702893830', 'active'),
(58, 65, 'Purpose gives meaning to life. Collaboration sparks innovation.', '1702674482', 'active'),
(59, 9, 'A positive mindset conquers obstacles. Self-reflection leads to personal growth. Self-reflection facilitates personal growth.', '1702721371', 'active'),
(60, 24, 'Compassion makes the world a better place. Mental health is as crucial as physical health.', '1702754308', 'active'),
(61, 44, 'Honesty builds strong relationships.', '1702802239', 'active'),
(62, 45, 'Empowerment leads to greater achievements.', '1702966897', 'active'),
(63, 48, 'Open-mindedness encourages growth. Joy can be found in simple joys. Exploration leads to new discoveries. Mistakes teach valuable lessons.', '1702853028', 'active'),
(64, 24, 'Nature holds immense beauty and power.', '1702978866', 'active'),
(65, 61, 'Perseverance leads to achievement.', '1702859652', 'active'),
(66, 55, 'Generosity spreads positivity. Food nourishes not just the body, but also the soul.', '1703173546', 'active'),
(67, 19, 'Purpose gives direction in life. Respect for diversity creates stronger communities.', '1703633632', 'active'),
(68, 63, 'Honesty builds strong relationships. Embracing change leads to personal evolution.', '1702590639', 'active'),
(69, 28, 'Self-care is essential for well-being.', '1702962995', 'active'),
(70, 22, 'Honesty builds strong relationships. Music has the power to evoke emotions. Gratitude cultivates a positive mindset. Collaboration sparks innovation.', '1703088272', 'active'),
(71, 24, 'Trees provide oxygen for us to breathe.', '1702687745', 'active'),
(72, 2, 'Communication is key to building relationships. Teamwork amplifies individual strengths.', '1703155646', 'active'),
(73, 21, 'Adventures fuel the soul.', '1703248840', 'active'),
(74, 40, 'Humility allows for personal growth. Self-awareness fuels personal development. Cultural exchange fosters understanding.', '1702733594', 'active'),
(75, 24, 'Gratitude transforms perspective. Small acts of kindness can make a big difference.', '1702806254', 'active'),
(76, 45, 'Integrity is the foundation of trust. Adventures fuel the soul. Education is a lifelong pursuit.', '1702733815', 'active'),
(77, 55, 'Self-discipline leads to goal achievement.', '1703409247', 'active'),
(78, 18, 'Dreams inspire us to aim higher. The arts enable diverse expressions.', '1702957329', 'active'),
(79, 46, 'Listening is a fundamental aspect of communication.', '1702894389', 'active'),
(80, 21, 'Collaboration powers innovation. Purpose gives meaning to life. Failure is a part of the learning process.', '1703496096', 'active'),
(81, 9, 'Innovation propels progress. Change is inevitable and constant. Inclusivity creates stronger communities. Open-mindedness fosters growth.', '1702966493', 'active'),
(82, 4, 'Mindfulness enhances the quality of life. Traveling broadens our perspectives.', '1703245452', 'active'),
(83, 28, 'Success means different things to different people. Adventure awaits those who seek it.', '1702613967', 'active'),
(84, 37, 'Kindness creates ripples of positivity. Teamwork amplifies individual strengths. Nature holds immense beauty and power.', '1703092231', 'active'),
(85, 16, 'Happiness is subjective and can be found in simple moments. Beauty is found in diversity. Cultural exchange fosters understanding.', '1702560595', 'active'),
(86, 19, 'Tolerance creates space for diverse viewpoints.', '1703232785', 'active'),
(87, 47, 'Respect for diversity creates stronger communities. Problem-solving skills are invaluable. Personal growth necessitates leaving comfort zones. Support systems are crucial during tough times.', '1702775467', 'active'),
(88, 32, 'Adversity fosters resilience. Self-acceptance leads to inner peace. Happiness is subjective and can be found in simple moments.', '1703136957', 'active'),
(89, 60, 'Community support is invaluable.', '1702730888', 'active'),
(90, 28, 'Adventure awaits those who seek it. Health is wealth.', '1703378811', 'active'),
(91, 8, 'Compassionate listening can heal. Optimism has a contagious effect.', '1702539818', 'active'),
(92, 6, 'Kindness has a ripple effect. Beauty is found in diversity.', '1703193533', 'active'),
(93, 12, 'Innovation drives progress.', '1703692472', 'active'),
(94, 27, 'Dreams inspire us to aim higher.', '1702802675', 'active'),
(95, 27, 'Empowerment encourages self-belief. Respect for diversity creates stronger communities. Adventure awaits those who seek it.', '1702605283', 'active'),
(96, 1, 'Self-reflection facilitates personal growth. Challenges often lead to personal growth. Friendship brings joy and support. Empathy fosters understanding.', '1702545301', 'active'),
(97, 32, 'Technology enables global connectivity. Respect forms the bedrock of healthy relationships. Music transcends language barriers.', '1702522409', 'active'),
(98, 57, 'Empathy fosters understanding.', '1703519173', 'active'),
(99, 64, 'Beauty is found in diversity. Adversity fosters resilience. Food nourishes not just the body, but also the soul.', '1703547635', 'active'),
(100, 31, 'Self-discipline is key to achieving goals. Problem-solving skills are invaluable. Optimism can be contagious.', '1702785846', 'active'),
(101, 23, 'Self-care is essential for overall well-being. Kindness has a ripple effect. Kindness has a ripple effect.', '1703448695', 'active'),
(102, 35, 'The journey of learning is continuous.', '1703098920', 'active'),
(103, 66, 'Adventure awaits those who seek it.', '1702879320', 'active'),
(104, 12, 'Adventure awaits those who seek it. Wisdom comes from experience.', '1703193652', 'active'),
(105, 8, 'Learning from mistakes leads to growth. The power of collaboration drives innovation. Adversity fosters resilience.', '1703216949', 'active'),
(106, 17, 'Honesty builds strong relationships.', '1703633547', 'active'),
(107, 3, 'Unity can bring about positive change. Gratitude transforms perspective. Diversity enriches communities. The internet connects people globally.', '1702922495', 'active'),
(108, 27, 'Self-discipline is key to achieving goals. Wisdom comes from experience. Dreams have the power to inspire action.', '1703513958', 'active'),
(109, 49, 'Love is a complex and beautiful emotion.', '1703187015', 'active'),
(110, 22, 'Science helps us understand the world around us. Self-acceptance leads to inner peace.', '1703579821', 'active'),
(111, 61, 'Kindness makes the world a better place. Personal growth necessitates leaving comfort zones. A positive mindset conquers obstacles. Leadership involves both responsibility and empathy.', '1702760098', 'active'),
(112, 7, 'Empathy fosters a more compassionate society. Optimism has a contagious effect. A positive mindset can overcome obstacles. Books open doors to different worlds.', '1703398423', 'active'),
(113, 43, 'Gratitude cultivates a positive mindset. Technology enables global connectivity. Self-care is essential for overall well-being. Happiness is subjective and can be found in simple moments.', '1702778338', 'active'),
(114, 30, 'The universe is vast and mysterious. The sky is blue. Adventures rejuvenate the spirit.', '1702807655', 'active'),
(115, 34, 'Adversity often leads to resilience. Adaptability is crucial in a changing world. Self-care is essential for well-being.', '1703234370', 'active'),
(116, 7, 'The pursuit of knowledge is a lifelong journey.', '1703143049', 'active'),
(117, 65, 'Tolerance creates space for diverse viewpoints. Collaboration powers innovation.', '1703029578', 'active'),
(118, 43, 'Communication is key to building relationships. The pursuit of excellence propels progress. Adaptability is essential in a changing world.', '1703406714', 'active'),
(119, 8, 'Learning from mistakes signifies growth. Optimism has a contagious effect. Nature has a calming effect on the mind.', '1703632393', 'active'),
(120, 67, 'The human mind is incredibly complex.', '1702718919', 'active'),
(121, 31, 'Collaboration sparks innovation. Purpose gives meaning to life.', '1703696781', 'active'),
(122, 11, 'Joy can be found in simple pleasures.', '1703378456', 'active'),
(123, 6, 'Gratitude transforms perspectives. The journey of learning is continuous. Personal growth requires stepping out of comfort zones. Self-awareness fuels personal development.', '1702910320', 'active'),
(124, 38, 'Imagination fuels innovation. Change is inevitable and constant. Kindness can create a ripple effect.', '1702606578', 'active'),
(125, 65, 'Friendship brings joy and support. Perseverance leads to achievement. Resilience helps overcome challenges. Technology enables global connectivity.', '1702846365', 'active'),
(126, 30, 'Respect forms the bedrock of healthy relationships. Individual actions create significant impacts. The universe is vast and mysterious.', '1702758499', 'active'),
(127, 58, 'Communication is key to building relationships.', '1703360332', 'active'),
(128, 1, 'Nature has a calming effect on the mind. Animals deserve our care and respect.', '1703417038', 'active'),
(129, 43, 'Family provides a sense of belonging. Listening is fundamental to communication.', '1703505885', 'active'),
(130, 52, 'Cultural exchange fosters mutual understanding. Adventures rejuvenate the spirit.', '1703635888', 'active'),
(131, 62, 'Optimism has a contagious effect. Teamwork amplifies individual strengths. Listening is a fundamental aspect of communication.', '1703575560', 'active'),
(132, 66, 'Small acts of kindness yield significant impact. Laughter is good for the soul. Kindness can create a ripple effect.', '1702520296', 'active'),
(133, 24, 'Self-care is essential for well-being. Dreams have the power to inspire action. A positive mindset can overcome obstacles. Listening is fundamental to communication.', '1703327755', 'active'),
(134, 24, 'The pursuit of knowledge enriches life.', '1703378902', 'active'),
(135, 5, 'Education is a lifelong pursuit. Communication is vital for understanding.', '1702884433', 'active'),
(136, 25, 'Adventures rejuvenate the spirit.', '1702818888', 'active'),
(137, 24, 'Learning from mistakes signifies growth. Self-reflection leads to personal growth. Purpose gives direction in life. Learning from mistakes is a sign of growth.', '1703206869', 'active'),
(138, 44, 'Hope is a potent motivator. Self-acceptance leads to inner peace. Adversity fosters resilience. The power of collaboration drives innovation.', '1702509050', 'active'),
(139, 13, 'Empathy fosters connections between people.', '1703408697', 'active'),
(140, 1, 'Self-care is essential for well-being. Friendship brings joy and support.', '1702900304', 'active'),
(141, 37, 'Collaboration sparks innovation. The arts enable diverse expressions. Generosity spreads positivity.', '1703183975', 'active'),
(142, 1, 'Empowerment leads to greater achievements. Creativity knows no bounds. The arts enable diverse expressions. Embracing change leads to personal development.', '1703144191', 'active'),
(143, 67, 'Kindness creates ripples of positivity. Perseverance leads to achievement.', '1703185324', 'active'),
(144, 11, 'Silence can be as powerful as words. Resilience helps overcome challenges. Respect forms the bedrock of healthy relationships.', '1703301922', 'active'),
(145, 35, 'Respect is the foundation of healthy relationships.', '1702980980', 'active'),
(146, 65, 'Inclusivity builds stronger communities. Empathy fosters a more compassionate society. Optimism can be contagious.', '1702609165', 'active'),
(147, 28, 'Personal growth requires stepping out of comfort zones.', '1703122922', 'active'),
(148, 23, 'Exploration leads to new discoveries. The pursuit of knowledge enriches life.', '1703080863', 'active'),
(149, 65, 'Empathy fosters a more compassionate society. Mental health is as important as physical health. The sky is blue. The pursuit of knowledge is a lifelong journey.', '1703123503', 'active'),
(150, 3, 'Adventures rejuvenate the spirit. Music transcends language barriers. Love is a complex and beautiful emotion. Self-discipline is key to achieving goals.', '1703302077', 'active'),
(151, 56, 'Collaboration powers innovation. Equality fosters a fair and just society.', '1702759572', 'active'),
(152, 31, 'Success means different things to different people. Courage is facing fear despite uncertainty. Problem-solving skills are invaluable. Music transcends language barriers.', '1703154163', 'active'),
(153, 53, 'Technology enables global connectivity. The universe is vast and mysterious.', '1702642938', 'active'),
(154, 20, 'Science helps us understand the world around us. Community support is invaluable. Respect forms the bedrock of healthy relationships.', '1702614338', 'active'),
(155, 24, 'Self-discipline is key to achieving goals. The pursuit of knowledge enriches life. Gratitude transforms perspective.', '1702616036', 'active'),
(156, 42, 'Cultural exchange fosters understanding. Collaboration powers innovation.', '1703068590', 'active'),
(157, 36, 'Technology facilitates global connectivity. Beauty is found in diversity.', '1702779426', 'active'),
(158, 48, 'Adventures fuel the soul.', '1703179961', 'active'),
(159, 27, 'Friendship brings joy and support. The pursuit of excellence drives progress. Inclusivity builds stronger communities.', '1703075906', 'active'),
(160, 38, 'Innovation drives progress. Learning from mistakes leads to growth. Nature holds immense beauty and power.', '1703191788', 'active'),
(161, 43, 'Self-acceptance leads to inner peace.', '1702600600', 'active'),
(162, 36, 'Problem-solving skills are invaluable.', '1703136668', 'active'),
(163, 43, 'Problem-solving skills are invaluable. Hope is a potent motivator. Self-care is essential for well-being. Music has the power to evoke emotions.', '1702789327', 'active'),
(164, 53, 'Success means different things to different people. The pursuit of knowledge is a lifelong journey. Science helps us understand the world around us. Respect is the foundation of healthy relationships.', '1702951998', 'active'),
(165, 15, 'Integrity is the foundation of trust. Learning is a continuous process. Humor can lighten even the darkest of moments.', '1702623113', 'active'),
(166, 38, 'Nature has a calming effect on the mind. Education is a lifelong pursuit. Gratitude transforms perspective. The arts provide avenues for expression.', '1702873468', 'active'),
(167, 61, 'Trees provide oxygen for us to breathe.', '1702861060', 'active'),
(168, 41, 'Listening is a fundamental aspect of communication. Technology facilitates global connectivity. Success means different things to different people. Embracing change leads to personal evolution.', '1703534436', 'active'),
(169, 20, 'Small acts of kindness yield significant impact. Adventures rejuvenate the spirit. Unity can bring about positive change.', '1703403338', 'active'),
(170, 64, 'Optimism has a contagious effect. The natural world deserves our protection. The sky is blue. Leadership involves both responsibility and empathy.', '1702876719', 'active'),
(171, 26, 'Collaboration sparks innovation. Beauty is found in diversity.', '1702839806', 'active'),
(172, 35, 'Challenges often lead to personal growth.', '1702803308', 'active'),
(173, 43, 'Adventures fuel the soul. Compassionate listening can heal.', '1703146320', 'active'),
(174, 65, 'Self-discipline leads to goal achievement. Learning from mistakes signifies growth. Self-reflection facilitates personal growth.', '1703399145', 'active'),
(175, 13, 'Problem-solving skills are invaluable. Family provides a sense of belonging.', '1702607395', 'active'),
(176, 24, 'Technology facilitates global connectivity. Learning from mistakes signifies growth. Science helps us understand the world around us. Self-discipline leads to goal achievement.', '1703097864', 'active'),
(177, 3, 'Empathy fosters connections between people. Honesty builds strong relationships. Generosity spreads positivity. Gratitude cultivates a positive mindset.', '1702518667', 'active'),
(178, 33, 'Integrity is the foundation of trust. Optimism has a contagious effect. Tolerance creates space for diverse viewpoints. Small acts of kindness can make a big difference.', '1703378196', 'active'),
(179, 41, 'The pursuit of knowledge enriches life.', '1702723336', 'active'),
(180, 28, 'Problem-solving skills are invaluable. Tolerance creates space for diverse viewpoints.', '1703611626', 'active'),
(181, 5, 'The sky is blue. Tolerance creates space for diverse viewpoints. Inclusivity creates stronger communities.', '1702608263', 'active'),
(182, 16, 'Books open doors to different worlds. Mistakes teach valuable lessons. Adversity fosters resilience. The arts enable diverse expressions.', '1702820841', 'active'),
(183, 16, 'Purpose gives meaning to life. Empowerment leads to greater achievements.', '1702676892', 'active'),
(184, 58, 'Optimism has a contagious effect. Education is a lifelong pursuit.', '1703091734', 'active'),
(185, 35, 'Self-awareness fuels personal development. Resilience helps overcome challenges. The pursuit of excellence drives progress. Happiness is subjective and can be found in simple moments.', '1703316449', 'active'),
(186, 36, 'Gratitude transforms perspective. Family provides a sense of belonging. Optimism has a contagious effect. A positive mindset conquers obstacles.', '1703549661', 'active'),
(187, 26, 'Individual actions can create significant change. Compassion makes the world a better place.', '1702558403', 'active'),
(188, 4, 'The arts provide avenues for expression. Kindness creates ripples of positivity.', '1702934357', 'active'),
(189, 28, 'Innovation drives progress. Empowerment fosters self-belief.', '1703621628', 'active'),
(190, 34, 'Food nourishes not just the body, but also the soul. Balance is key to a fulfilling life.', '1702906328', 'active'),
(191, 50, 'Small acts of kindness yield significant impact.', '1703443280', 'active'),
(192, 30, 'Humor lightens even the darkest moments.', '1702821879', 'active'),
(193, 42, 'Success means different things to different people. Embracing change leads to personal evolution. Empathy fosters connections between people.', '1702758483', 'active'),
(194, 25, 'Humility allows for personal growth. Laughter is good for the soul. Individual actions create significant impacts.', '1702877092', 'active'),
(195, 38, 'Support systems are crucial during tough times. Empowerment fosters self-belief.', '1703010722', 'active'),
(196, 66, 'Dreams have the power to inspire action. Integrity is the foundation of trust. Responsibility accompanies privilege. Individual actions can create significant change.', '1703006194', 'active'),
(197, 33, 'Faith provides strength and comfort. Adversity often leads to resilience. Empathy fosters a more compassionate society. Family provides a sense of belonging.', '1703579864', 'active'),
(198, 51, 'Diversity enriches communities.', '1702633947', 'active'),
(199, 44, 'Tolerance fosters diverse perspectives.', '1703228428', 'active'),
(200, 66, 'Responsibility comes with privilege.', '1702743999', 'active'),
(201, 69, 'this is it', '1703922573', 'active'),
(202, 0, 'See what\'s happening ', '1708457091', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `photo` text NOT NULL,
  `status` text NOT NULL,
  `refer` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL,
  `ref` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `status`, `refer`, `country`, `type`, `date`, `ref`) VALUES
(1, 'Heather01', '15840_10620.png', 'active', 0, 91, 'user', '1703759208', 'Y7wxC1kuqd-'),
(2, 'Gina08', '19487_63698.png', 'active', 0, 91, 'user', '1703759208', 'osLupZK-Oe2'),
(3, 'Amanda01', '26322_77256.png', 'active', 0, 91, 'user', '1703759208', 'kowaLWdYu95'),
(4, 'Stephanie01', '73487_27141.png', 'active', 0, 91, 'user', '1703759208', 'U0Na9tLNVe-'),
(5, 'Erin06', '68620_70338.png', 'active', 0, 91, 'user', '1703759208', '6l-a0mzoU6A'),
(6, 'Jennifer00', '10112_80318.png', 'active', 0, 91, 'user', '1703759208', 'wtKHLKQd_X8'),
(7, 'Jessica02', '58946_61025.png', 'active', 0, 91, 'user', '1703759208', '5RukfQiMBIN'),
(8, 'Linda08', '82928_67780.png', 'active', 0, 91, 'user', '1703759208', 'o61kt0G_TYc'),
(9, 'Carol03', '13364_26689.png', 'active', 0, 91, 'user', '1703759208', 'ETRPdEdxJw3'),
(10, 'Tracy04', '31840_82795.png', 'active', 0, 91, 'user', '1703759208', 'rsCYdXQLdS3'),
(11, 'Hailey03', '46897_53757.png', 'active', 0, 91, 'user', '1703759208', 'yH6YJ61aZii'),
(12, 'Kayla02', '19897_83208.png', 'active', 0, 91, 'user', '1703759208', 'yEUqzD1Le5-'),
(13, 'Jeanette07', '47631_69662.png', 'active', 0, 91, 'user', '1703759208', 'HcGqN8Ux6bs'),
(14, 'Katie07', '82341_82028.png', 'active', 0, 91, 'user', '1703759208', 'FM55vsAzu9J'),
(15, 'Katherine01', '39459_47427.png', 'active', 0, 91, 'user', '1703759208', 'MGUHo6Y-eyo'),
(16, 'Deborah07', '59280_28405.png', 'active', 0, 91, 'user', '1703759208', '8ANH9WSGs56'),
(17, 'Heidi03', '75219_48681.png', 'active', 0, 91, 'user', '1703759208', '4i6viFkU6N6'),
(18, 'Christina06', '28778_14553.png', 'active', 0, 91, 'user', '1703759208', 'dF6bDTSP-ZO'),
(19, 'Amy03', '48367_49222.png', 'active', 0, 91, 'user', '1703759208', 'PK4hYaF_Fum'),
(20, 'Kathleen01', '48410_67267.png', 'active', 0, 91, 'user', '1703759208', 'vFzkxuuklDb'),
(21, 'Alexandra06', '13706_29452.png', 'active', 0, 91, 'user', '1703759208', 'l09j-JaF5YC'),
(22, 'Caroline09', '33141_30881.png', 'active', 0, 91, 'user', '1703759208', 'yS6ABeJ9-7v'),
(23, 'Julia04', '53637_66995.png', 'active', 0, 91, 'user', '1703759208', 'MGgiSFGLClQ'),
(24, 'Ashley06', '70266_28045.png', 'active', 0, 91, 'user', '1703759208', 'gNerWI_a_4u'),
(25, 'Maria06', '40750_63563.png', 'active', 0, 91, 'user', '1703759208', 'zIbamYwtgys'),
(26, 'Alyssa00', '42179_55918.png', 'active', 0, 91, 'user', '1703759208', '0foQ6rxvgj7'),
(27, 'Rebecca02', '14690_39665.png', 'active', 0, 91, 'user', '1703759208', '9dO3GmCZW7H'),
(28, 'Allison01', '53216_53048.png', 'active', 0, 91, 'user', '1703759208', 'NWDLvtH13K0'),
(29, 'Kristen01', '79394_58582.png', 'active', 0, 91, 'user', '1703759208', 'sysnTjT_td7'),
(30, 'Michelle01', '69731_58093.png', 'active', 0, 91, 'user', '1703759208', 'w_NUEaRIYaG'),
(31, 'Sherri07', '69211_60164.png', 'active', 0, 91, 'user', '1703759208', 'L9lwXCkrXC0'),
(32, 'Leslie00', '32740_22354.png', 'active', 0, 91, 'user', '1703759208', '42Ql6YbUlUs'),
(33, 'Sandra08', '32532_69065.png', 'active', 0, 91, 'user', '1703759208', 'FV7PneBNR1I'),
(34, 'Amber01', '22382_59662.png', 'active', 0, 91, 'user', '1703759208', 'WqF7JoE_rxW'),
(35, 'Marcia04', '46569_51352.png', 'active', 0, 91, 'user', '1703759208', 'dG38_iSaTIY'),
(36, 'Kristi07', '35870_29608.png', 'active', 0, 91, 'user', '1703759208', 'W870I0TMbmz'),
(37, 'Melinda02', '60547_82481.png', 'active', 0, 91, 'user', '1703759208', '0GOAuRU8tLA'),
(38, 'Emily01', '89458_85550.png', 'active', 0, 91, 'user', '1703759208', 'Rs7uHRfFLO9'),
(39, 'Dana00', '80430_55880.png', 'active', 0, 91, 'user', '1703759208', 'q3sJrnbrL0u'),
(40, 'Mary00', '60531_48487.png', 'active', 0, 91, 'user', '1703759208', 'ci0HiWATDYF'),
(41, 'Susan04', '26339_73540.png', 'active', 0, 91, 'user', '1703759208', 'vIsgsgFO_4s'),
(42, 'Paige03', '45796_26824.png', 'active', 0, 91, 'user', '1703759208', 'T7--APP8vF0'),
(43, 'Sherry00', '42524_28629.png', 'active', 0, 91, 'user', '1703759208', 'bjs7IEcI_5b'),
(44, 'Julie05', '72689_65929.png', 'active', 0, 91, 'user', '1703759208', 'jBV0eKHjNxK'),
(45, 'Kaylee00', '21976_12197.png', 'active', 0, 91, 'user', '1703759208', 'h9eNArWKWco'),
(46, 'Faith01', '47959_26513.png', 'active', 0, 91, 'user', '1703759208', 'wPzK9Ik5ENP'),
(47, 'Sarah09', '49326_51556.png', 'active', 0, 91, 'user', '1703759208', 'S523T6FSKsD'),
(48, 'Margaret03', '54311_50130.png', 'active', 0, 91, 'user', '1703759208', 'A5w-_geUv0o'),
(49, 'Debbie08', '22233_48776.png', 'active', 0, 91, 'user', '1703759208', 'RQEwrdVkBSd'),
(50, 'Lisa06', '53707_16193.png', 'active', 0, 91, 'user', '1703759208', 'ywuv81NqdC9'),
(51, 'Sara05', '28033_89763.png', 'active', 0, 91, 'user', '1703759208', 'HVYWOH12WWV'),
(52, 'Vanessa09', '85593_37941.png', 'active', 0, 91, 'user', '1703759208', 'jaM7T7AbSyD'),
(53, 'Anne02', '18782_31078.png', 'active', 0, 91, 'user', '1703759208', 'yOFeTUmeOYb'),
(54, 'Lauren01', '61001_36631.png', 'active', 0, 91, 'user', '1703759208', 'xp6wTTQ4tvr'),
(55, 'Leah03', '30071_44842.png', 'active', 0, 91, 'user', '1703759208', 'MNWuCjSR2h8'),
(56, 'Judy04', '75955_42145.png', 'active', 0, 91, 'user', '1703759208', '2krIJ5DqfWh'),
(57, 'Isabella07', '12840_47159.png', 'active', 0, 91, 'user', '1703759208', 'a-cszYEVSM6'),
(58, 'Brenda09', '79358_10026.png', 'active', 0, 91, 'user', '1703759208', '6xKyZGYhK5r'),
(59, 'Kimberly04', '63642_78132.png', 'active', 0, 91, 'user', '1703759208', 'VJWKOiFjqZP'),
(60, 'Kari00', '78539_21331.png', 'active', 0, 91, 'user', '1703759208', '0fstrm5gXHB'),
(61, 'Hannah06', '89586_12760.png', 'active', 0, 91, 'user', '1703759208', 'pGp6fXwdf38'),
(62, 'Elaine01', '78612_79241.png', 'active', 0, 91, 'user', '1703759208', '5LapQZgmAdr'),
(63, 'Hayley03', '70612_57515.png', 'active', 0, 91, 'user', '1703759208', 'Po1vOHA1tgT'),
(64, 'Danielle03', '28180_32470.png', 'active', 0, 91, 'user', '1703759208', 'ODb-OwoPfTK'),
(65, 'Taylor05', '68664_81644.png', 'active', 0, 91, 'user', '1703759208', 'MlMHg9bR3uN'),
(66, 'Teresa05', '27883_75274.png', 'active', 0, 91, 'user', '1703759208', '-6MI3Q-Tr26'),
(67, 'Lori05', '37141_68539.png', 'active', 0, 91, 'user', '1703759208', '6xW6Z8mdl30'),
(69, 'Alfred Liwewe', 'FB_IMG_16831985903060419.jpg', 'active', 1, 91, 'user', '1703759208', '5MllML4dI6F'),
(71, 'Forbes', 'DEeVgtpyrwIshXkKnWnvOEeeakiSTvtw.jpg', 'active', 0, 192, 'channel', '1708465355', 'yL9IpAMvYjN');

-- --------------------------------------------------------

--
-- Table structure for table `viewed`
--

CREATE TABLE `viewed` (
  `id` int(11) NOT NULL,
  `viewer` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `type` text NOT NULL,
  `time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewed`
--

INSERT INTO `viewed` (`id`, `viewer`, `post`, `type`, `time`) VALUES
(1, 69, 1, 'post', '1708458626'),
(2, 69, 2, 'post', '1708458626'),
(3, 69, 3, 'post', '1708458626'),
(4, 69, 4, 'post', '1708458626'),
(5, 69, 5, 'post', '1708458626'),
(6, 69, 6, 'post', '1708458626'),
(7, 69, 7, 'post', '1708458626'),
(8, 69, 8, 'post', '1708458626'),
(9, 69, 9, 'post', '1708458626'),
(10, 69, 10, 'post', '1708458626'),
(11, 69, 11, 'post', '1708458796'),
(12, 69, 12, 'post', '1708458796'),
(13, 69, 13, 'post', '1708458796'),
(14, 69, 14, 'post', '1708458796'),
(15, 69, 15, 'post', '1708458796'),
(16, 69, 16, 'post', '1708458796'),
(17, 69, 17, 'post', '1708458796'),
(18, 69, 18, 'post', '1708458796'),
(19, 69, 19, 'post', '1708458796'),
(20, 69, 20, 'post', '1708458796'),
(21, 69, 21, 'post', '1708459087'),
(22, 69, 22, 'post', '1708459087'),
(23, 69, 23, 'post', '1708459087'),
(24, 69, 24, 'post', '1708459087'),
(25, 69, 25, 'post', '1708459087'),
(26, 69, 26, 'post', '1708459087'),
(27, 69, 27, 'post', '1708459087'),
(28, 69, 28, 'post', '1708459087'),
(29, 69, 29, 'post', '1708459087'),
(30, 69, 30, 'post', '1708459087'),
(31, 69, 31, 'post', '1708459420'),
(32, 69, 32, 'post', '1708459420'),
(33, 69, 33, 'post', '1708459420'),
(34, 69, 34, 'post', '1708459420'),
(35, 69, 35, 'post', '1708459420'),
(36, 69, 36, 'post', '1708459420'),
(37, 69, 37, 'post', '1708459420'),
(38, 69, 38, 'post', '1708459420'),
(39, 69, 39, 'post', '1708459420'),
(40, 69, 40, 'post', '1708459420'),
(41, 69, 41, 'post', '1708459674'),
(42, 69, 42, 'post', '1708459674'),
(43, 69, 43, 'post', '1708459674'),
(44, 69, 44, 'post', '1708459674'),
(45, 69, 45, 'post', '1708459674'),
(46, 69, 46, 'post', '1708459674'),
(47, 69, 47, 'post', '1708459674'),
(48, 69, 48, 'post', '1708459674'),
(49, 69, 49, 'post', '1708459674'),
(50, 69, 50, 'post', '1708459674'),
(51, 69, 51, 'post', '1708459728'),
(52, 69, 52, 'post', '1708459728'),
(53, 69, 53, 'post', '1708459728'),
(54, 69, 54, 'post', '1708459728'),
(55, 69, 55, 'post', '1708459728'),
(56, 69, 56, 'post', '1708459728'),
(57, 69, 57, 'post', '1708459728'),
(58, 69, 58, 'post', '1708459728'),
(59, 69, 59, 'post', '1708459728'),
(60, 69, 60, 'post', '1708459728'),
(61, 69, 61, 'post', '1708459904'),
(62, 69, 62, 'post', '1708459904'),
(63, 69, 63, 'post', '1708459904'),
(64, 69, 64, 'post', '1708459904'),
(65, 69, 65, 'post', '1708459904'),
(66, 69, 66, 'post', '1708459904'),
(67, 69, 67, 'post', '1708459904'),
(68, 69, 68, 'post', '1708459904'),
(69, 69, 69, 'post', '1708459904'),
(70, 69, 70, 'post', '1708459904'),
(71, 69, 71, 'post', '1708459926'),
(72, 69, 72, 'post', '1708459926'),
(73, 69, 73, 'post', '1708459926'),
(74, 69, 74, 'post', '1708459926'),
(75, 69, 75, 'post', '1708459926'),
(76, 69, 76, 'post', '1708459926'),
(77, 69, 77, 'post', '1708459926'),
(78, 69, 78, 'post', '1708459926'),
(79, 69, 79, 'post', '1708459926'),
(80, 69, 80, 'post', '1708459926'),
(81, 69, 71, 'post', '1708459926'),
(82, 69, 72, 'post', '1708459926'),
(83, 69, 73, 'post', '1708459926'),
(84, 69, 74, 'post', '1708459926'),
(85, 69, 75, 'post', '1708459926'),
(86, 69, 76, 'post', '1708459926'),
(87, 69, 77, 'post', '1708459926'),
(88, 69, 78, 'post', '1708459926'),
(89, 69, 79, 'post', '1708459926'),
(90, 69, 80, 'post', '1708459926'),
(91, 69, 81, 'post', '1708459937'),
(92, 69, 82, 'post', '1708459937'),
(93, 69, 83, 'post', '1708459937'),
(94, 69, 84, 'post', '1708459937'),
(95, 69, 85, 'post', '1708459937'),
(96, 69, 86, 'post', '1708459937'),
(97, 69, 87, 'post', '1708459937'),
(98, 69, 88, 'post', '1708459937'),
(99, 69, 89, 'post', '1708459937'),
(100, 69, 90, 'post', '1708459937'),
(101, 69, 81, 'post', '1708459937'),
(102, 69, 82, 'post', '1708459937'),
(103, 69, 83, 'post', '1708459937'),
(104, 69, 84, 'post', '1708459937'),
(105, 69, 85, 'post', '1708459937'),
(106, 69, 86, 'post', '1708459937'),
(107, 69, 87, 'post', '1708459937'),
(108, 69, 88, 'post', '1708459937'),
(109, 69, 89, 'post', '1708459937'),
(110, 69, 90, 'post', '1708459937'),
(111, 69, 91, 'post', '1708459945'),
(112, 69, 92, 'post', '1708459945'),
(113, 69, 93, 'post', '1708459945'),
(114, 69, 94, 'post', '1708459945'),
(115, 69, 95, 'post', '1708459945'),
(116, 69, 96, 'post', '1708459945'),
(117, 69, 97, 'post', '1708459945'),
(118, 69, 98, 'post', '1708459945'),
(119, 69, 99, 'post', '1708459945'),
(120, 69, 100, 'post', '1708459945'),
(121, 69, 91, 'post', '1708459945'),
(122, 69, 92, 'post', '1708459945'),
(123, 69, 93, 'post', '1708459945'),
(124, 69, 94, 'post', '1708459945'),
(125, 69, 95, 'post', '1708459945'),
(126, 69, 96, 'post', '1708459945'),
(127, 69, 97, 'post', '1708459945'),
(128, 69, 98, 'post', '1708459945'),
(129, 69, 99, 'post', '1708459945'),
(130, 69, 100, 'post', '1708459945'),
(131, 69, 91, 'post', '1708459945'),
(132, 69, 92, 'post', '1708459945'),
(133, 69, 93, 'post', '1708459945'),
(134, 69, 94, 'post', '1708459945'),
(135, 69, 95, 'post', '1708459945'),
(136, 69, 96, 'post', '1708459945'),
(137, 69, 97, 'post', '1708459945'),
(138, 69, 98, 'post', '1708459945'),
(139, 69, 99, 'post', '1708459945'),
(140, 69, 100, 'post', '1708459945'),
(141, 69, 91, 'post', '1708459945'),
(142, 69, 92, 'post', '1708459945'),
(143, 69, 93, 'post', '1708459945'),
(144, 69, 94, 'post', '1708459945'),
(145, 69, 95, 'post', '1708459945'),
(146, 69, 96, 'post', '1708459945'),
(147, 69, 97, 'post', '1708459945'),
(148, 69, 98, 'post', '1708459945'),
(149, 69, 99, 'post', '1708459945'),
(150, 69, 100, 'post', '1708459945'),
(151, 69, 91, 'post', '1708459945'),
(152, 69, 92, 'post', '1708459945'),
(153, 69, 93, 'post', '1708459945'),
(154, 69, 94, 'post', '1708459945'),
(155, 69, 95, 'post', '1708459945'),
(156, 69, 96, 'post', '1708459945'),
(157, 69, 97, 'post', '1708459945'),
(158, 69, 98, 'post', '1708459945'),
(159, 69, 99, 'post', '1708459945'),
(160, 69, 100, 'post', '1708459945'),
(161, 69, 101, 'post', '1708459949'),
(162, 69, 102, 'post', '1708459949'),
(163, 69, 103, 'post', '1708459949'),
(164, 69, 104, 'post', '1708459949'),
(165, 69, 105, 'post', '1708459949'),
(166, 69, 106, 'post', '1708459949'),
(167, 69, 107, 'post', '1708459949'),
(168, 69, 108, 'post', '1708459949'),
(169, 69, 109, 'post', '1708459949'),
(170, 69, 110, 'post', '1708459949'),
(171, 69, 101, 'post', '1708459949'),
(172, 69, 102, 'post', '1708459949'),
(173, 69, 103, 'post', '1708459949'),
(174, 69, 104, 'post', '1708459949'),
(175, 69, 105, 'post', '1708459949'),
(176, 69, 106, 'post', '1708459949'),
(177, 69, 107, 'post', '1708459949'),
(178, 69, 108, 'post', '1708459949'),
(179, 69, 109, 'post', '1708459949'),
(180, 69, 110, 'post', '1708459949'),
(181, 69, 111, 'post', '1708459952'),
(182, 69, 112, 'post', '1708459952'),
(183, 69, 113, 'post', '1708459952'),
(184, 69, 114, 'post', '1708459952'),
(185, 69, 115, 'post', '1708459952'),
(186, 69, 116, 'post', '1708459952'),
(187, 69, 117, 'post', '1708459952'),
(188, 69, 118, 'post', '1708459952'),
(189, 69, 119, 'post', '1708459952'),
(190, 69, 120, 'post', '1708459952'),
(191, 69, 111, 'post', '1708459952'),
(192, 69, 112, 'post', '1708459952'),
(193, 69, 113, 'post', '1708459952'),
(194, 69, 114, 'post', '1708459952'),
(195, 69, 115, 'post', '1708459952'),
(196, 69, 116, 'post', '1708459952'),
(197, 69, 117, 'post', '1708459952'),
(198, 69, 118, 'post', '1708459952'),
(199, 69, 119, 'post', '1708459952'),
(200, 69, 120, 'post', '1708459952'),
(201, 69, 121, 'post', '1708459952'),
(202, 69, 122, 'post', '1708459952'),
(203, 69, 123, 'post', '1708459952'),
(204, 69, 124, 'post', '1708459952'),
(205, 69, 125, 'post', '1708459952'),
(206, 69, 126, 'post', '1708459952'),
(207, 69, 127, 'post', '1708459952'),
(208, 69, 128, 'post', '1708459952'),
(209, 69, 129, 'post', '1708459952'),
(210, 69, 130, 'post', '1708459952'),
(211, 69, 121, 'post', '1708459952'),
(212, 69, 122, 'post', '1708459952'),
(213, 69, 123, 'post', '1708459952'),
(214, 69, 124, 'post', '1708459952'),
(215, 69, 125, 'post', '1708459952'),
(216, 69, 126, 'post', '1708459952'),
(217, 69, 127, 'post', '1708459952'),
(218, 69, 128, 'post', '1708459952'),
(219, 69, 129, 'post', '1708459952'),
(220, 69, 130, 'post', '1708459952'),
(221, 69, 121, 'post', '1708459952'),
(222, 69, 122, 'post', '1708459952'),
(223, 69, 123, 'post', '1708459952'),
(224, 69, 124, 'post', '1708459952'),
(225, 69, 125, 'post', '1708459952'),
(226, 69, 126, 'post', '1708459952'),
(227, 69, 127, 'post', '1708459952'),
(228, 69, 128, 'post', '1708459952'),
(229, 69, 129, 'post', '1708459952'),
(230, 69, 130, 'post', '1708459952'),
(231, 69, 131, 'post', '1708459956'),
(232, 69, 132, 'post', '1708459956'),
(233, 69, 133, 'post', '1708459956'),
(234, 69, 134, 'post', '1708459956'),
(235, 69, 135, 'post', '1708459956'),
(236, 69, 136, 'post', '1708459956'),
(237, 69, 137, 'post', '1708459956'),
(238, 69, 138, 'post', '1708459956'),
(239, 69, 139, 'post', '1708459956'),
(240, 69, 140, 'post', '1708459956'),
(241, 69, 131, 'post', '1708459956'),
(242, 69, 132, 'post', '1708459956'),
(243, 69, 133, 'post', '1708459956'),
(244, 69, 134, 'post', '1708459956'),
(245, 69, 135, 'post', '1708459956'),
(246, 69, 136, 'post', '1708459956'),
(247, 69, 137, 'post', '1708459956'),
(248, 69, 138, 'post', '1708459956'),
(249, 69, 139, 'post', '1708459956'),
(250, 69, 140, 'post', '1708459956'),
(251, 69, 141, 'post', '1708459987'),
(252, 69, 142, 'post', '1708459987'),
(253, 69, 143, 'post', '1708459987'),
(254, 69, 144, 'post', '1708459987'),
(255, 69, 145, 'post', '1708459987'),
(256, 69, 146, 'post', '1708459987'),
(257, 69, 147, 'post', '1708459987'),
(258, 69, 148, 'post', '1708459987'),
(259, 69, 149, 'post', '1708459987'),
(260, 69, 150, 'post', '1708459987'),
(261, 69, 141, 'post', '1708459987'),
(262, 69, 142, 'post', '1708459987'),
(263, 69, 143, 'post', '1708459987'),
(264, 69, 144, 'post', '1708459987'),
(265, 69, 145, 'post', '1708459987'),
(266, 69, 146, 'post', '1708459987'),
(267, 69, 147, 'post', '1708459987'),
(268, 69, 148, 'post', '1708459987'),
(269, 69, 149, 'post', '1708459987'),
(270, 69, 150, 'post', '1708459987'),
(271, 69, 141, 'post', '1708459987'),
(272, 69, 142, 'post', '1708459987'),
(273, 69, 143, 'post', '1708459987'),
(274, 69, 144, 'post', '1708459987'),
(275, 69, 145, 'post', '1708459987'),
(276, 69, 146, 'post', '1708459987'),
(277, 69, 147, 'post', '1708459987'),
(278, 69, 148, 'post', '1708459987'),
(279, 69, 149, 'post', '1708459987'),
(280, 69, 150, 'post', '1708459987'),
(281, 69, 141, 'post', '1708459987'),
(282, 69, 142, 'post', '1708459987'),
(283, 69, 143, 'post', '1708459987'),
(284, 69, 144, 'post', '1708459987'),
(285, 69, 145, 'post', '1708459987'),
(286, 69, 146, 'post', '1708459987'),
(287, 69, 147, 'post', '1708459987'),
(288, 69, 148, 'post', '1708459987'),
(289, 69, 149, 'post', '1708459987'),
(290, 69, 150, 'post', '1708459987'),
(291, 69, 141, 'post', '1708459987'),
(292, 69, 142, 'post', '1708459987'),
(293, 69, 143, 'post', '1708459987'),
(294, 69, 144, 'post', '1708459987'),
(295, 69, 145, 'post', '1708459987'),
(296, 69, 146, 'post', '1708459987'),
(297, 69, 147, 'post', '1708459987'),
(298, 69, 148, 'post', '1708459987'),
(299, 69, 149, 'post', '1708459987'),
(300, 69, 150, 'post', '1708459987'),
(301, 69, 151, 'post', '1708460476'),
(302, 69, 152, 'post', '1708460476'),
(303, 69, 153, 'post', '1708460476'),
(304, 69, 154, 'post', '1708460476'),
(305, 69, 155, 'post', '1708460476'),
(306, 69, 156, 'post', '1708460476'),
(307, 69, 157, 'post', '1708460476'),
(308, 69, 158, 'post', '1708460476'),
(309, 69, 159, 'post', '1708460476'),
(310, 69, 160, 'post', '1708460476'),
(311, 69, 151, 'post', '1708460476'),
(312, 69, 152, 'post', '1708460476'),
(313, 69, 153, 'post', '1708460476'),
(314, 69, 154, 'post', '1708460476'),
(315, 69, 155, 'post', '1708460476'),
(316, 69, 156, 'post', '1708460476'),
(317, 69, 157, 'post', '1708460476'),
(318, 69, 158, 'post', '1708460476'),
(319, 69, 159, 'post', '1708460476'),
(320, 69, 160, 'post', '1708460476'),
(321, 69, 151, 'post', '1708460476'),
(322, 69, 152, 'post', '1708460476'),
(323, 69, 153, 'post', '1708460476'),
(324, 69, 154, 'post', '1708460476'),
(325, 69, 155, 'post', '1708460476'),
(326, 69, 156, 'post', '1708460476'),
(327, 69, 157, 'post', '1708460476'),
(328, 69, 158, 'post', '1708460476'),
(329, 69, 159, 'post', '1708460476'),
(330, 69, 160, 'post', '1708460476'),
(331, 69, 151, 'post', '1708460476'),
(332, 69, 152, 'post', '1708460476'),
(333, 69, 153, 'post', '1708460476'),
(334, 69, 154, 'post', '1708460476'),
(335, 69, 155, 'post', '1708460476'),
(336, 69, 156, 'post', '1708460476'),
(337, 69, 157, 'post', '1708460476'),
(338, 69, 158, 'post', '1708460476'),
(339, 69, 159, 'post', '1708460476'),
(340, 69, 160, 'post', '1708460476'),
(341, 69, 151, 'post', '1708460476'),
(342, 69, 152, 'post', '1708460476'),
(343, 69, 153, 'post', '1708460476'),
(344, 69, 154, 'post', '1708460476'),
(345, 69, 155, 'post', '1708460476'),
(346, 69, 156, 'post', '1708460476'),
(347, 69, 157, 'post', '1708460476'),
(348, 69, 158, 'post', '1708460476'),
(349, 69, 159, 'post', '1708460476'),
(350, 69, 160, 'post', '1708460476'),
(351, 69, 161, 'post', '1708460497'),
(352, 69, 162, 'post', '1708460497'),
(353, 69, 163, 'post', '1708460497'),
(354, 69, 164, 'post', '1708460497'),
(355, 69, 165, 'post', '1708460497'),
(356, 69, 166, 'post', '1708460497'),
(357, 69, 167, 'post', '1708460497'),
(358, 69, 168, 'post', '1708460497'),
(359, 69, 169, 'post', '1708460497'),
(360, 69, 170, 'post', '1708460497'),
(361, 69, 161, 'post', '1708460497'),
(362, 69, 162, 'post', '1708460497'),
(363, 69, 163, 'post', '1708460497'),
(364, 69, 164, 'post', '1708460497'),
(365, 69, 165, 'post', '1708460497'),
(366, 69, 166, 'post', '1708460497'),
(367, 69, 167, 'post', '1708460497'),
(368, 69, 168, 'post', '1708460497'),
(369, 69, 169, 'post', '1708460497'),
(370, 69, 170, 'post', '1708460497'),
(371, 69, 161, 'post', '1708460497'),
(372, 69, 162, 'post', '1708460497'),
(373, 69, 163, 'post', '1708460497'),
(374, 69, 164, 'post', '1708460497'),
(375, 69, 165, 'post', '1708460497'),
(376, 69, 166, 'post', '1708460497'),
(377, 69, 167, 'post', '1708460497'),
(378, 69, 168, 'post', '1708460497'),
(379, 69, 169, 'post', '1708460497'),
(380, 69, 170, 'post', '1708460497'),
(381, 69, 161, 'post', '1708460497'),
(382, 69, 162, 'post', '1708460497'),
(383, 69, 163, 'post', '1708460497'),
(384, 69, 164, 'post', '1708460497'),
(385, 69, 165, 'post', '1708460497'),
(386, 69, 166, 'post', '1708460497'),
(387, 69, 167, 'post', '1708460497'),
(388, 69, 168, 'post', '1708460497'),
(389, 69, 169, 'post', '1708460497'),
(390, 69, 170, 'post', '1708460497'),
(391, 69, 161, 'post', '1708460497'),
(392, 69, 162, 'post', '1708460497'),
(393, 69, 163, 'post', '1708460497'),
(394, 69, 164, 'post', '1708460497'),
(395, 69, 165, 'post', '1708460497'),
(396, 69, 166, 'post', '1708460497'),
(397, 69, 167, 'post', '1708460497'),
(398, 69, 168, 'post', '1708460497'),
(399, 69, 169, 'post', '1708460497'),
(400, 69, 170, 'post', '1708460497'),
(401, 69, 171, 'post', '1708546342'),
(402, 69, 172, 'post', '1708546342'),
(403, 69, 173, 'post', '1708546342'),
(404, 69, 174, 'post', '1708546342'),
(405, 69, 175, 'post', '1708546342'),
(406, 69, 176, 'post', '1708546342'),
(407, 69, 177, 'post', '1708546342'),
(408, 69, 178, 'post', '1708546342'),
(409, 69, 179, 'post', '1708546342'),
(410, 69, 180, 'post', '1708546342'),
(411, 69, 181, 'post', '1708547677'),
(412, 69, 182, 'post', '1708547677'),
(413, 69, 183, 'post', '1708547677'),
(414, 69, 184, 'post', '1708547677'),
(415, 69, 185, 'post', '1708547677'),
(416, 69, 186, 'post', '1708547677'),
(417, 69, 187, 'post', '1708547677'),
(418, 69, 188, 'post', '1708547677'),
(419, 69, 189, 'post', '1708547677'),
(420, 69, 190, 'post', '1708547677'),
(421, 69, 191, 'post', '1708547842'),
(422, 69, 192, 'post', '1708547842'),
(423, 69, 193, 'post', '1708547842'),
(424, 69, 194, 'post', '1708547842'),
(425, 69, 195, 'post', '1708547842'),
(426, 69, 196, 'post', '1708547842'),
(427, 69, 197, 'post', '1708547842'),
(428, 69, 198, 'post', '1708547842'),
(429, 69, 199, 'post', '1708547842'),
(430, 69, 200, 'post', '1708547842'),
(431, 69, 201, 'post', '1708548545'),
(432, 69, 202, 'post', '1708548545'),
(433, 69, 201, 'post', '1708548545'),
(434, 69, 202, 'post', '1708548545'),
(435, 69, 201, 'post', '1708548545'),
(436, 69, 202, 'post', '1708548545'),
(437, 69, 201, 'post', '1708548545'),
(438, 69, 202, 'post', '1708548545'),
(439, 69, 201, 'post', '1708548545'),
(440, 69, 202, 'post', '1708548545');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachements`
--
ALTER TABLE `attachements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocked`
--
ALTER TABLE `blocked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `story_cache`
--
ALTER TABLE `story_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `viewed`
--
ALTER TABLE `viewed`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachements`
--
ALTER TABLE `attachements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `blocked`
--
ALTER TABLE `blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `story_cache`
--
ALTER TABLE `story_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `viewed`
--
ALTER TABLE `viewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
