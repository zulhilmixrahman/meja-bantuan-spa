-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.36 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for emb
CREATE DATABASE IF NOT EXISTS `emb_chart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `emb_chart`;

-- Dumping structure for table emb.audits
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint unsigned NOT NULL,
  `old_values` text,
  `new_values` text,
  `url` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(1023) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.audits: ~0 rows (approximately)

-- Dumping structure for table emb.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.cache: ~1 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('spatie.permission.cache', 'a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:27:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:12:"access roles";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:8:"add role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:9:"edit role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:11:"delete role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:18:"access permissions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:14:"add permission";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:15:"edit permission";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:17:"delete permission";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:12:"access users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:8:"add user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:9:"edit user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:11:"delete user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:18:"access departments";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:14:"add department";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:15:"edit department";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:17:"delete department";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:17:"access categories";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:12:"add category";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:13:"edit category";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:15:"delete category";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:20:"access subcategories";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:15:"add subcategory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:16:"edit subcategory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:18:"delete subcategory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:10:"urus aduan";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:10:"agih aduan";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:18:"kemaskini tindakan";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:3;}}}s:5:"roles";a:3:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:13:"administrator";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:15:"Pentadbir Aduan";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:3;s:1:"b";s:13:"Pegawai Aduan";s:1:"c";s:3:"web";}}}', 1726733350);

-- Dumping structure for table emb.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.cache_locks: ~0 rows (approximately)

-- Dumping structure for table emb.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.categories: ~2 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Perkakasan', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL),
	(2, 'Aplikasi', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL);

-- Dumping structure for table emb.complaints
CREATE TABLE IF NOT EXISTS `complaints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_tiket` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `sub_category_id` bigint unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `officer_id` bigint unsigned DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'baru' COMMENT 'baru|agihan|dalam_tindakan|selesai|tutup',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_sub_category_id_foreign` (`sub_category_id`),
  KEY `complaints_officer_id_foreign` (`officer_id`),
  CONSTRAINT `complaints_officer_id_foreign` FOREIGN KEY (`officer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `complaints_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.complaints: ~150 rows (approximately)
INSERT INTO `complaints` (`id`, `no_tiket`, `user_name`, `user_email`, `user_tel`, `sub_category_id`, `title`, `detail`, `lampiran`, `officer_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'ICT-202409-1726647364', 'Swarna H\'ng', 'h\'ng@yahoo.com', NULL, 2, 'Neque dolor qui impedit ex beatae velit porro et quas.', 'Dolorum repellendus maxime aut facere. Numquam qui velit in voluptas autem aut. Eius minus quia magnam est. Debitis hic nobis unde ducimus.', NULL, NULL, 'baru', '2024-09-15 15:11:20', '2024-09-18 00:16:04'),
	(2, 'ICT-202406-1726647367', 'Gai Zia Ponnusamy', 'ponnusamy@gmail.com', NULL, 1, 'Voluptatem inventore debitis voluptatem eum alias libero enim cupiditate enim sint dolorum et natus aut itaque velit vero rem.', 'Quia nulla quisquam quia porro qui voluptates. Illo voluptates aut dolorem mollitia doloremque. Aliquam est dolores id eius et officiis nostrum voluptatem.', NULL, 3, 'selesai', '2024-06-18 21:15:14', '2024-09-18 00:16:07'),
	(3, 'ICT-202407-1726647369', 'Renuga Vanajah', 'vanajah@yahoo.com', NULL, 5, 'Nulla sunt ut deserunt sapiente odit perferendis animi earum velit nam fugiat.', 'Dolor modi voluptas ut ex. Saepe dolorum libero commodi ut dignissimos voluptatem consequatur. Quia fugiat quibusdam sed et ex. Voluptatem quidem dolorem omnis totam quia nisi cupiditate. Et voluptatibus ipsa accusantium vel repellat et.', NULL, NULL, 'baru', '2024-07-24 12:00:18', '2024-09-18 00:16:09'),
	(4, 'ICT-202409-1726647371', 'Fish Kayveas', 'kayveas@hotmail.com', NULL, 5, 'Porro repellat voluptate minima quo et non autem temporibus nobis quae repudiandae.', 'Nisi eveniet optio est animi. Aut maxime placeat ipsam facilis nisi eos. Libero dolores unde nihil sit et.', NULL, NULL, 'baru', '2024-09-02 11:29:47', '2024-09-18 00:16:11'),
	(5, 'ICT-202407-1726647374', 'Afiza Malayalam', 'malayalam@yahoo.com', NULL, 2, 'Placeat impedit tempore hic tempora sed enim delectus facere voluptate quo a aperiam distinctio.', 'Blanditiis recusandae praesentium quibusdam quisquam id aspernatur. Nisi nostrum corporis dolorem nihil cum cupiditate dolores. Quis animi beatae est quis ea quo fuga.', NULL, NULL, 'baru', '2024-07-10 04:04:56', '2024-09-18 00:16:14'),
	(6, 'ICT-202408-722512280', 'Teresa Berman', 'berman@gmail.com', NULL, 1, 'Ex est et vero tempore ea voluptas.', 'Nisi ut optio eius nesciunt explicabo. Recusandae enim sunt expedita doloribus sequi molestias error. Delectus et debitis voluptatum magnam qui. Qui quis unde alias officiis nulla omnis.', NULL, NULL, 'baru', '2024-08-14 21:00:37', '2024-09-18 00:17:34'),
	(7, 'ICT-202406-10726861', 'Sopie Arif', 'arif@gmail.com', NULL, 1, 'Distinctio eveniet perspiciatis eius eos voluptas qui numquam delectus fuga nobis praesentium.', 'Minima dicta molestiae est totam eos omnis. Facere aperiam omnis sed earum. Aut adipisci possimus quod occaecati mollitia nostrum. Facere tempore similique aspernatur ut.', NULL, 6, 'selesai', '2024-06-21 23:59:49', '2024-09-18 00:17:34'),
	(8, 'ICT-202407-3441652', 'Palanivel Robbat', 'robbat@gmail.com', NULL, 4, 'Quis temporibus odit facilis illum eaque earum quia.', 'Quia dolore excepturi a numquam nisi ut tempora. Aut sunt id tempora minus dignissimos earum consequatur. Voluptatem iusto commodi molestiae at adipisci dolorum ipsum blanditiis.', NULL, 3, 'dalam_tindakan', '2024-07-02 04:08:17', '2024-09-18 00:17:34'),
	(9, 'ICT-202406-1703763032', 'Julian Iyer', 'iyer@yahoo.com', NULL, 2, 'Magnam aliquid magni quia sed et nisi vero possimus.', 'Neque assumenda perferendis quia qui. Omnis sed quis asperiores sint ut expedita. Repellat fugit aut sunt et quis dolor quis.', NULL, 7, 'selesai', '2024-06-22 22:42:04', '2024-09-18 00:17:34'),
	(10, 'ICT-202409-1433411459', 'Aidila Gong', 'gong@gmail.com', NULL, 1, 'Iusto consequatur pariatur sint eius ut.', 'Aut odio voluptatibus id placeat facere ut. Magnam id id omnis totam dolores. Sequi dolor rerum omnis sit commodi. Laboriosam sint omnis blanditiis expedita velit sint.', NULL, 7, 'selesai', '2024-09-07 12:52:34', '2024-09-18 00:17:34'),
	(11, 'ICT-202409-1152878749', 'Ainn Kumar', 'kumar@hotmail.com', NULL, 3, 'Ea consequatur ut in facere ipsum exercitationem repellendus.', 'Perferendis asperiores perferendis est dolorem vero et ipsa necessitatibus. Molestias eos quos tempora nulla. Dolor ut delectus totam reprehenderit.', NULL, NULL, 'baru', '2024-09-13 18:59:12', '2024-09-18 00:26:05'),
	(12, 'ICT-202407-229417451', 'Tricia Hamid', 'hamid@hotmail.com', NULL, 4, 'Odio voluptatem odit iusto dolore molestiae sequi est debitis enim possimus.', 'A est odio asperiores consequatur cupiditate nostrum natus libero. Et vel quae quis. Consectetur necessitatibus velit non beatae aut quas.', NULL, 8, 'dalam_tindakan', '2024-07-19 01:59:23', '2024-09-18 00:26:05'),
	(13, 'ICT-202408-765686650', 'Rynn Chew', 'chew@yahoo.com', NULL, 3, 'Ut sint officiis nostrum ab ut praesentium assumenda recusandae enim unde deserunt molestias quod.', 'Nisi officia architecto enim vero quos ratione voluptatum. Vel unde doloremque dolores molestiae asperiores repellat. Ea vel expedita vero aut fugit est id dolores. Ducimus consequuntur autem ipsa aut pariatur non distinctio enim.', NULL, 4, 'dalam_tindakan', '2024-08-17 22:57:58', '2024-09-18 00:26:05'),
	(14, 'ICT-202408-138058266', 'Amrullah Rasiah', 'rasiah@hotmail.com', NULL, 4, 'Libero voluptatibus non ut voluptatem magni quia et repellat minus quisquam.', 'Et nisi reiciendis consequuntur consequatur. Soluta et perspiciatis error modi voluptates. Hic ut est quis accusamus quis. Aspernatur repellendus voluptates velit id at ratione qui.', NULL, NULL, 'baru', '2024-08-11 22:58:32', '2024-09-18 00:26:05'),
	(15, 'ICT-202409-89800398', 'Thamil Mok', 'mok@gmail.com', NULL, 2, 'Sed possimus et cumque eius eius fugiat minus accusantium quo odio dolorem fugit accusantium nulla quod qui iste ab voluptatem.', 'In a quae minus recusandae impedit. Vitae dolor dicta ut rerum. Qui culpa quia repellat sequi.', NULL, NULL, 'baru', '2024-09-16 18:35:32', '2024-09-18 00:26:05'),
	(16, 'ICT-202407-172565054', 'Pin Yeng Kahar', 'kahar@hotmail.com', NULL, 3, 'Error fuga numquam rem autem ipsam nesciunt et cum quaerat molestias inventore nesciunt laudantium in.', 'Ea adipisci sequi reprehenderit minima a velit. Molestiae rerum id quo aut dolores repellat et. Quis et ut natus commodi fugiat.', NULL, NULL, 'baru', '2024-07-13 12:36:27', '2024-09-18 00:26:05'),
	(17, 'ICT-202406-868759076', 'Wan Selvarajoo', 'selvarajoo@yahoo.com', NULL, 3, 'Ipsum sed odit id sit rerum magni quis.', 'Et maxime cumque dolor doloribus tempore assumenda esse voluptas. Error voluptas labore aut iusto facilis iure. Adipisci sed aut omnis est reiciendis molestiae.', NULL, 6, 'dalam_tindakan', '2024-06-29 17:18:02', '2024-09-18 00:26:05'),
	(18, 'ICT-202409-69733290', 'Sittampalam Rajendran', 'rajendran@yahoo.com', NULL, 2, 'Dolores expedita vel officiis unde ad facilis earum corporis libero non quia eos molestiae nulla ex consequatur quas.', 'Eos ut sequi et perspiciatis. Aut eum rem quam sint saepe veniam.', NULL, NULL, 'baru', '2024-09-06 12:32:03', '2024-09-18 00:26:05'),
	(19, 'ICT-202408-1226906089', 'Kavi Woo', 'woo@gmail.com', NULL, 3, 'Dolor veritatis eos saepe rerum mollitia ducimus eos omnis dolore.', 'Nihil architecto in rerum et amet. Facere doloremque eum repudiandae labore soluta non ipsam. Libero dolor est nihil quae totam consequuntur inventore.', NULL, 3, 'dalam_tindakan', '2024-08-14 06:30:57', '2024-09-18 00:26:05'),
	(20, 'ICT-202407-1597789797', 'Ambiga Bhupalan', 'bhupalan@gmail.com', NULL, 1, 'Hic iure ad praesentium eum eaque sed deserunt eaque.', 'Molestiae magnam consequatur voluptas possimus molestias occaecati dolores. Quod eos et dolores quod. Id dolores earum minus corrupti nihil. Laborum culpa illum dolor rerum doloremque.', NULL, 6, 'selesai', '2024-07-27 13:34:11', '2024-09-18 00:26:05'),
	(21, 'ICT-202407-1163286889', 'Sutheaswari Chong', 'chong@yahoo.com', NULL, 4, 'Officiis iure sunt velit libero aut qui.', 'Dolorum incidunt occaecati accusantium autem temporibus a voluptatem consequatur. Sequi nemo quis maiores consequatur perferendis sit. Similique pariatur repellendus dolorem et ullam maxime suscipit.', NULL, 1, 'selesai', '2024-07-09 04:43:27', '2024-09-18 00:26:05'),
	(22, 'ICT-202407-873398716', 'Merican Chiew', 'chiew@yahoo.com', NULL, 2, 'Est voluptatem corporis nobis expedita labore.', 'Commodi aut ut eum eum est itaque. Illum sint distinctio sit. Voluptas distinctio esse quis repellat rem.', NULL, NULL, 'baru', '2024-07-10 14:01:24', '2024-09-18 00:26:05'),
	(23, 'ICT-202407-1564600127', 'Rani Alagaratnam', 'alagaratnam@hotmail.com', NULL, 3, 'Et nesciunt ut fuga quidem deserunt dolorem quibusdam soluta et reprehenderit repellendus maiores excepturi non.', 'Autem illum laudantium rerum quia optio. Dolores ea velit commodi repellendus iusto culpa corporis. Similique ut vitae a nihil. Quia omnis minima reiciendis soluta.', NULL, 4, 'selesai', '2024-07-20 18:29:24', '2024-09-18 00:26:05'),
	(24, 'ICT-202409-268066482', 'Sannatasah Sinnandavar', 'sinnandavar@yahoo.com', NULL, 2, 'Laudantium accusantium eum aut alias amet sit cum sequi inventore ipsa consequatur quos et similique commodi qui fuga aut.', 'In doloremque expedita ut minus. Quidem culpa omnis alias officiis.', NULL, 3, 'selesai', '2024-09-08 09:44:11', '2024-09-18 00:26:05'),
	(25, 'ICT-202406-115769818', 'Safie Fareez', 'fareez@gmail.com', NULL, 1, 'Sequi nulla voluptates quia reprehenderit qui illum sit omnis aut vero nemo.', 'Alias voluptates distinctio alias eaque debitis praesentium. Mollitia alias molestiae totam nobis et doloremque distinctio. Enim nostrum excepturi expedita eligendi saepe sint. Ab ea consequatur voluptatum nihil eum voluptatibus nisi.', NULL, 7, 'dalam_tindakan', '2024-06-19 14:17:21', '2024-09-18 00:26:05'),
	(26, 'ICT-202407-300287477', 'Suaidah Loo', 'loo@yahoo.com', NULL, 5, 'Veritatis officia totam quia numquam quod saepe a nemo doloribus.', 'Ratione quasi magni et nobis. Qui earum nobis est corporis. Doloremque voluptatem cum repellendus aliquam perferendis ut sint nisi. Dicta cupiditate dolorum debitis tempora iure. Nulla enim placeat dolorum error voluptas et eos.', NULL, 4, 'selesai', '2024-07-29 05:21:52', '2024-09-18 00:26:05'),
	(27, 'ICT-202407-130666862', 'Anand Malayalam', 'malayalam@hotmail.com', NULL, 5, 'Aut voluptatem magni consequatur animi consequatur sit amet aut sit quod porro dolores a adipisci nobis et fugit rerum atque enim.', 'Omnis iste et earum. Quasi quia et aliquid distinctio eos. Corrupti id consequatur eum corrupti adipisci. Quos sit similique autem tenetur quis nesciunt provident. Sed eum ut et similique perferendis.', NULL, 7, 'dalam_tindakan', '2024-07-28 21:22:17', '2024-09-18 00:26:05'),
	(28, 'ICT-202409-614017709', 'Kung Chou Fernandes', 'fernandes@yahoo.com', NULL, 4, 'Omnis illum rerum quis architecto est qui.', 'Odio recusandae dolores repellendus in. Adipisci consequuntur voluptatem optio earum et quasi. Explicabo consequatur aut maxime non.', NULL, 5, 'selesai', '2024-09-07 00:33:28', '2024-09-18 00:26:05'),
	(29, 'ICT-202408-418072199', 'Siou Kah Amry', 'amry@gmail.com', NULL, 1, 'Nisi numquam dolorem velit placeat rerum dolores.', 'Veritatis quisquam eligendi temporibus voluptas. Veritatis natus placeat omnis repellat fugit voluptate nesciunt. Commodi deleniti occaecati sint asperiores aliquam et. Quas ratione rerum quas est debitis et est.', NULL, NULL, 'baru', '2024-08-13 22:07:28', '2024-09-18 00:26:05'),
	(30, 'ICT-202407-403545405', 'Aninafishah Devaser', 'devaser@hotmail.com', NULL, 3, 'Molestiae saepe excepturi vel aut.', 'Facere dolorem velit impedit nulla. Maiores et omnis aut ullam veniam saepe. Dicta numquam assumenda labore suscipit quasi reiciendis.', NULL, NULL, 'baru', '2024-07-02 20:42:11', '2024-09-18 00:26:05'),
	(31, 'ICT-202407-387701730', 'Shafiqa Leow', 'leow@gmail.com', NULL, 3, 'Aliquid voluptatibus soluta quia quia ut est odit.', 'Aliquam explicabo ea qui voluptas cumque tempore sit. Aut soluta perspiciatis autem soluta.', NULL, 3, 'dalam_tindakan', '2024-07-18 18:35:37', '2024-09-18 00:26:05'),
	(32, 'ICT-202408-222936405', 'Dao Gok Nasaruddin', 'nasaruddin@yahoo.com', NULL, 5, 'Reprehenderit beatae voluptatibus repellendus ut et maiores sed ut fugiat omnis quaerat quibusdam.', 'At vitae aliquid iusto quo et. Exercitationem consequatur corporis voluptate et expedita et. Et voluptatum a est ducimus. Sit aliquid aperiam et et nemo in non.', NULL, 3, 'selesai', '2024-08-19 05:16:04', '2024-09-18 00:26:05'),
	(33, 'ICT-202407-861628086', 'Maya Kaliappan', 'kaliappan@hotmail.com', NULL, 3, 'Voluptas iusto doloremque hic molestiae nulla vitae rerum sed dolor eligendi possimus.', 'Autem debitis alias id ex. Libero reiciendis deserunt id autem ipsam facere. Sed dolorem quis dolores nihil pariatur. Nisi sunt quidem tempora in maiores quis est.', NULL, NULL, 'baru', '2024-07-25 14:56:35', '2024-09-18 00:26:05'),
	(34, 'ICT-202408-127210753', 'Ronny Rajakumar', 'rajakumar@yahoo.com', NULL, 4, 'Consequatur ut placeat expedita praesentium mollitia quos est eum corporis.', 'Ipsa fugiat veniam cum ut. Fugit voluptates sed vitae quibusdam numquam eum. Tempora iusto est similique aliquid. Explicabo porro nihil occaecati commodi accusantium.', NULL, 8, 'dalam_tindakan', '2024-07-31 16:39:29', '2024-09-18 00:26:05'),
	(35, 'ICT-202407-1054973281', 'Syahirah Marimuthu', 'marimuthu@yahoo.com', NULL, 4, 'Odit iste hic tempore accusantium et qui asperiores dolorem tempora aliquid expedita tempora adipisci voluptates sit officiis.', 'Non beatae sit beatae possimus expedita eum repudiandae. Illum ut unde cupiditate consequatur ratione est. Dolorem suscipit voluptas accusantium nihil eaque veritatis earum.', NULL, 1, 'dalam_tindakan', '2024-07-23 00:16:05', '2024-09-18 00:26:05'),
	(36, 'ICT-202407-624278946', 'Hasif New', 'new@yahoo.com', NULL, 4, 'Sit totam molestiae ut debitis praesentium voluptates dolor aut.', 'Tempora est perspiciatis qui architecto optio et accusamus. Dolor facere ratione aperiam maxime non.', NULL, 1, 'selesai', '2024-07-20 12:58:31', '2024-09-18 00:26:05'),
	(37, 'ICT-202407-818089922', 'Natalie Sakwati', 'sakwati@hotmail.com', NULL, 1, 'Enim dolores in voluptatem fugit nostrum iusto delectus porro non quia.', 'Sed hic tenetur eaque laborum repudiandae. Sunt suscipit iste sint vero. Autem amet dignissimos earum adipisci officia numquam. Velit praesentium ut est fuga pariatur quia placeat.', NULL, NULL, 'baru', '2024-07-23 16:49:42', '2024-09-18 00:26:05'),
	(38, 'ICT-202408-505625874', 'Anthony An', 'an@yahoo.com', NULL, 5, 'Nihil molestiae magnam magni quis aut.', 'Pariatur eius sit rerum non corrupti. Quaerat est aut velit nemo accusamus rerum.', NULL, 1, 'dalam_tindakan', '2024-08-24 17:50:00', '2024-09-18 00:26:05'),
	(39, 'ICT-202408-357490136', 'Liow Pou Qusyairi', 'qusyairi@yahoo.com', NULL, 1, 'Tenetur iure ut rem fugit illo repellat commodi.', 'Aut quia reiciendis dolores voluptas esse quas qui. Repudiandae veritatis sint nostrum voluptatem est quia non. Beatae quis a in nemo.', NULL, NULL, 'baru', '2024-08-17 11:29:32', '2024-09-18 00:26:05'),
	(40, 'ICT-202407-596786434', 'Syafikah Amzah', 'amzah@yahoo.com', NULL, 3, 'Hic sit cupiditate iste qui sed aliquam.', 'Tempore magni sit assumenda culpa ipsa inventore qui repudiandae. Debitis et eveniet ut aut.', NULL, NULL, 'baru', '2024-07-23 21:37:23', '2024-09-18 00:26:05'),
	(41, 'ICT-202409-1065162308', 'Martin Yam', 'yam@yahoo.com', NULL, 4, 'Repudiandae totam modi ipsa nam tempora sit dolorem voluptas nostrum quia et ducimus ut dolore.', 'Rerum omnis sint ipsum nemo nobis exercitationem aliquid quae. Id aut vel doloribus rerum quod vero voluptatem asperiores. Enim aperiam omnis et. Neque consequatur ut sequi in.', NULL, 8, 'selesai', '2024-09-13 11:17:40', '2024-09-18 00:26:05'),
	(42, 'ICT-202407-1103744498', 'Sivakumar Nga', 'nga@hotmail.com', NULL, 4, 'Ad cupiditate quidem animi non modi quisquam aut voluptatem est eos velit ipsam autem nihil corporis.', 'Totam quis odit vel iure est distinctio. Minus commodi ullam id unde consequatur. Et eos corporis incidunt alias impedit ipsam qui. Quas occaecati aut qui debitis.', NULL, NULL, 'baru', '2024-07-17 10:43:33', '2024-09-18 00:26:05'),
	(43, 'ICT-202407-176877702', 'Soong Jung H\'ng', 'h\'ng@hotmail.com', NULL, 4, 'Accusantium sint ut cupiditate facilis aliquam et est id quas corporis enim consequuntur architecto.', 'Ipsam sunt qui mollitia a odit et. Voluptatem quis ut voluptas veritatis id distinctio quia. Error ratione deleniti qui. Omnis sint est consequatur ad dolores quisquam.', NULL, NULL, 'baru', '2024-07-21 09:35:56', '2024-09-18 00:26:05'),
	(44, 'ICT-202407-799535930', 'Rajagobal Thum', 'thum@hotmail.com', NULL, 1, 'Alias sint eum dolores similique sed numquam repellendus sapiente ut.', 'Dicta natus rem et autem accusamus. Ullam quisquam exercitationem ipsam minus. Maxime quia qui enim animi. Adipisci blanditiis vel delectus iusto.', NULL, 5, 'selesai', '2024-07-20 17:53:29', '2024-09-18 00:26:05'),
	(45, 'ICT-202407-549645494', 'Gunasekaran Balakrishnan', 'balakrishnan@hotmail.com', NULL, 4, 'Eos voluptatem amet impedit accusamus autem dolorum reiciendis voluptatibus explicabo quisquam vitae.', 'Expedita illum debitis velit aliquam. Doloremque dolores ut laboriosam repudiandae voluptatem corrupti sit.', NULL, 1, 'dalam_tindakan', '2024-07-02 13:39:17', '2024-09-18 00:26:05'),
	(46, 'ICT-202407-1067643259', 'Shazlien Faez', 'faez@hotmail.com', NULL, 5, 'Quas ad quidem laboriosam eum tempore dolorem ratione et pariatur recusandae cum aut eos.', 'Enim optio sapiente nulla dolor et. Ut est voluptatibus sapiente inventore. Error voluptatem repellendus reprehenderit cumque nihil repellat eum quos. Assumenda hic voluptatem ut voluptatem nihil. Porro sunt quisquam nisi velit itaque error.', NULL, NULL, 'baru', '2024-07-07 10:23:30', '2024-09-18 00:26:05'),
	(47, 'ICT-202409-1100488254', 'Kor Yuen Chieng', 'chieng@hotmail.com', NULL, 2, 'Et molestiae consequatur tempore voluptatem facilis soluta reprehenderit eveniet earum officia facilis.', 'Eum ut magnam consectetur sed in. Doloribus neque nemo unde at ratione necessitatibus adipisci sapiente. Rem cumque eum neque architecto consequuntur soluta. Officiis dolorum ipsam perferendis vero enim.', NULL, 7, 'dalam_tindakan', '2024-09-01 10:29:27', '2024-09-18 00:26:05'),
	(48, 'ICT-202409-952850664', 'Renuga Nagarajan', 'nagarajan@hotmail.com', NULL, 5, 'Consequatur sed veniam dolor omnis sunt itaque quo odio dolores error culpa rerum.', 'Harum omnis est vel rem quia. Ullam voluptatibus et at totam. Delectus occaecati veritatis temporibus enim minima aut.', NULL, 6, 'selesai', '2024-09-03 14:44:45', '2024-09-18 00:26:05'),
	(49, 'ICT-202408-1139501933', 'Nadira Malayalam', 'malayalam@hotmail.com', NULL, 5, 'Est incidunt et ipsam vel amet eum consequatur architecto omnis.', 'Atque qui provident nihil ipsa. Sint est distinctio impedit a. Et aut et accusantium molestias minus voluptatem quam molestiae.', NULL, 1, 'dalam_tindakan', '2024-08-28 21:11:09', '2024-09-18 00:26:05'),
	(50, 'ICT-202407-273798029', 'Nuranisya Poon', 'poon@gmail.com', NULL, 3, 'Quis expedita omnis odit sit provident accusamus necessitatibus provident quibusdam ea.', 'Aspernatur autem est et hic est sint aut est. Provident beatae quis quos sit est et veritatis. Tempora ad dolorum voluptate voluptatibus magnam quia. Est exercitationem nobis suscipit tempora. Ratione vero facilis hic quas porro sunt.', NULL, NULL, 'baru', '2024-07-03 18:25:56', '2024-09-18 00:26:05'),
	(51, 'ICT-202408-905344468', 'Betty Yusni', 'yusni@yahoo.com', NULL, 4, 'Repellat dolorem dolorem est cupiditate natus porro amet dicta commodi quibusdam at autem saepe pariatur.', 'Et sint culpa optio ullam ut ipsa et impedit. Quia qui eos similique ut et. Nemo quo sed deleniti et.', NULL, 3, 'dalam_tindakan', '2024-08-27 12:23:12', '2024-09-18 00:26:05'),
	(52, 'ICT-202409-353874296', 'Ridhuan Suppiah', 'suppiah@yahoo.com', NULL, 4, 'Magni esse qui quas aut reiciendis et rerum dolore quis.', 'Dicta enim saepe pariatur facilis facilis mollitia voluptatem. Provident est non et sit harum id. Sint voluptas reiciendis beatae beatae eveniet ipsa. Officia sapiente quo sed eum libero laborum sint velit.', NULL, 7, 'dalam_tindakan', '2024-09-11 15:59:12', '2024-09-18 00:26:05'),
	(53, 'ICT-202407-1247928950', 'Ring Wo Hao', 'hao@hotmail.com', NULL, 1, 'Et consectetur magni aperiam non quia quos adipisci nam qui.', 'Molestiae facilis perspiciatis commodi unde nulla repellendus est ipsum. Quo modi quod qui eos accusantium. Nisi doloribus similique consequatur rem.', NULL, 5, 'selesai', '2024-07-19 17:43:50', '2024-09-18 00:26:05'),
	(54, 'ICT-202408-202001413', 'William Aun', 'aun@hotmail.com', NULL, 5, 'Tempore voluptatem et quam sunt dolor recusandae minus qui mollitia reprehenderit quia aut quod aut eligendi voluptatem.', 'Voluptatum quae aut impedit non minima nihil. Aut et nam omnis facere suscipit ut dolorem incidunt. Consequuntur quae praesentium sunt nisi.', NULL, NULL, 'baru', '2024-08-07 06:46:34', '2024-09-18 00:26:05'),
	(55, 'ICT-202408-1035641830', 'Fartinah Moorthy', 'moorthy@gmail.com', NULL, 3, 'Voluptates quam necessitatibus provident accusantium consequatur est est sapiente.', 'Quaerat distinctio nobis est molestiae accusamus. Voluptatem esse ducimus non delectus saepe voluptas. Itaque molestias id eveniet aliquid. Rem voluptatum natus dicta rerum.', NULL, 7, 'dalam_tindakan', '2024-08-01 04:37:08', '2024-09-18 00:26:05'),
	(56, 'ICT-202408-260404262', 'Manickavasagam Yusrin', 'yusrin@yahoo.com', NULL, 5, 'Rerum doloremque animi consequatur ea ut delectus tenetur adipisci necessitatibus.', 'Itaque quos quis totam nobis atque nisi consequatur. Laboriosam in facilis velit fugiat. Et aut quam eligendi hic aut neque rerum quos.', NULL, 2, 'selesai', '2024-08-21 19:21:01', '2024-09-18 00:26:05'),
	(57, 'ICT-202407-52267813', 'Miskan Seah', 'seah@yahoo.com', NULL, 3, 'Corporis est delectus qui illum et dolorum velit quibusdam nisi accusamus est.', 'Ut quos corporis laborum perferendis vero unde. Soluta quo deleniti est. Omnis nesciunt ut molestias aliquid.', NULL, 2, 'selesai', '2024-07-09 01:05:19', '2024-09-18 00:26:05'),
	(58, 'ICT-202406-941042761', 'Sutheaswari Kok', 'kok@hotmail.com', NULL, 4, 'Omnis neque voluptas tempora numquam similique rerum rerum eum delectus quas quae.', 'Nemo qui consequatur debitis cum ut deleniti aliquid. Rerum omnis impedit nihil ea expedita quas est eaque. Et enim quia voluptas non illum molestias. Reprehenderit rem consequatur iusto aut veniam ipsum.', NULL, 5, 'selesai', '2024-06-27 00:07:20', '2024-09-18 00:26:05'),
	(59, 'ICT-202409-1600266322', 'Fun Boo Khoo', 'khoo@yahoo.com', NULL, 1, 'Reprehenderit repellendus harum qui nihil perferendis.', 'Officia quaerat quam tempora rerum veritatis voluptatem placeat neque. Eum quis qui distinctio. Quis quam quisquam id doloremque.', NULL, NULL, 'baru', '2024-09-01 05:44:07', '2024-09-18 00:26:05'),
	(60, 'ICT-202408-514039665', 'Fey Shing Sakwati', 'sakwati@hotmail.com', NULL, 3, 'Aut nihil at delectus velit natus voluptatem tenetur voluptatem in asperiores adipisci quia occaecati odio doloremque doloribus dolorem unde.', 'Rerum molestiae autem numquam porro. Eaque placeat quod soluta repellat consequatur molestiae. Veniam unde aut provident consectetur aspernatur. Pariatur laborum est corrupti consectetur.', NULL, 3, 'dalam_tindakan', '2024-08-15 18:51:36', '2024-09-18 00:26:05'),
	(61, 'ICT-202409-1206027795', 'Fairuz Haikal', 'haikal@yahoo.com', NULL, 1, 'Cum similique hic eos alias ea quis corrupti aliquid inventore.', 'Et deleniti laboriosam dolorum eaque. Totam neque quo aut facilis quis natus. Autem architecto id totam. Non quas sint quo at iusto quibusdam. Expedita a dolorem quas vel.', NULL, 8, 'dalam_tindakan', '2024-09-10 08:15:40', '2024-09-18 00:26:05'),
	(62, 'ICT-202408-829692495', 'Nasiruddin Die', 'die@gmail.com', NULL, 1, 'Ut nostrum voluptas voluptatibus quidem ut eum voluptatem saepe.', 'Qui neque similique dicta. Ratione dolores dolore recusandae illo.', NULL, 1, 'selesai', '2024-08-30 17:27:12', '2024-09-18 00:26:05'),
	(63, 'ICT-202409-606205159', 'Hom Sing Ang', 'ang@gmail.com', NULL, 4, 'Sed laudantium deleniti ducimus natus illo deserunt.', 'Est id soluta eius veniam laudantium. Qui sint sapiente et. Tempora nemo aut explicabo officiis adipisci. Et dicta quam ut expedita qui libero atque. Quos rerum sapiente eos aut.', NULL, NULL, 'baru', '2024-09-11 02:18:09', '2024-09-18 00:26:05'),
	(64, 'ICT-202407-994217267', 'Jimmy Ho', 'ho@yahoo.com', NULL, 2, 'Earum soluta eos dolorum est odio autem dolorem atque perspiciatis dolores voluptas tenetur nisi officiis ab provident et rerum sit amet.', 'Dolores unde facilis blanditiis accusamus aut velit a. Voluptate libero placeat laborum voluptates. Aut quia et quis quis qui repellendus nihil sit. Est esse incidunt adipisci.', NULL, NULL, 'baru', '2024-07-18 05:56:24', '2024-09-18 00:26:05'),
	(65, 'ICT-202406-24776155', 'Hasyim Hiew', 'hiew@gmail.com', NULL, 1, 'Consequuntur et quia iusto nesciunt recusandae officia illo quisquam.', 'Quia est repellendus voluptatibus. Exercitationem fugiat quas enim neque provident harum. Dolor voluptas praesentium corrupti molestiae rerum. Optio et illo consequatur labore et doloremque.', NULL, 5, 'selesai', '2024-06-19 10:07:57', '2024-09-18 00:26:05'),
	(66, 'ICT-202408-672560062', 'Vivasvan King', 'king@gmail.com', NULL, 5, 'Quaerat dolorem quidem quo possimus quidem sunt dolore voluptatem consectetur quia sequi architecto perferendis molestiae dolor ratione.', 'Et eos iusto eaque consequatur non natus. Iusto facere ratione molestiae doloremque autem. Eum repudiandae itaque cumque doloribus neque quibusdam.', NULL, 6, 'dalam_tindakan', '2024-08-02 01:57:43', '2024-09-18 00:26:05'),
	(67, 'ICT-202407-775358885', 'Hao Tea Hazlin', 'hazlin@yahoo.com', NULL, 4, 'Non dolores nihil deleniti consequuntur tempore alias blanditiis maiores accusantium corrupti sint saepe.', 'Voluptatem possimus amet vero sequi voluptas nam. Magnam consequatur quis in. Voluptatibus ullam nam et animi ducimus animi praesentium. Praesentium qui odio voluptatem voluptatem velit est.', NULL, NULL, 'baru', '2024-07-24 04:43:16', '2024-09-18 00:26:05'),
	(68, 'ICT-202407-261051900', 'Amos Veeran', 'veeran@hotmail.com', NULL, 3, 'Aspernatur consequuntur qui illum autem fuga velit quos sapiente.', 'Qui modi numquam expedita quia. Voluptatibus in officia aspernatur reprehenderit libero officiis. Dolorem accusantium officia ut eaque sequi. Et blanditiis modi ad eligendi laudantium modi quo.', NULL, 7, 'selesai', '2024-07-13 23:01:02', '2024-09-18 00:26:05'),
	(69, 'ICT-202407-642002647', 'Marni Ling', 'ling@yahoo.com', NULL, 3, 'Sint rerum libero a aliquid rerum illo quam.', 'Corporis aliquid facere quaerat eius numquam ipsum nisi molestiae. Rerum eos et a iusto ut deserunt ut. Officiis ad accusamus in. Ea reprehenderit sed beatae dolor optio. Facere dolorum et aliquid natus quis sed accusantium.', NULL, NULL, 'baru', '2024-07-24 05:43:54', '2024-09-18 00:26:05'),
	(70, 'ICT-202408-557793874', 'Kia Thu Toh', 'toh@gmail.com', NULL, 2, 'Consequatur animi consectetur aperiam velit dolor placeat accusamus.', 'Architecto laboriosam voluptate ex. Laborum hic quo dolor et doloremque rerum quam. Nihil in suscipit repudiandae maiores.', NULL, 7, 'dalam_tindakan', '2024-08-27 15:27:20', '2024-09-18 00:26:05'),
	(71, 'ICT-202407-111048000', 'Zulkapli An', 'an@gmail.com', NULL, 3, 'Ut quae dolorem nulla vitae reiciendis earum dolorem quis quos tenetur quae ducimus rerum aut cupiditate neque.', 'Omnis enim facilis et quis. Dicta perspiciatis cupiditate quisquam facilis dicta sint sequi. Consequatur ut mollitia vitae cupiditate aut nihil.', NULL, 7, 'dalam_tindakan', '2024-07-17 17:21:25', '2024-09-18 00:26:05'),
	(72, 'ICT-202408-594164978', 'Samantha Suppiah', 'suppiah@gmail.com', NULL, 2, 'Quas eius eaque sint voluptas quam amet accusamus cumque sed et ut aut eveniet omnis.', 'Distinctio perspiciatis ullam et aut ut non. At distinctio officiis eos voluptatem ullam dolorum ut. Fugit rerum enim ullam quo sit. Voluptatem eligendi iure id quo.', NULL, 5, 'dalam_tindakan', '2024-08-06 22:06:29', '2024-09-18 00:26:05'),
	(73, 'ICT-202407-1314265265', 'Asha Fernandes', 'fernandes@gmail.com', NULL, 1, 'Dolore delectus officia quaerat voluptatem sint numquam.', 'Quisquam voluptate fugiat vel dicta sit numquam et. Libero corrupti quam ut dolorum magnam qui. Dolores natus aut dolores ipsam quia quaerat. Perferendis similique facere molestias et excepturi quo. Omnis nemo ipsam cumque optio rerum aut in facere.', NULL, NULL, 'baru', '2024-07-29 20:07:27', '2024-09-18 00:26:05'),
	(74, 'ICT-202407-790177187', 'Anisah Sueib', 'sueib@hotmail.com', NULL, 1, 'Rem est exercitationem sit delectus itaque officia autem et.', 'Ex itaque sed quasi cupiditate officiis aut quae. Asperiores repellendus fuga aspernatur sapiente.', NULL, 5, 'selesai', '2024-07-09 23:07:26', '2024-09-18 00:26:05'),
	(75, 'ICT-202407-1228071334', 'Gobind Azlansyhah', 'azlansyhah@hotmail.com', NULL, 3, 'Laborum quo omnis illum eos cumque est at labore.', 'Dolores pariatur voluptatem ab. Quo et ad commodi quia assumenda et. Odit illo reprehenderit quaerat cum aliquam consectetur placeat inventore. Libero quia voluptatem enim perspiciatis sit.', NULL, 8, 'selesai', '2024-07-09 23:21:30', '2024-09-18 00:26:05'),
	(76, 'ICT-202408-1245678138', 'Shahrazy Ramanathan', 'ramanathan@gmail.com', NULL, 5, 'Nihil officia a quia iste consequatur eos placeat sunt quae quia nihil ad.', 'Repellat praesentium repudiandae placeat consequatur officiis aliquam et. Et hic modi iusto voluptas. Illum totam perferendis culpa sint repudiandae quas atque.', NULL, 5, 'selesai', '2024-08-06 08:29:17', '2024-09-18 00:26:05'),
	(77, 'ICT-202407-599202198', 'Thu Leang Elavarasan', 'elavarasan@gmail.com', NULL, 3, 'Optio fugiat id porro et quam et rerum.', 'Qui consequatur similique nostrum. Est hic dolorem voluptatum id dolorum. Minus repellendus libero suscipit pariatur facere consequatur voluptas. Quos quo quasi ab eos non dolor.', NULL, NULL, 'baru', '2024-07-28 23:23:24', '2024-09-18 00:26:05'),
	(78, 'ICT-202407-376698490', 'Chet Shi Yazid', 'yazid@yahoo.com', NULL, 1, 'Fugiat aspernatur quae ad culpa sint debitis velit aut.', 'Et aperiam esse ea fugiat. Qui molestiae cumque qui est aperiam voluptas. Aperiam mollitia sapiente sit soluta sint. Voluptatibus velit et ut aut hic optio.', NULL, 4, 'dalam_tindakan', '2024-07-10 17:03:15', '2024-09-18 00:26:05'),
	(79, 'ICT-202406-96910003', 'Welson Gnai', 'gnai@hotmail.com', NULL, 3, 'Et sapiente earum voluptas possimus amet labore odio id debitis.', 'Sapiente fugiat molestiae voluptatibus et. Et aut deserunt repudiandae ab commodi qui. Impedit aut in assumenda cumque sed.', NULL, 6, 'selesai', '2024-06-29 08:29:32', '2024-09-18 00:26:05'),
	(80, 'ICT-202407-108926182', 'Ariffin Ku', 'ku@gmail.com', NULL, 1, 'Quasi dolorem impedit consequatur omnis ut sequi ut laudantium sed et vitae provident.', 'Officia delectus atque non provident. Impedit rerum inventore nobis sunt et consequatur eos. Quod libero impedit dicta eos.', NULL, NULL, 'baru', '2024-07-17 01:13:55', '2024-09-18 00:26:05'),
	(81, 'ICT-202407-1626744395', 'Robert Sarim', 'sarim@gmail.com', NULL, 1, 'Est et sed quos dignissimos consequatur recusandae placeat fugit nam libero ut sint exercitationem sed praesentium.', 'Eligendi blanditiis et voluptatem doloribus adipisci itaque. Atque suscipit aut ab non earum. Qui ut illum expedita. Cum nihil unde vel optio quidem dolore.', NULL, 8, 'selesai', '2024-07-16 17:06:20', '2024-09-18 00:26:05'),
	(82, 'ICT-202409-1590324904', 'Nadia Nasaruddin', 'nasaruddin@gmail.com', NULL, 4, 'Corporis omnis ipsa autem eligendi expedita delectus perspiciatis est odit sint soluta necessitatibus molestias.', 'Possimus eum voluptatem tempore dolor. Qui accusantium incidunt cum nemo vel consequatur consequatur.', NULL, NULL, 'baru', '2024-09-14 08:35:54', '2024-09-18 00:26:05'),
	(83, 'ICT-202407-12327929', 'Sherine Arumugam', 'arumugam@yahoo.com', NULL, 1, 'Soluta fugiat enim expedita ea voluptas et similique quia debitis rerum.', 'Omnis fugiat quos aut tenetur recusandae natus doloremque. Consequatur molestias sit molestiae id aperiam enim cumque facilis. Impedit reiciendis non sapiente quibusdam eum ut architecto. Cumque doloribus velit expedita totam natus.', NULL, NULL, 'baru', '2024-07-30 06:32:30', '2024-09-18 00:26:05'),
	(84, 'ICT-202406-285631996', 'Haran Wahidan', 'wahidan@gmail.com', NULL, 4, 'In vel dicta id aliquam et quis laudantium quam dolore voluptatibus assumenda asperiores voluptatem dolores ad aut est.', 'Voluptate nisi amet nisi vel in tempore. Consequuntur facilis tempore minima iusto ab. Aut adipisci voluptatem et nulla. Eveniet non voluptatem vel laboriosam in voluptatibus enim. Est harum aut numquam est nemo nemo.', NULL, NULL, 'baru', '2024-06-21 03:11:19', '2024-09-18 00:26:05'),
	(85, 'ICT-202409-988446083', 'Kuhan Ikhram', 'ikhram@yahoo.com', NULL, 4, 'Omnis ex est aliquam in quae neque sit ipsam hic facilis dolores asperiores quod iusto et ullam magnam optio.', 'Quae dolore hic et. Nihil ratione explicabo odio doloribus culpa consequuntur possimus. Et qui omnis quaerat quam. Atque corrupti tempora dolore quo nam. Eius quam exercitationem et.', NULL, 4, 'selesai', '2024-09-06 17:27:22', '2024-09-18 00:26:05'),
	(86, 'ICT-202409-1213126433', 'Leiu Haw Periasamy', 'periasamy@gmail.com', NULL, 2, 'Voluptatem cum aliquam iste illo facere dolores et voluptates sed suscipit.', 'Culpa quia dolorem in asperiores et repellendus. Voluptatem voluptas odio sequi aspernatur et voluptas distinctio. Sequi qui consectetur sint numquam ducimus minima doloribus eos. Magni atque consectetur rerum voluptas eligendi perspiciatis sed.', NULL, 4, 'dalam_tindakan', '2024-09-10 08:35:31', '2024-09-18 00:26:05'),
	(87, 'ICT-202407-129000826', 'Cham Peng Azrin', 'azrin@yahoo.com', NULL, 1, 'Nostrum nesciunt voluptatem sunt temporibus et nam deleniti voluptate aut sint iusto.', 'Incidunt quidem nobis dignissimos sunt voluptate est. Magni quasi dolores voluptates eveniet. Ratione accusamus recusandae ea autem sed.', NULL, NULL, 'baru', '2024-07-15 11:57:01', '2024-09-18 00:26:05'),
	(88, 'ICT-202407-543966307', 'Bahrul Prakash', 'prakash@gmail.com', NULL, 1, 'Possimus occaecati quis ipsum quibusdam velit odio porro eligendi eligendi voluptas eaque nostrum voluptatibus.', 'Officiis et eum quaerat repudiandae officia ut. Inventore quia repellat aut culpa. Nesciunt eius beatae natus est qui culpa voluptatem. Expedita ut aperiam qui incidunt aut aliquam qui. Voluptate voluptas consequatur veritatis eius.', NULL, 1, 'selesai', '2024-07-12 22:35:31', '2024-09-18 00:26:05'),
	(89, 'ICT-202408-1217082326', 'Fan Jit Singh', 'singh@yahoo.com', NULL, 1, 'Porro nobis labore est perspiciatis ut architecto cum est rerum et.', 'Sed unde et et dolor earum ex. Non quo consectetur minus quod. Modi consequatur iusto enim alias dolores mollitia. Veritatis nihil rerum quam libero.', NULL, 8, 'dalam_tindakan', '2024-08-12 04:05:15', '2024-09-18 00:26:05'),
	(90, 'ICT-202408-1541860282', 'Cindy Gee', 'gee@gmail.com', NULL, 5, 'Voluptatem voluptatibus sint adipisci incidunt consequuntur ducimus voluptatibus.', 'Modi excepturi tenetur at voluptas ut nihil aliquid est. Consectetur consequuntur tenetur sapiente occaecati adipisci officiis illo ut. Officiis magni eos libero reiciendis autem iusto voluptates. Voluptas quia neque nihil minus rem officiis ut.', NULL, NULL, 'baru', '2024-07-31 17:42:11', '2024-09-18 00:26:05'),
	(91, 'ICT-202408-186845366', 'Thian Shuk Shaihuddin', 'shaihuddin@yahoo.com', NULL, 2, 'Ut natus unde odit odit est ipsa nam tenetur voluptatem ipsum sit enim amet aliquid officia.', 'Facere quis nemo dolore aperiam cum nesciunt omnis. Officia beatae velit sit omnis sit. Velit sit et eaque blanditiis explicabo voluptatum harum. Aliquam aperiam eaque et error id ducimus. Deserunt amet deleniti nemo nihil maxime incidunt.', NULL, 5, 'selesai', '2024-08-07 21:24:47', '2024-09-18 00:26:05'),
	(92, 'ICT-202408-1072454662', 'Henry Ban', 'ban@gmail.com', NULL, 5, 'Eos debitis vel provident iure voluptatibus.', 'Odit debitis quam voluptas consequatur. Enim sequi voluptatibus culpa sit esse recusandae. Et sequi praesentium illum velit eum dolor minus.', NULL, 5, 'selesai', '2024-08-31 11:46:44', '2024-09-18 00:26:05'),
	(93, 'ICT-202409-1622042165', 'Frankie Thun', 'thun@gmail.com', NULL, 5, 'Sed autem iusto impedit beatae rem a tempore fugit maiores.', 'Placeat a labore sunt modi. Rem occaecati perferendis neque consequatur. Temporibus facere ipsum sed officia vitae nesciunt.', NULL, 3, 'selesai', '2024-09-13 09:36:13', '2024-09-18 00:26:05'),
	(94, 'ICT-202406-1250247343', 'Jess Sinnandavar', 'sinnandavar@hotmail.com', NULL, 1, 'Nobis quibusdam ipsa dolores fugiat minus in qui fugit quo qui aut maiores consequatur porro totam.', 'Aperiam ratione et labore non aut. Qui laudantium aut voluptas enim optio laborum. Similique dolores quae et fuga accusamus voluptatem.', NULL, 5, 'dalam_tindakan', '2024-06-27 21:24:38', '2024-09-18 00:26:05'),
	(95, 'ICT-202407-341404212', 'Oi Zhen Devaraj', 'devaraj@yahoo.com', NULL, 3, 'Quidem eligendi illum labore eius debitis quis amet aliquam voluptatem nemo.', 'Facere molestiae asperiores autem aut quae veniam. Ad vitae similique repellat sint quia sed maiores. Eum exercitationem omnis nemo illum iste quidem numquam. Rerum et fuga consectetur non ut. Deleniti voluptatem ipsa alias maxime voluptas facilis.', NULL, 7, 'dalam_tindakan', '2024-07-02 17:12:10', '2024-09-18 00:26:05'),
	(96, 'ICT-202406-845876339', 'Krishen Ambumamee', 'ambumamee@yahoo.com', NULL, 5, 'Totam accusantium totam totam accusantium dolores accusantium.', 'Deserunt ut voluptas necessitatibus ad dolorum rerum veniam. Eveniet in earum eveniet. Sunt et beatae architecto similique. Vel hic veritatis quo aut ut veritatis maiores unde.', NULL, 6, 'selesai', '2024-06-18 00:57:06', '2024-09-18 00:26:05'),
	(97, 'ICT-202406-828059332', 'Khairina Ramadass', 'ramadass@yahoo.com', NULL, 2, 'A et et sed expedita in libero eligendi.', 'Tempore eum sunt id iusto voluptate excepturi. Voluptas cupiditate fugit odit fugit porro ullam. Illo nemo ullam perspiciatis est in eveniet delectus.', NULL, 3, 'selesai', '2024-06-28 19:09:58', '2024-09-18 00:26:05'),
	(98, 'ICT-202409-735461899', 'Lun Yee Goh', 'goh@yahoo.com', NULL, 5, 'Ullam aperiam necessitatibus eos omnis consequatur.', 'Aperiam a aut fuga repellendus tempora. Dolor ipsam qui in harum nemo iusto occaecati. Debitis amet est nesciunt dolorem.', NULL, NULL, 'baru', '2024-09-06 07:28:30', '2024-09-18 00:26:05'),
	(99, 'ICT-202406-1177206901', 'Nisrina Samarasan', 'samarasan@yahoo.com', NULL, 5, 'Beatae maiores eveniet ab provident nesciunt accusamus.', 'Molestiae eius quis ut est. Ut pariatur ut quos vel ipsa incidunt. Ut deleniti quia similique provident ipsa.', NULL, NULL, 'baru', '2024-06-19 07:49:20', '2024-09-18 00:26:05'),
	(100, 'ICT-202409-1559935046', 'Sui Chow Aqashah', 'aqashah@hotmail.com', NULL, 4, 'Quia autem sit nihil ea explicabo dicta.', 'Fugiat molestias molestiae est voluptatem. Hic non aspernatur et eos hic voluptatibus quidem. Hic enim harum cumque numquam velit quis optio.', NULL, 3, 'dalam_tindakan', '2024-09-01 12:53:51', '2024-09-18 00:26:05'),
	(101, 'ICT-202407-961982485', 'Yoo Chi Bhullar', 'bhullar@hotmail.com', NULL, 4, 'Quisquam et ipsam quia quaerat qui et quam eos blanditiis.', 'Veritatis aut culpa eum qui vel sint. Quibusdam voluptatum qui rerum sed voluptate atque quam. Similique provident sit porro eos enim rerum non alias. Quisquam distinctio necessitatibus et asperiores voluptas optio quas.', NULL, NULL, 'baru', '2024-07-22 21:35:12', '2024-09-18 15:54:41'),
	(102, 'ICT-202408-857899810', 'Izati Bhupalan', 'bhupalan@hotmail.com', NULL, 4, 'Quos ipsam ut fugit error magni adipisci rerum qui rerum.', 'Asperiores sunt fugiat dolores dolorem. Accusantium ipsum impedit dignissimos officia error vel quaerat. Aut quam corporis perferendis cumque. Omnis corrupti consequatur cum explicabo incidunt.', NULL, 3, 'dalam_tindakan', '2024-08-18 13:17:53', '2024-09-18 15:54:42'),
	(103, 'ICT-202406-7793380', 'Hoon Liao Samsuri', 'samsuri@hotmail.com', NULL, 2, 'Aut quis id qui enim quod porro ut consectetur neque voluptatem error dolores.', 'Cumque odit non cumque aperiam laudantium sit. Ut a libero sed. Quos ut consequatur dolor voluptates accusantium.', NULL, NULL, 'baru', '2024-06-19 20:25:19', '2024-09-18 15:54:42'),
	(104, 'ICT-202408-1075972332', 'Gurmit Jemadin', 'jemadin@hotmail.com', NULL, 2, 'Eius ipsum optio sit voluptas perspiciatis omnis veniam.', 'Ducimus in aut molestiae quam cumque cupiditate quis. Voluptatibus temporibus ut esse tempora et ut. Ex ut ab debitis distinctio.', NULL, NULL, 'baru', '2024-08-18 18:27:36', '2024-09-18 15:54:42'),
	(105, 'ICT-202408-640743940', 'Gobind Chen', 'chen@hotmail.com', NULL, 5, 'Ratione reprehenderit debitis quos laudantium unde aut dolores ducimus dolores odio nobis voluptas aperiam assumenda.', 'Sit voluptatem quis magnam perferendis. Repudiandae hic cumque natus earum culpa voluptas. Sed blanditiis sed possimus et debitis. Eum iste sequi ea aspernatur aut sint numquam.', NULL, 4, 'dalam_tindakan', '2024-08-12 13:14:54', '2024-09-18 15:54:42'),
	(106, 'ICT-202408-1630143457', 'Di Dong Nagappan', 'nagappan@yahoo.com', NULL, 1, 'Aut consequatur rem ab pariatur aperiam dignissimos aliquam necessitatibus quod ut.', 'Iure molestias tenetur deleniti temporibus asperiores aut rerum. Enim est dolores cumque dolore quisquam. Aspernatur aut officiis id quo quo temporibus.', NULL, 1, 'dalam_tindakan', '2024-08-20 09:14:30', '2024-09-18 15:54:42'),
	(107, 'ICT-202407-1372187573', 'Leiu Nan Ngu', 'ngu@hotmail.com', NULL, 1, 'Nobis nisi dignissimos adipisci similique ut eos aspernatur provident.', 'Quis totam rem est. Quae enim maiores at ea reprehenderit ipsum dolorum. Similique temporibus ut fuga dolor sit.', NULL, NULL, 'baru', '2024-07-26 03:52:01', '2024-09-18 15:54:42'),
	(108, 'ICT-202409-691899864', 'Fen Qu En', 'en@gmail.com', NULL, 5, 'Ut magni quis ipsa non et autem cumque quo reprehenderit magnam.', 'Velit soluta eum recusandae in dolor nam. Est aperiam qui qui animi quis eius. Et quo earum maxime illo omnis quis sed. Qui inventore et eum eum voluptate iste non.', NULL, 8, 'dalam_tindakan', '2024-09-02 17:20:45', '2024-09-18 15:54:42'),
	(109, 'ICT-202406-520423579', 'Shanthi Kumari', 'kumari@hotmail.com', NULL, 4, 'Sed a fuga laboriosam dolores amet eos molestias dicta.', 'Aut est sunt at ut architecto. Error vel voluptatem libero quia deserunt perspiciatis. Perferendis quaerat rerum aperiam maxime quam. Accusamus voluptas occaecati rerum voluptatem quia deleniti quasi.', NULL, 8, 'selesai', '2024-06-25 23:17:19', '2024-09-18 15:54:42'),
	(110, 'ICT-202409-857505524', 'Edmund Kar', 'kar@gmail.com', NULL, 3, 'Architecto et esse ex magni nam et distinctio et debitis dignissimos dolorum eos dolorum.', 'Deleniti rerum et perferendis dignissimos. Qui omnis tempora et voluptas et. Excepturi quo inventore beatae quia corporis ducimus quod.', NULL, NULL, 'baru', '2024-09-10 18:42:28', '2024-09-18 15:54:42'),
	(111, 'ICT-202407-962179945', 'Gobalakrishnan Vasudevan', 'vasudevan@yahoo.com', NULL, 4, 'Officia ut quae numquam excepturi modi reprehenderit distinctio maxime aut a commodi quia repellendus.', 'Perferendis corporis ad blanditiis vel similique. Animi laboriosam ut quis vel. Necessitatibus iste perspiciatis qui corporis cupiditate sed.', NULL, 2, 'selesai', '2024-07-23 16:20:20', '2024-09-18 15:54:42'),
	(112, 'ICT-202407-1149288888', 'Mavin Sreenevasan', 'sreenevasan@hotmail.com', NULL, 3, 'Neque in eum ut saepe id numquam illum suscipit delectus nemo officiis dolorum earum.', 'Et quis non quis odio nemo est. Id sed at sint dolorem alias. Expedita fuga et aut asperiores. Magni velit molestias numquam molestiae consequatur dolorum delectus accusamus. Sed error autem id voluptatem qui quaerat.', NULL, NULL, 'baru', '2024-07-18 09:58:36', '2024-09-18 15:54:42'),
	(113, 'ICT-202407-1326414089', 'Addy Sakwati', 'sakwati@hotmail.com', NULL, 1, 'Dolor numquam deserunt qui recusandae quos accusamus.', 'Aliquam quae adipisci quo fuga facilis aut modi. Possimus vel dolore neque quos dolorem beatae. Accusantium sequi qui quia aliquid. Possimus perferendis voluptates non odio exercitationem repudiandae id.', NULL, 3, 'selesai', '2024-07-30 04:50:21', '2024-09-18 15:54:42'),
	(114, 'ICT-202406-1319443240', 'George Sanorhizam', 'sanorhizam@gmail.com', NULL, 2, 'Deleniti non rerum facere optio soluta ea autem ad.', 'Libero esse voluptas et. Omnis aut deleniti eum rerum sed possimus. Doloribus et sint aliquid veniam hic harum in. Sequi eos et quia laudantium.', NULL, 3, 'dalam_tindakan', '2024-06-29 08:48:26', '2024-09-18 15:54:42'),
	(115, 'ICT-202407-497533692', 'Kemat Chelvan', 'chelvan@gmail.com', NULL, 2, 'Quam praesentium nihil fugit autem facere culpa accusantium illum velit nihil aut perferendis.', 'Veritatis culpa non et provident est quis. Culpa veniam voluptatem ipsum velit quibusdam et molestiae. Aliquam alias sint consectetur ipsa ut. Maxime veritatis dignissimos vel aut et velit. Odit illum veniam magni hic.', NULL, 1, 'selesai', '2024-07-13 04:33:32', '2024-09-18 15:54:42'),
	(116, 'ICT-202406-1550980641', 'Rani Ko', 'ko@hotmail.com', NULL, 5, 'Perferendis recusandae occaecati fugiat veritatis accusantium.', 'Sequi accusamus adipisci nisi aut et consequatur. Tempore nesciunt molestiae beatae excepturi earum reiciendis voluptatibus. Praesentium consequatur deserunt qui aspernatur error.', NULL, 7, 'selesai', '2024-06-25 03:17:37', '2024-09-18 15:54:42'),
	(117, 'ICT-202407-756155136', 'Adam Ammasee', 'ammasee@hotmail.com', NULL, 1, 'Quam et magni voluptatem earum ex ea consequuntur modi autem enim.', 'Et sunt vitae cum minus facere porro impedit. Dolorem quos ut pariatur velit vel eos. Hic consequatur animi quisquam rerum alias.', NULL, 5, 'selesai', '2024-07-08 21:00:20', '2024-09-18 15:54:42'),
	(118, 'ICT-202407-1058881739', 'Moo Yoo Sachithanandan', 'sachithanandan@yahoo.com', NULL, 4, 'Earum sint et necessitatibus iusto quae rerum eum deleniti eum tempore velit veritatis voluptas.', 'Accusamus molestiae repellendus id accusamus odio minima beatae qui. Quas eos non unde eos ratione. Asperiores nihil cumque expedita cum. Dolore est nobis omnis eveniet.', NULL, NULL, 'baru', '2024-07-05 07:58:01', '2024-09-18 15:54:42'),
	(119, 'ICT-202407-1405742234', 'Manikavasagam Sukarsek', 'sukarsek@gmail.com', NULL, 4, 'Ut sit modi aut nam numquam quam quo voluptas ut reprehenderit.', 'At consequatur doloribus et fuga aut magni. Molestias facilis dolores libero nemo occaecati. Officiis perferendis nostrum deserunt est.', NULL, 2, 'selesai', '2024-07-12 15:48:29', '2024-09-18 15:54:42'),
	(120, 'ICT-202408-430272966', 'Shuba Thang', 'thang@gmail.com', NULL, 3, 'Veritatis omnis porro possimus non quia est et ut aut facilis dolor.', 'Autem sequi officia dignissimos eaque et quasi. Praesentium fugit illo odit porro enim hic. Et suscipit sequi sint repudiandae nam.', NULL, 1, 'selesai', '2024-08-28 22:20:11', '2024-09-18 15:54:42'),
	(121, 'ICT-202407-223124691', 'Ha Koh Musliman', 'musliman@hotmail.com', NULL, 2, 'Nulla similique ut veniam eum asperiores molestias.', 'Ullam dignissimos consequatur vitae tempora numquam non magnam. Ut repellat non eos autem blanditiis. Aut accusamus animi et magnam praesentium provident in. Omnis qui perferendis aliquid nobis.', NULL, 8, 'selesai', '2024-07-17 20:34:05', '2024-09-18 15:54:42'),
	(122, 'ICT-202407-208299146', 'Ramkarpal Viswalingam', 'viswalingam@yahoo.com', NULL, 3, 'Eum est vel nihil rerum excepturi iure architecto ipsa accusantium sed ut est dolorum voluptate.', 'Fuga eligendi atque at impedit occaecati at. Inventore quis qui minima pariatur velit laboriosam. Cumque similique qui amet odit ullam non possimus.', NULL, NULL, 'baru', '2024-07-25 19:32:59', '2024-09-18 15:54:42'),
	(123, 'ICT-202407-728582878', 'Magendran Kasim', 'kasim@hotmail.com', NULL, 4, 'Consectetur aut doloremque fugit tempore dicta rerum id libero id facere atque.', 'Exercitationem aspernatur nobis aliquid officia libero eos est. Accusamus asperiores quae voluptatum debitis explicabo natus. Quo corporis cupiditate quis porro quo quibusdam. Totam inventore deserunt sed qui qui amet.', NULL, 1, 'selesai', '2024-07-27 23:03:06', '2024-09-18 15:54:42'),
	(124, 'ICT-202409-235996365', 'Mok Thu Ramani', 'ramani@yahoo.com', NULL, 1, 'Quibusdam culpa vero est reprehenderit alias corporis.', 'In consequatur reiciendis id ut labore. Tenetur minus suscipit non non voluptatem facere voluptas. Consequatur tenetur necessitatibus aperiam sint perferendis quis veniam. Sit ab dignissimos recusandae qui repudiandae dolorum labore. Iusto magni dolor officiis et labore.', NULL, NULL, 'baru', '2024-09-08 15:41:53', '2024-09-18 15:54:42'),
	(125, 'ICT-202409-484350684', 'Shuhada Tung', 'tung@yahoo.com', NULL, 2, 'Ut velit officiis est temporibus ullam omnis maxime voluptas dolor unde ea suscipit.', 'Deserunt voluptatem voluptatem culpa. Neque provident et dolor minima maiores temporibus. Et repellat cum commodi error omnis.', NULL, NULL, 'baru', '2024-09-15 20:12:35', '2024-09-18 15:54:42'),
	(126, 'ICT-202409-568668427', 'Sarath Mah', 'mah@yahoo.com', NULL, 4, 'Maxime occaecati earum nesciunt praesentium animi enim reprehenderit consequuntur repellat.', 'Dolores sed ex architecto quia tempora. Neque laborum voluptas eos rerum est aut.', NULL, NULL, 'baru', '2024-09-04 12:03:34', '2024-09-18 15:54:42'),
	(127, 'ICT-202408-1076227698', 'Felixia Mustapha', 'mustapha@hotmail.com', NULL, 4, 'Nam aut omnis quasi aut vero numquam non rem porro voluptas consectetur in libero.', 'Deleniti iure reprehenderit consequatur reiciendis impedit id ullam. Sed iusto nulla optio voluptatem quo. Aliquid cupiditate molestias non sunt sit deleniti amet. Nisi inventore dolore quia sit.', NULL, NULL, 'baru', '2024-08-14 19:21:20', '2024-09-18 15:54:42'),
	(128, 'ICT-202407-1140937691', 'Thur Loh Navaratnam', 'navaratnam@hotmail.com', NULL, 5, 'Quam earum et omnis nam illum.', 'Aliquid aperiam perferendis iusto. Sunt vitae inventore qui non illum dolores. Minus eveniet aspernatur ad consequatur. Ea eum ut sed assumenda ea maiores excepturi amet.', NULL, NULL, 'baru', '2024-07-07 01:02:37', '2024-09-18 15:54:42'),
	(129, 'ICT-202407-169226312', 'Quek Foo Siow', 'siow@hotmail.com', NULL, 5, 'Rerum autem praesentium officia eum eos et vel minus enim consectetur totam.', 'Occaecati rerum veniam perspiciatis ut distinctio blanditiis. Cupiditate aliquid et qui illum ut. Repellat aspernatur molestiae non quis dolor vitae facere suscipit.', NULL, 2, 'selesai', '2024-07-02 11:15:00', '2024-09-18 15:54:42'),
	(130, 'ICT-202407-308593744', 'Karen Sinnathuray', 'sinnathuray@hotmail.com', NULL, 5, 'Est quasi omnis et esse quibusdam similique quis facilis dolorem assumenda impedit alias.', 'Enim dolores labore qui. Sed asperiores quos earum odio. Id quibusdam saepe quam. Aut et vitae sapiente doloribus quo iure id.', NULL, 2, 'selesai', '2024-07-20 09:55:56', '2024-09-18 15:54:42'),
	(131, 'ICT-202406-1499961398', 'Asykin Arifuddin', 'arifuddin@yahoo.com', NULL, 2, 'Enim sit impedit voluptatem esse dolorum aspernatur iure sint.', 'Earum fuga sint rerum itaque ut distinctio optio. Distinctio hic harum aperiam ut aut. Ipsa ea esse porro qui animi placeat.', NULL, 8, 'dalam_tindakan', '2024-06-28 00:04:41', '2024-09-18 15:54:42'),
	(132, 'ICT-202409-882588287', 'Kia Leen Veerathan', 'veerathan@gmail.com', NULL, 1, 'Qui aut maxime suscipit pariatur.', 'Labore nihil rerum et in qui est mollitia. Fugit error aut tenetur. Non iusto quasi eaque.', NULL, 8, 'selesai', '2024-09-13 14:51:33', '2024-09-18 15:54:42'),
	(133, 'ICT-202408-1530784718', 'Theo Sit Kua', 'kua@yahoo.com', NULL, 3, 'Dolores adipisci temporibus repellat nihil quia culpa reprehenderit sequi modi numquam unde.', 'Voluptatem possimus aut consectetur ut cupiditate ipsum. Et ullam laudantium nisi laborum quia earum. Ut voluptas facilis sed aut ut dolorem quia similique. Ullam qui iste voluptatem qui incidunt qui nulla non.', NULL, 6, 'selesai', '2024-08-17 08:43:40', '2024-09-18 15:54:42'),
	(134, 'ICT-202408-463428310', 'Hana Chin', 'chin@hotmail.com', NULL, 5, 'Officiis voluptas omnis ipsum minus impedit molestias dolorem.', 'Odit aut error sapiente modi illum quod voluptatem. Et odit aut itaque quia. Unde qui exercitationem eius qui similique facilis nostrum. Debitis enim vero porro sint eos blanditiis.', NULL, 7, 'selesai', '2024-08-07 07:09:26', '2024-09-18 15:54:42'),
	(135, 'ICT-202407-988560512', 'Kei Nik Naidu', 'naidu@yahoo.com', NULL, 1, 'Sit et ea aspernatur beatae totam et perspiciatis qui tempora.', 'Consectetur accusantium placeat quia qui nulla voluptates. Aut quod ullam unde aspernatur consequuntur dignissimos. Est dolorum nobis sit non voluptatem doloribus excepturi excepturi. Ut harum fugit qui officiis dolorem excepturi nemo.', NULL, NULL, 'baru', '2024-07-01 22:44:49', '2024-09-18 15:54:42'),
	(136, 'ICT-202407-435845667', 'George Hanief', 'hanief@gmail.com', NULL, 2, 'Tempora et reiciendis rerum nesciunt beatae eos omnis rerum voluptas sunt eaque libero molestias exercitationem et.', 'Repudiandae iusto laudantium ut et perferendis et. Ipsa voluptas sed expedita fugit labore molestiae. Nostrum rerum illum aliquam occaecati veniam.', NULL, NULL, 'baru', '2024-07-03 23:19:23', '2024-09-18 15:54:42'),
	(137, 'ICT-202408-1193701294', 'Miu Khoi Qayyum', 'qayyum@hotmail.com', NULL, 5, 'Dolor aliquam eum aut omnis et vel eum ea veritatis id quisquam et.', 'Itaque in vel quo quibusdam quia non. Excepturi consequatur corrupti illum sit.', NULL, 3, 'dalam_tindakan', '2024-08-10 00:26:54', '2024-09-18 15:54:42'),
	(138, 'ICT-202409-174852726', 'Serbegeth Jayaram', 'jayaram@yahoo.com', NULL, 1, 'Aut eveniet aspernatur neque est eveniet fuga consequatur veritatis sed qui ex expedita suscipit quia in velit odio rerum.', 'Quia dolor dolores aut quis. Perspiciatis impedit ad hic soluta architecto perspiciatis. Qui assumenda minus officia eius dolorem aut dolorem. Veritatis aliquam sit quisquam excepturi quae ipsa iusto.', NULL, 3, 'selesai', '2024-09-16 12:19:37', '2024-09-18 15:54:42'),
	(139, 'ICT-202409-1499751417', 'Yi Pom Aun', 'aun@hotmail.com', NULL, 4, 'Consequatur omnis officia perspiciatis est sit quo autem.', 'Culpa odit omnis ea quia. Qui nobis a nam est. Error doloremque ut aut repellat.', NULL, NULL, 'baru', '2024-09-15 00:20:42', '2024-09-18 15:54:42'),
	(140, 'ICT-202408-1186665356', 'James Teoh', 'teoh@gmail.com', NULL, 5, 'Incidunt occaecati quisquam quisquam dignissimos eaque provident quos sunt distinctio enim.', 'Dolorum ducimus dicta rem enim. Dolor dolor pariatur aliquam quia similique ex velit quisquam. Consequatur enim sint voluptas quibusdam minima libero excepturi provident. Et sint pariatur voluptates temporibus necessitatibus.', NULL, NULL, 'baru', '2024-08-14 14:17:11', '2024-09-18 15:54:42'),
	(141, 'ICT-202408-1091170840', 'Shanti Zawi', 'zawi@gmail.com', NULL, 4, 'Quia dolorum porro quaerat magnam ipsa libero voluptate nam quia nemo architecto natus ipsam culpa natus minima dolores.', 'Possimus sed nisi esse corrupti consequatur asperiores explicabo. Aut itaque inventore iusto eligendi exercitationem. Incidunt aut aut excepturi velit.', NULL, 5, 'dalam_tindakan', '2024-08-11 21:34:32', '2024-09-18 15:54:42'),
	(142, 'ICT-202408-210778537', 'Aaron Surendran', 'surendran@gmail.com', NULL, 3, 'Nam qui consequuntur laborum ea sit corporis mollitia recusandae sint hic ad eligendi voluptatum autem ex et ratione facere architecto.', 'Odio distinctio voluptatem voluptates corrupti. Ducimus ullam repellat tempore est voluptate minus. Eum vero nesciunt eum enim accusamus voluptatem. Harum quo et enim dolores.', NULL, 6, 'dalam_tindakan', '2024-08-06 21:00:35', '2024-09-18 15:54:42'),
	(143, 'ICT-202409-1304732906', 'Hoong Zed Mudukasan', 'mudukasan@gmail.com', NULL, 2, 'Sapiente molestiae veniam accusamus quo impedit rerum cumque accusantium cupiditate voluptas voluptatem magni.', 'Sit recusandae est saepe laborum et. Tempore explicabo tenetur ut corporis aut consequatur molestiae. Voluptas omnis enim accusamus sunt id.', NULL, NULL, 'baru', '2024-09-01 15:12:06', '2024-09-18 15:54:42'),
	(144, 'ICT-202409-647686017', 'Nuwair Vethamuthu', 'vethamuthu@yahoo.com', NULL, 4, 'Et sunt rem quis odio sunt nemo cumque deleniti et incidunt illum rem asperiores cupiditate.', 'Dolores sed quibusdam inventore reprehenderit. Dolor autem cupiditate atque voluptatibus praesentium hic nihil. Rerum ut veritatis facere repudiandae tenetur sunt et. Qui quas velit laboriosam id.', NULL, NULL, 'baru', '2024-09-05 19:05:22', '2024-09-18 15:54:42'),
	(145, 'ICT-202409-694524178', 'Nabilah Sandrakasi', 'sandrakasi@yahoo.com', NULL, 2, 'Et quam eos velit nihil molestiae vel aut consequatur.', 'Sed in enim et eos ipsa in. Culpa deleniti fugit ipsum rerum. Hic inventore aliquid maxime impedit ducimus aut. Id nihil iste asperiores modi dolorum voluptatem.', NULL, 1, 'selesai', '2024-09-02 18:48:23', '2024-09-18 15:54:42'),
	(146, 'ICT-202407-1440426886', 'Aliffatus Sinnathamby', 'sinnathamby@gmail.com', NULL, 2, 'Omnis consequatur est sit illum in quia eligendi qui et recusandae eligendi et ea est quia id rerum qui harum aut.', 'Hic quia ipsum dolorem laudantium fuga aut provident repellat. Sit et labore et est. Voluptatem velit sunt architecto praesentium. Rerum dolore temporibus qui suscipit modi non.', NULL, 4, 'selesai', '2024-07-03 06:17:11', '2024-09-18 15:54:42'),
	(147, 'ICT-202407-1305006116', 'Swarna Munisamy', 'munisamy@gmail.com', NULL, 4, 'Placeat debitis enim pariatur pariatur est voluptatum magnam odit.', 'Qui voluptatum qui labore expedita natus. Magnam aut dolor velit aperiam. Molestias cum autem nihil ea consequuntur dignissimos porro. Aspernatur sed pariatur quae commodi officiis.', NULL, 5, 'selesai', '2024-07-03 19:25:28', '2024-09-18 15:54:42'),
	(148, 'ICT-202408-1046645215', 'Tong Tik Thalalla', 'thalalla@gmail.com', NULL, 3, 'Aut nemo corporis excepturi aut vitae mollitia quasi.', 'Ipsam quo saepe possimus possimus voluptate consequuntur harum molestias. Quod perspiciatis fugiat repudiandae est quo sed architecto consequatur. Aut id corrupti optio. Ea aut beatae omnis necessitatibus nulla.', NULL, 4, 'selesai', '2024-08-12 07:46:17', '2024-09-18 15:54:42'),
	(149, 'ICT-202407-1332592123', 'Basri Aminnudin', 'aminnudin@yahoo.com', NULL, 5, 'Quia quae ipsum laboriosam laborum accusamus quos dolorem sit.', 'Veniam dolorem nam a voluptates optio et aperiam consequatur. Quidem aut placeat dolor nihil harum velit natus et. Vitae assumenda et et nulla aut voluptas totam.', NULL, NULL, 'baru', '2024-07-24 07:38:01', '2024-09-18 15:54:42'),
	(150, 'ICT-202408-715051109', 'Prema Yow', 'yow@gmail.com', NULL, 4, 'Aut et in qui exercitationem ea et praesentium commodi perspiciatis dicta.', 'Iusto eos quia nostrum deleniti ratione. Voluptatem nihil corporis atque dolores neque. Deserunt ut aut iste dolorem. Dolores natus voluptatem explicabo esse quia omnis repellendus voluptatibus.', NULL, 2, 'selesai', '2024-08-06 10:28:17', '2024-09-18 15:54:42');

-- Dumping structure for table emb.complaint_logs
CREATE TABLE IF NOT EXISTS `complaint_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `complaint_id` bigint unsigned NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaint_logs_complaint_id_foreign` (`complaint_id`),
  CONSTRAINT `complaint_logs_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.complaint_logs: ~0 rows (approximately)

-- Dumping structure for table emb.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.departments: ~0 rows (approximately)

-- Dumping structure for table emb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table emb.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.jobs: ~0 rows (approximately)

-- Dumping structure for table emb.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.job_batches: ~0 rows (approximately)

-- Dumping structure for table emb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_04_03_101520_create_permission_tables', 1),
	(5, '2024_04_03_101620_create_audits_table', 1),
	(6, '2024_04_03_102020_create_departments_table', 1),
	(7, '2024_07_30_090241_create_categories_table', 1),
	(8, '2024_07_30_111444_create_sub_categories_table', 1),
	(9, '2024_07_30_131918_create_complaints_table', 1),
	(10, '2024_07_30_131945_create_complaint_logs_table', 1),
	(11, '2024_07_30_153545_add_ticket_no_to_complaints_table', 1),
	(12, '2024_09_17_022815_add_lampiran_to_complaints_table', 1);

-- Dumping structure for table emb.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table emb.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.model_has_roles: ~0 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(3, 'App\\Models\\User', 3),
	(3, 'App\\Models\\User', 4),
	(3, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7),
	(3, 'App\\Models\\User', 8);

-- Dumping structure for table emb.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table emb.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.permissions: ~0 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'access roles', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(2, 'add role', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(3, 'edit role', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(4, 'delete role', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(5, 'access permissions', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(6, 'add permission', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(7, 'edit permission', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(8, 'delete permission', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(9, 'access users', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(10, 'add user', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(11, 'edit user', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(12, 'delete user', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(13, 'access departments', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(14, 'add department', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(15, 'edit department', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(16, 'delete department', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(17, 'access categories', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(18, 'add category', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(19, 'edit category', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(20, 'delete category', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(21, 'access subcategories', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(22, 'add subcategory', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(23, 'edit subcategory', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(24, 'delete subcategory', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(25, 'urus aduan', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(26, 'agih aduan', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(27, 'kemaskini tindakan', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26');

-- Dumping structure for table emb.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.roles: ~3 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'administrator', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(2, 'Pentadbir Aduan', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26'),
	(3, 'Pegawai Aduan', 'web', '2024-09-18 00:08:26', '2024-09-18 00:08:26');

-- Dumping structure for table emb.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.role_has_permissions: ~0 rows (approximately)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(17, 2),
	(18, 2),
	(19, 2),
	(20, 2),
	(21, 2),
	(22, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(26, 2),
	(27, 3);

-- Dumping structure for table emb.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.sessions: ~0 rows (approximately)

-- Dumping structure for table emb.sub_categories
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.sub_categories: ~5 rows (approximately)
INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'Desktop PC', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL),
	(2, 1, 'Laptop', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL),
	(3, 1, 'Printer', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL),
	(4, 2, 'Email', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL),
	(5, 2, 'Microsoft Office', '2024-09-18 00:08:26', '2024-09-18 00:08:26', NULL);

-- Dumping structure for table emb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table emb.users: ~8 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Pentadbir Sistem', 'admin@spa.my', '2024-09-18 00:08:26', '$2y$12$CfhEF7v3TT7PyYiAAG/diOHL1gxtB96ja1hkh/KigYg9i/Lf0Bq.u', NULL, 'hENo2lbeeg', '2024-09-18 00:08:27', '2024-09-18 00:08:27'),
	(2, 'Carey Shee Loong Hew', 'pentadbir@spa.my', '2024-09-18 00:08:27', '$2y$12$Jvs4vvyr1sU98vKDgjFCQuvepPhCCE3S8eN0IQuSkoXRVYB678BZy', NULL, 'nKJCeLVbbk', '2024-09-18 00:08:27', '2024-09-18 00:08:27'),
	(3, 'Tang Thien Siak', 'pegawai@spa.my', '2024-09-18 00:08:27', '$2y$12$O7Qq6Hxaa1tjr0/ol9/nDeiBa0TaWF.j1XF2e/DCJ9QI4FVWd8G9W', NULL, 'yrnuBbPLhj', '2024-09-18 00:08:27', '2024-09-18 00:08:27'),
	(4, 'Rosalee Mayer', 'mayer@spa.my', '2024-09-18 00:09:07', '$2y$12$n7K7/ynblyURk1CLxTGsQO8MTRKuNNPCXSDUb9ZOsT2LY8O1Ol7q.', NULL, 'UqEP8xbL0G', '2024-09-18 00:09:07', '2024-09-18 00:09:07'),
	(5, 'Ryan Ward', 'ward@spa.my', '2024-09-18 00:09:07', '$2y$12$m2OuVORsiDjDf9zMMWtXBeEzANTTFR9HDHl1lyJB3SG5A.O/hlj7.', NULL, 'NTOhwoxRtm', '2024-09-18 00:09:07', '2024-09-18 00:09:07'),
	(6, 'Bulah Tromp', 'tromp@spa.my', '2024-09-18 00:09:07', '$2y$12$c2H0SrkLs2bKqcaYo4KYd.VPDKN1m6f9mkSa4X9Wh3eqmEwOTs17C', NULL, 'Ja9vUr6YFN', '2024-09-18 00:09:08', '2024-09-18 00:09:08'),
	(7, 'Leda Towne', 'towne@spa.my', '2024-09-18 00:09:08', '$2y$12$SX5jG4KpzbrKPK.QYVtDJ.pCG9LHeldeM1KDluKHi.fLFKzB6jB0q', NULL, 'Tfp0jWhJ52', '2024-09-18 00:09:08', '2024-09-18 00:09:08'),
	(8, 'Terrence Kreiger', 'kreiger@spa.my', '2024-09-18 00:09:08', '$2y$12$a11inkmKkY0SyMqcKKc4/OOqlzDMdpNLD2mouIZSelwbI8yAvIKY6', NULL, 'wLxtMaTTvO', '2024-09-18 00:09:08', '2024-09-18 00:09:08');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
