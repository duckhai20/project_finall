-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 06, 2025 at 10:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plastic`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` tinyint(4) DEFAULT 0,
  `Status` tinyint(4) DEFAULT 1,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountID`, `Username`, `Email`, `Password`, `Role`, `Status`, `CreatedAt`) VALUES
(5, 'khaiiphuongg', 'khaiiphuongg@gmail.com', '$2y$12$QCAXnhQsyXk7mmjRvTMHx.rWKKNNnZsdpmsLKyNC/ZIOPzBsUizye', 1, 1, '2025-11-26 07:26:55'),
(6, 'duydo2602', 'duydo@gmail.com', '$2y$12$HzpJ0BPClLVAz02Et/jnRuOUeTOw0lRDNHT.DtdoUkVcgqMySjnEm', 0, 1, '2025-11-26 15:13:38'),
(8, 'user1', 'user1@gmail.com', '$2y$12$PnCU5IhUQZ3OVAJhF5TUHuG5ndMg3muflpsrvrQNMYg2wdvrGhRsC', 0, 1, '2025-12-04 13:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `BlogID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Author` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`BlogID`, `Title`, `Content`, `Image`, `Author`, `created_at`, `updated_at`) VALUES
(1, 'Differences between PET, PP and PC plastics', '<h2 style=\"color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px;\">Detailed analysis of the 3 most common types of plastic today</h2>\r\n\r\n<p style=\"font-size: 16px; line-height: 1.6; color: #34495e;\">In the world of plastic packaging, there are three \"big players\" dominating the market: <strong style=\"color: #e74c3c;\">PET</strong>, <strong style=\"color: #f39c12;\">PP</strong> and <strong style=\"color: #3498db;\">PC</strong>. Each type has unique characteristics, suitable for different applications.</p>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #3498db;\">\r\n    <h3 style=\"color: #2c3e50; margin-top: 0;\">🎯 PET - Polyethylene Terephthalate</h3>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Key features:</span> High transparency, good gas barrier properties, lightweight, reasonable price.</p>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Main applications:</span> Mineral water bottles (500ml, 1L, 1.5L, 2L), carbonated beverage bottles, cooking oil bottles, food packaging.</p>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Limitations:</span> Poor heat resistance (only 70-85°C), should not be reused multiple times.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #fff8e1; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #f39c12;\">\r\n    <h3 style=\"color: #e65100; margin-top: 0;\">🔥 PP - Polypropylene</h3>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Outstanding advantages:</span> High heat resistance (up to 130°C), BPA-free, absolutely safe for food.</p>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Application areas:</span> Microwave-safe food containers, shampoo bottles, shower gel, dish soap, kitchenware.</p>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Transparency:</span> Lower than PET, usually milky white or translucent.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #e3f2fd; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2196f3;\">\r\n    <h3 style=\"color: #1565c0; margin-top: 0;\">💎 PC - Polycarbonate</h3>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Special properties:</span> Glass-like transparency, high mechanical strength, good impact resistance, hard to break.</p>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Usage scope:</span> High-end sports water bottles, thermal bottles, baby bottles, medical equipment, bulletproof glass.</p>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Disadvantages:</span> High price, some types may contain BPA if not properly processed.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #7b1fa2; font-style: italic;\">📊 Quick comparison table</h3>\r\n<table style=\"width: 100%; border-collapse: collapse; margin: 15px 0;\">\r\n    <tr style=\"background-color: #7b1fa2; color: white;\">\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">Criteria</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PET</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PP</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PC</th>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Transparency</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">High</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Low/Medium</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">Very High</td>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Heat resistance (°C)</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">70-85</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Up to 130</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">-100 to 135</td>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Price</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">Low</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Medium</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">High</td>\r\n    </tr>\r\n</table>\r\n\r\n<p style=\"font-size: 15px; color: #555; font-style: italic; background-color: #f5f5f5; padding: 15px; border-radius: 5px;\">\r\n    💡 <strong>Selection advice:</strong> If you need single-use water bottles - choose PET. If you need microwave-safe food containers - PP is the best choice. For premium products requiring durability and transparency - PC is the ideal material.\r\n</p>', '/img/blog/plastic-types.jpg', 'Expert Nguyen Van A', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(2, 'Applications of PET plastic in bottle production', '<h2 style=\"color: #1b5e20; border-bottom: 2px solid #43a047; padding-bottom: 10px;\">PET - Irreplaceable material in the packaging industry</h2>\r\n\r\n<p style=\"font-size: 17px; color: #2e7d32; font-weight: 500;\">Since its invention in the 1940s, PET plastic has completely revolutionized the global packaging industry. With outstanding properties, PET accounts for <span style=\"color: #d32f2f; font-weight: bold;\">60%</span> of the plastic bottle production market share worldwide.</p>\r\n\r\n<h3 style=\"color: #0d47a1; background-color: #bbdefb; padding: 10px; border-radius: 5px;\">🌟 Golden advantages of PET</h3>\r\n<ul style=\"color: #37474f; line-height: 1.7;\">\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Optimal transparency:</span> Reaches 90-92%, allowing clear view of the product inside, enhancing aesthetics and consumer trust.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Superior gas barrier:</span> Minimizes oxygen and CO₂ intrusion, protecting beverage quality, especially important for carbonated soft drinks.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Ultra-lightweight:</span> A 500ml PET bottle weighs only about 10-12g, while a glass bottle of the same capacity weighs up to 300-400g.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">100% recyclability:</span> PET can be completely recycled into new products, reducing environmental impact.</li>\r\n</ul>\r\n\r\n<h3 style=\"color: #00695c; background-color: #b2dfdb; padding: 10px; border-radius: 5px;\">🏭 Specific applications of PET</h3>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">1. Mineral and purified water bottles</h4>\r\n<p style=\"color: #455a64;\">This is the most common application of PET. Common capacities include: 330ml (small bottle), 500ml (most common), 1L, 1.5L and 2L (family bottle). Hundreds of billions of PET water bottles are produced globally each year.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">2. Carbonated soft drink bottles</h4>\r\n<p style=\"color: #455a64;\">PET can withstand CO₂ gas pressure up to 4-5 bar, ensuring rigidity and durability when containing carbonated beverages. Specifically, PET does not deform under pressure like some other types of plastic.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">3. Cooking oil bottles</h4>\r\n<p style=\"color: #455a64;\">PET\'s good oxygen barrier helps protect cooking oil from oxidation, maintaining quality and flavor. Cooking oil bottle design usually has a handle and convenient pouring spout.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">4. Cosmetics and pharmaceutical packaging</h4>\r\n<p style=\"color: #455a64;\">PET is used for perfume bottles, lotion, moisturizer, and some liquid medicines due to its chemical inertness and non-interaction with product ingredients.</p>\r\n\r\n<div style=\"background-color: #e8eaf6; padding: 15px; border-radius: 6px; margin: 20px 0;\">\r\n    <h4 style=\"color: #303f9f; margin-top: 0;\">📈 Development trends of PET</h4>\r\n    <p style=\"color: #3f51b5;\">PET production technology is constantly improving. Modern production lines can produce up to <span style=\"font-weight: bold; color: #d32f2f;\">20,000 bottles/hour</span> with high precision. Bio-PET is also being researched and developed, using renewable raw materials instead of petroleum.</p>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #424242; background-color: #f5f5f5; padding: 12px; border-radius: 4px; border-left: 4px solid #ff9800;\">\r\n    🚀 <strong>Future of PET:</strong> Despite facing environmental challenges, PET will still be the dominant material in the packaging industry due to its economy, high efficiency and increasingly improved recyclability.\r\n</p>', '/img/blog/pet-applications.jpg', 'Engineer Tran Thi B', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(3, 'Why choose PP plastic bottles for food?', '<h2 style=\"color: #e65100; border-bottom: 2px solid #ff9800; padding-bottom: 10px;\">PP - Smart choice for food safety</h2>\r\n\r\n<div style=\"background-color: #fff3e0; padding: 15px; border-radius: 6px; border: 1px solid #ffb74d; margin-bottom: 20px;\">\r\n    <h3 style=\"color: #ef6c00; margin-top: 0;\">⚠️ Food safety issues</h3>\r\n    <p style=\"color: #5d4037;\">In the context of increasing concerns about toxic chemicals from plastics (such as BPA, phthalates), choosing safe food storage materials has become more important than ever. PP (Polypropylene) emerges as an optimal solution.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #f57c00; background-color: #ffecb3; padding: 12px; border-radius: 5px;\">✅ 7 convincing reasons to choose PP for food</h3>\r\n\r\n<div style=\"background-color: #fff8e1; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #ff8f00; margin-top: 0;\">1. NO BPA - Absolutely safe</h4>\r\n    <p style=\"color: #5d4037;\">BPA (Bisphenol A) is an industrial chemical that can cause endocrine disruption, affecting reproductive health and development. PP is completely BPA-free, certified safe by FDA (US) and EFSA (Europe) for all ages, including newborns and pregnant women.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #f1f8e9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #689f38; margin-top: 0;\">2. HIGH HEAT RESISTANCE - Microwave safe</h4>\r\n    <p style=\"color: #33691e;\">PP can withstand temperatures up to <span style=\"font-weight: bold; color: #d32f2f;\">130°C</span>, allowing food to be heated directly in the container using a microwave without worrying about plastic deformation or release of toxins. This is a superior advantage over PET (only withstands 70-85°C).</p>\r\n</div>\r\n\r\n<div style=\"background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #388e3c; margin-top: 0;\">3. GOOD CHEMICAL STABILITY - Not corroded</h4>\r\n    <p style=\"color: #1b5e20;\">PP can resist most acids, bases, oils and common detergents. This ensures the container does not change properties when containing acidic foods (such as tomato sauce, pickles) or oily foods.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #5d4037; background-color: #d7ccc8; padding: 10px; border-radius: 5px;\">🍱 Practical applications of PP in daily life</h3>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Office lunch boxes:</span> Multi-compartment design, can be heated directly in microwave, airtight lid keeps food fresh.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Baby bottles:</span> Safe for newborns, easy to clean, can be sterilized with boiling water or specialized sterilizer.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Food storage containers:</span> Airtight, moisture-proof, helps preserve food in the refrigerator longer, prevents odor absorption.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Kitchen utensils:</span> Cutting boards, spoons, ladles, sieves... can all be made from safe PP.</p>\r\n\r\n<div style=\"background-color: #fce4ec; padding: 15px; border-radius: 6px; margin: 20px 0;\">\r\n    <h4 style=\"color: #ad1457; margin-top: 0;\">💡 Guide to proper PP usage</h4>\r\n    <p style=\"color: #880e4f;\"><span style=\"font-weight: bold;\">Should do:</span> Wash with warm water and neutral soap, dry completely before closing lid, check plastic symbol (number 5 in recycling triangle) before buying.</p>\r\n    <p style=\"color: #880e4f;\"><span style=\"font-weight: bold;\">Should not:</span> Use when cracked or deeply scratched, put in conventional oven (only use with microwave), store overly hot food (above 130°C).</p>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #37474f; background-color: #eceff1; padding: 15px; border-radius: 5px; font-style: italic;\">\r\n    🌟 <strong>Conclusion:</strong> PP is not only safe but also convenient and economical. With high heat resistance, BPA-free and reasonable price, PP is definitely the top choice for food storage products in every household.\r\n</p>', '/img/blog/pp-food-safe.jpg', 'Expert Le Van C', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(4, 'PC plastic and industrial applications', '<h2 style=\"color: #0d47a1; border-bottom: 2px solid #1976d2; padding-bottom: 10px;\">Polycarbonate - Material of technological breakthrough</h2>\r\n\r\n<p style=\"font-size: 17px; color: #1565c0; font-weight: 500; background-color: #e3f2fd; padding: 15px; border-radius: 5px;\">PC (Polycarbonate) is not just an ordinary plastic - it is a high-tech polymer with outstanding properties, worthy of being called <span style=\"color: #d32f2f; font-weight: bold;\">\"organic glass\"</span> or <span style=\"color: #d32f2f; font-weight: bold;\">\"transparent metal\"</span>.</p>\r\n\r\n<h3 style=\"color: #01579b; background: linear-gradient(to right, #bbdefb, #e3f2fd); padding: 12px; border-radius: 5px;\">💎 Special properties of Polycarbonate</h3>\r\n\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 15px; margin: 20px 0;\">\r\n    <div style=\"flex: 1; min-width: 250px; background-color: #e1f5fe; padding: 15px; border-radius: 5px; border: 1px solid #4fc3f7;\">\r\n        <h4 style=\"color: #0277bd; margin-top: 0;\">🔍 Ultra-high transparency</h4>\r\n        <p style=\"color: #01579b;\">PC has a transparency of 89-91%, almost equivalent to glass (92%). This allows creating products with clarity and gloss, highlighting the product inside.</p>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 250px; background-color: #f3e5f5; padding: 15px; border-radius: 5px; border: 1px solid #ba68c8;\">\r\n        <h4 style=\"color: #6a1b9a; margin-top: 0;\">💪 Impressive mechanical strength</h4>\r\n        <p style=\"color: #4a148c;\">PC has an impact strength <span style=\"font-weight: bold; color: #d32f2f;\">250 times</span> higher than ordinary glass and 30 times higher than acrylic. A 3mm thick PC sheet can withstand a bullet from a pistol.</p>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 250px; background-color: #e8f5e9; padding: 15px; border-radius: 5px; border: 1px solid #81c784;\">\r\n        <h4 style=\"color: #2e7d32; margin-top: 0;\">🌡️ Wide temperature range</h4>\r\n        <p style=\"color: #1b5e20;\">PC operates stably in a temperature range from <span style=\"font-weight: bold; color: #d32f2f;\">-100°C to 135°C</span>, allowing use in both extremely cold and high-temperature environments.</p>\r\n    </div>\r\n</div>\r\n\r\n<h3 style=\"color: #004d40; background-color: #b2dfdb; padding: 12px; border-radius: 5px;\">🏭 Diverse industrial applications of PC</h3>\r\n\r\n<h4 style=\"color: #00796b; border-left: 4px solid #00796b; padding-left: 10px;\">1. Automotive and aviation industry</h4>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Car headlights:</span> PC withstands high temperatures from halogen/HID lights, doesn\'t crack when hit by stones.</p>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Aircraft windshields:</span> 50% lighter than glass, withstands harsh pressure and temperature at altitude.</p>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Submarine and high-speed train windows:</span> High safety, shatter-resistant.</p>\r\n\r\n<h4 style=\"color: #5d4037; border-left: 4px solid #5d4037; padding-left: 10px;\">2. Medical and pharmaceutical equipment</h4>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Medical oxygen tanks:</span> Transparent for oxygen level monitoring, lighter than stainless steel.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Surgical instruments:</span> Can be sterilized at high temperatures, not corroded by sterilizing chemicals.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Medical equipment housing:</span> High durability, easy to clean, waterproof and chemical resistant.</p>\r\n\r\n<h4 style=\"color: #bf360c; border-left: 4px solid #bf360c; padding-left: 10px;\">3. Electronics and optics</h4>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Phone and tablet cases:</span> High durability, allows thin and light design.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Camera lenses, protective glasses:</span> High transparency, good scratch resistance.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">LED lights, signs:</span> Good light transmission, withstands harsh weather.</p>\r\n\r\n<div style=\"background-color: #fff3e0; padding: 15px; border-radius: 6px; margin: 20px 0; border: 1px solid #ffb74d;\">\r\n    <h4 style=\"color: #e65100; margin-top: 0;\">⚠️ Important note about PC</h4>\r\n    <p style=\"color: #5d4037;\">Some traditional PC types may contain BPA during production. However, <span style=\"font-weight: bold; color: #d32f2f;\">BPA-free PC</span> has been developed, especially for food and beverage contact applications. Consumers should check product information carefully before purchasing.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background-color: #e1bee7; padding: 10px; border-radius: 5px;\">🚀 Development trends of PC</h3>\r\n<p style=\"color: #4a148c;\">PC production technology is heading towards: <span style=\"font-weight: bold; color: #d32f2f;\">Bio-PC</span> (from renewable raw materials), <span style=\"font-weight: bold; color: #d32f2f;\">self-healing PC</span>, and <span style=\"font-weight: bold; color: #d32f2f;\">smart PC</span> (can change color or transparency according to environmental conditions).</p>\r\n\r\n<p style=\"font-size: 16px; color: #263238; background-color: #cfd8dc; padding: 15px; border-radius: 5px; font-weight: 500;\">\r\n    🔬 <strong>Summary:</strong> PC is not only a material for ordinary consumer products, but also a high-tech solution for many important industries. With its unique combination of transparency, durability and heat resistance, PC will continue to play an important role in the Industrial Revolution 4.0.\r\n</p>', '/img/blog/pc-industrial.jpg', 'Dr. Pham Thi D', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(5, 'PET plastic bottle production process', '<h2 style=\"color: #1b5e20; border-bottom: 2px solid #43a047; padding-bottom: 10px;\">Journey from plastic pellets to finished bottles: 4 key stages</h2>\r\n\r\n<p style=\"font-size: 17px; color: #2e7d32; font-weight: 500;\">PET plastic bottle production is a high-tech process, combining precise engineering and strict quality control. Each PET bottle goes through a long journey before reaching consumers.</p>\r\n\r\n<div style=\"background-color: #e8f5e9; padding: 20px; border-radius: 6px; margin-bottom: 25px;\">\r\n    <h3 style=\"color: #1b5e20; margin-top: 0;\">🎯 Production process overview</h3>\r\n    <p style=\"color: #33691e;\">Standard PET bottle production process includes 4 main stages: <span style=\"font-weight: bold; color: #d32f2f;\">(1) Raw material preparation</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(2) Injection molding preform</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(3) Blow molding</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(4) Inspection and packaging</span>.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #ff6f00; background-color: #fff3e0; padding: 12px; border-radius: 5px;\">1. RAW MATERIAL PREPARATION STAGE</h3>\r\n\r\n<p style=\"color: #5d4037; background-color: #fff8e1; padding: 15px; border-radius: 5px;\"><span style=\"font-weight: bold; color: #d32f2f;\">Input raw materials:</span> Virgin or recycled PET pellets, usually cylindrical, 2-3mm diameter, 3-4mm long. Pellets can be transparent or colored as required.</p>\r\n\r\n<p style=\"color: #5d4037;\"><span style=\"font-weight: bold; color: #d32f2f;\">Drying process:</span> PET is very sensitive to moisture. Pellets are dried in a specialized dryer at <span style=\"font-weight: bold; color: #d32f2f;\">150-170°C</span> for <span style=\"font-weight: bold; color: #d32f2f;\">4-6 hours</span>. The goal is to reduce moisture below <span style=\"font-weight: bold; color: #d32f2f;\">0.005%</span> (50 ppm). High moisture causes hydrolysis during melting, significantly reducing product durability.</p>\r\n\r\n<p style=\"color: #5d4037;\"><span style=\"font-weight: bold; color: #d32f2f;\">Mixing additives (if needed):</span> Additives can be added to improve product properties: heat stabilizers, UV inhibitors, antistatic agents, colorants, antioxidants.</p>\r\n\r\n<h3 style=\"color: #d84315; background-color: #ffccbc; padding: 12px; border-radius: 5px;\">2. INJECTION MOLDING PREFORM STAGE</h3>\r\n\r\n<p style=\"color: #4e342e;\">This is the most important stage, determining preform quality. The process takes place in an automatic injection molding machine:</p>\r\n\r\n<ol style=\"color: #4e342e; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Raw material feeding:</span> Dried pellets are fed into the machine\'s hopper.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Melting:</span> Pellets move through the machine\'s heating zone, heated to <span style=\"font-weight: bold; color: #d32f2f;\">270-290°C</span> by electric heating and screw friction.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Injection:</span> Molten plastic is pumped into the injection mold at high pressure (800-1200 bar). The mold is rapidly cooled at 10-15°C to shape the preform.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Preform removal:</span> Robot automatically removes preform from mold, cuts off excess plastic.</li>\r\n</ol>\r\n\r\n<div style=\"background-color: #f3e5f5; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #6a1b9a; margin-top: 0;\">📊 Technical parameters for injection stage</h4>\r\n    <ul style=\"color: #4a148c;\">\r\n        <li>Cycle time: <span style=\"font-weight: bold; color: #d32f2f;\">15-30 seconds</span> depending on preform size</li>\r\n        <li>Mold temperature: <span style=\"font-weight: bold; color: #d32f2f;\">10-15°C</span></li>\r\n        <li>Injection pressure: <span style=\"font-weight: bold; color: #d32f2f;\">800-1200 bar</span></li>\r\n        <li>Cooling time: <span style=\"font-weight: bold; color: #d32f2f;\">8-15 seconds</span></li>\r\n    </ul>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background-color: #f3e5f5; padding: 12px; border-radius: 5px;\">3. STRETCH BLOW MOLDING STAGE</h3>\r\n\r\n<p style=\"color: #4a148c;\">Preforms from the previous stage are transferred to the blow molding machine to form complete bottles:</p>\r\n\r\n<ol style=\"color: #4a148c; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Preform heating:</span> Preforms are evenly heated by infrared lamps or ovens to <span style=\"font-weight: bold; color: #d32f2f;\">95-110°C</span> (glass transition temperature Tg of PET).</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Orientation and stretching:</span> Heated preform is placed in blow mold, a stretch rod pushes from top to bottom to lengthen the preform longitudinally.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Blow forming:</span> Compressed air at <span style=\"font-weight: bold; color: #d32f2f;\">20-40 bar</span> pressure is blown into the preform, pressing plastic against the mold wall, forming the bottle. Blowing time is only <span style=\"font-weight: bold; color: #d32f2f;\">1.5-3 seconds</span>.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Cooling:</span> Bottle is held in mold to cool and stabilize dimensions.</li>\r\n</ol>\r\n\r\n<h3 style=\"color: #004d40; background-color: #b2dfdb; padding: 12px; border-radius: 5px;\">4. INSPECTION AND PACKAGING STAGE</h3>\r\n\r\n<p style=\"color: #004d40;\">Each finished bottle must go through strict quality control:</p>\r\n\r\n<ul style=\"color: #004d40; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Visual inspection:</span> Automatic camera detects defects like tiny cracks (0.1mm), air bubbles, deformation.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Dimension check:</span> Measure diameter, height, wall thickness at 128 different points using laser sensors.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Pressure test:</span> Test pressure resistance capability (especially important for carbonated bottles).</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Leak test:</span> Detect tiny leaks invisible to naked eye.</li>\r\n</ul>\r\n\r\n<div style=\"background-color: #e0f7fa; padding: 15px; border-radius: 6px; margin-top: 20px;\">\r\n    <h4 style=\"color: #006064; margin-top: 0;\">🏭 Modern production line specifications</h4>\r\n    <ul style=\"color: #006064;\">\r\n        <li>Capacity: <span style=\"font-weight: bold; color: #d32f2f;\">15,000-20,000 bottles/hour</span> (500ml bottles)</li>\r\n        <li>Raw material utilization efficiency: <span style=\"font-weight: bold; color: #d32f2f;\">98-99%</span></li>\r\n        <li>Defect rate: <span style=\"font-weight: bold; color: #d32f2f;\">below 0.5%</span></li>\r\n        <li>Energy consumption: <span style=\"font-weight: bold; color: #d32f2f;\">0.35-0.45 kWh/kg</span> product</li>\r\n        <li>Automation level: <span style=\"font-weight: bold; color: #d32f2f;\">95-98%</span></li>\r\n    </ul>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #263238; background-color: #eceff1; padding: 15px; border-radius: 5px; font-weight: 500;\">\r\n    🔧 <strong>Conclusion:</strong> PET bottle production is a high-tech industry, requiring absolute precision at every stage. Each seemingly simple PET bottle is the product of a sophisticated manufacturing process, combining precision mechanics, automatic control and strict quality control.\r\n</p>', '/img/blog/pet-production.jpg', 'Engineer Nguyen Van E', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(6, 'Distinguishing PET and HDPE plastic bottles', '<h2 style=\"color: #5d4037; border-bottom: 2px solid #8d6e63; padding-bottom: 10px;\">PET vs HDPE: Understanding clearly to choose the right material</h2>\r\n\r\n<p style=\"font-size: 17px; color: #4e342e; font-weight: 500; background-color: #efebe9; padding: 15px; border-radius: 5px;\">In the world of packaging plastics, PET and HDPE are two direct \"competitors\". Although both are thermoplastics, each type has completely different characteristics and applications. Understanding this difference is key to choosing the right material.</p>\r\n\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 20px; margin: 25px 0;\">\r\n    <div style=\"flex: 1; min-width: 300px; background-color: #e8f5e9; padding: 20px; border-radius: 8px; border: 2px solid #4caf50;\">\r\n        <h3 style=\"color: #2e7d32; text-align: center; margin-top: 0;\">🌊 PET<br>(Polyethylene Terephthalate)</h3>\r\n        <div style=\"background-color: #c8e6c9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n            <h4 style=\"color: #1b5e20; margin-top: 0;\">Identification characteristics</h4>\r\n            <ul style=\"color: #33691e;\">\r\n                <li>Transparent or tinted clear</li>\r\n                <li>High rigidity, relatively brittle</li>\r\n                <li>Makes \"crackling\" sound when squeezed hard</li>\r\n                <li>Recycling code: <span style=\"font-weight: bold; background-color: white; padding: 2px 8px; border-radius: 3px;\">1</span></li>\r\n            </ul>\r\n        </div>\r\n        \r\n        <div style=\"background-color: #a5d6a7; padding: 15px; border-radius: 5px;\">\r\n            <h4 style=\"color: #1b5e20; margin-top: 0;\">Physical properties</h4>\r\n            <ul style=\"color: #33691e;\">\r\n                <li>Density: <span style=\"font-weight: bold;\">1.38 g/cm³</span></li>\r\n                <li>Melting temperature: <span style=\"font-weight: bold;\">250-260°C</span></li>\r\n                <li>Transparency: <span style=\"font-weight: bold;\">88-92%</span></li>\r\n                <li>Heat resistance: <span style=\"font-weight: bold;\">70-85°C</span></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 300px; background-color: #e3f2fd; padding: 20px; border-radius: 8px; border: 2px solid #2196f3;\">\r\n        <h3 style=\"color: #1565c0; text-align: center; margin-top: 0;\">🧪 HDPE<br>(High-Density Polyethylene)</h3>\r\n        <div style=\"background-color: #bbdefb; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n            <h4 style=\"color: #0d47a1; margin-top: 0;\">Identification characteristics</h4>\r\n            <ul style=\"color: #1565c0;\">\r\n                <li>Opaque, cloudy or milky white</li>\r\n                <li>Soft, flexible, easy to bend</li>\r\n                <li>Smooth, slick surface</li>\r\n                <li>Recycling code: <span style=\"font-weight: bold; background-color: white; padding: 2px 8px; border-radius: 3px;\">2</span></li>\r\n            </ul>\r\n        </div>\r\n        \r\n        <div style=\"background-color: #90caf9; padding: 15px; border-radius: 5px;\">\r\n            <h4 style=\"color: #0d47a1; margin-top: 0;\">Physical properties</h4>\r\n            <ul style=\"color: #1565c0;\">\r\n                <li>Density: <span style=\"font-weight: bold;\">0.94-0.97 g/cm³</span></li>\r\n                <li>Melting temperature: <span style=\"font-weight: bold;\">120-130°C</span></li>\r\n                <li>Transparency: <span style=\"font-weight: bold;\">Low, opaque</span></li>\r\n                <li>Heat resistance: <span style=\"font-weight: bold;\">120°C</span></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background: linear-gradient(to right, #e1bee7, #f3e5f5); padding: 12px; border-radius: 5px;\">📊 Detailed comparison of PET and HDPE</h3>\r\n\r\n<table style=\"width: 100%; border-collapse: collapse; margin: 20px 0; box-shadow: 0 4px 6px rgba(0,0,0,0.1);\">\r\n    <thead>\r\n        <tr style=\"background: linear-gradient(to right, #7b1fa2, #9c27b0); color: white;\">\r\n            <th style=\"padding: 15px; border: 1px solid #ddd; text-align: center;\">CRITERIA</th>\r\n            <th style=\"padding: 15px; border: 1px solid #ddd; text-align: center; background-color: #4caf50; color: white;\">PET</th>\r\n            <th style=\"padding: 15px; border: 1px solid #ddd; text-align: center; background-color: #2196f3; color: white;\">HDPE</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Chemical structure</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">Polyethylene terephthalate - semi-crystalline polymer</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">High-density polyethylene - linear chain, few branches</td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Mechanical strength</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">High rigidity, good tensile strength, but brittle</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">High flexibility, good impact resistance, hard to break</td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Heat resistance</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">70-85°C (limited at high temperatures)</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">Up to 120°C (better heat resistance)</td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Barrier properties</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">Excellent gas barrier (O₂, CO₂)</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">Good moisture barrier, but gas permeable</td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Recyclability</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">Easy to recycle, high value</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">Recyclable, but lower value</td>\r\n        </tr>\r\n        <tr>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; font-weight: bold; background-color: #f9f9f9;\">Price</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e8f5e9;\">Medium to high</td>\r\n            <td style=\"padding: 12px; border: 1px solid #ddd; background-color: #e3f2fd;\">Low to medium</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n\r\n<p style=\"font-size: 16px; color: #37474f; background-color: #eceff1; padding: 20px; border-radius: 5px; font-weight: 500;\">\r\n    🔬 <strong>Summary:</strong> PET and HDPE are not competing rivals, but complementary solutions. PET has advantages in beverage packaging due to transparency and gas barrier properties, while HDPE dominates the chemical and milk packaging market due to mechanical strength and competitive pricing. Understanding each type\'s characteristics helps manufacturers and consumers make the smartest decisions.\r\n</p>', '/img/blog/pet-vs-hdpe.jpg', 'Expert Tran Van F', '2025-11-27 04:02:31', '2025-11-30 09:14:58'),
(7, 'The Difference Between PET, PP and PC Plastics', '<h2 style=\"color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px;\">Detailed Analysis of the 3 Most Popular Types of Plastics Today</h2>\r\n\r\n<p style=\"font-size: 16px; line-height: 1.6; color: #34495e;\">In the world of plastic packaging, there are three \"giants\" dominating the market: <strong style=\"color: #e74c3c;\">PET</strong>, <strong style=\"color: #f39c12;\">PP</strong> and <strong style=\"color: #3498db;\">PC</strong>. Each type has unique characteristics, suitable for specific applications.</p>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #3498db;\">\r\n    <h3 style=\"color: #2c3e50; margin-top: 0;\">🎯 PET - Polyethylene Terephthalate</h3>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Outstanding Features:</span> High transparency, good gas barrier, lightweight, reasonable price.</p>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Main Applications:</span> Mineral water bottles (500ml, 1L, 1.5L, 2L), carbonated soft drink bottles, cooking oil bottles, food packaging.</p>\r\n    <p style=\"color: #2c3e50;\"><span style=\"background-color: #ffeaa7; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Limitations:</span> Poor heat resistance (only 70-85°C), not suitable for repeated reuse.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #fff8e1; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #f39c12;\">\r\n    <h3 style=\"color: #e65100; margin-top: 0;\">🔥 PP - Polypropylene</h3>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Superior Advantages:</span> High heat resistance (up to 130°C), BPA-free, absolutely safe for food.</p>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Application Areas:</span> Microwave-safe food containers, shampoo bottles, shower gel, dishwashing liquid, kitchen utensils.</p>\r\n    <p style=\"color: #5d4037;\"><span style=\"background-color: #ffcc80; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Transparency:</span> Lower than PET, often milky white or translucent.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #e3f2fd; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2196f3;\">\r\n    <h3 style=\"color: #1565c0; margin-top: 0;\">💎 PC - Polycarbonate</h3>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Special Properties:</span> Transparent like glass, high mechanical strength, good impact resistance, hard to break.</p>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Usage Scope:</span> Premium sports water bottles, thermal flasks, milk tea bottles, medical equipment, bulletproof glass doors.</p>\r\n    <p style=\"color: #0d47a1;\"><span style=\"background-color: #bbdefb; padding: 2px 5px; border-radius: 3px; font-weight: bold;\">Drawbacks:</span> High cost, some types may contain BPA if not properly processed.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #7b1fa2; font-style: italic;\">📊 Quick Comparison Table</h3>\r\n<table style=\"width: 100%; border-collapse: collapse; margin: 15px 0;\">\r\n    <tr style=\"background-color: #7b1fa2; color: white;\">\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">Criteria</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PET</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PP</th>\r\n        <th style=\"padding: 12px; border: 1px solid #ddd;\">PC</th>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Transparency</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">High</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Low/Medium</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">Very High</td>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Heat Resistance (°C)</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">70-85</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Up to 130</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">-100 to 135</td>\r\n    </tr>\r\n    <tr>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;\">Price</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #ffebee;\">Low</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #fff3e0;\">Medium</td>\r\n        <td style=\"padding: 10px; border: 1px solid #ddd; text-align: center; background-color: #e3f2fd;\">High</td>\r\n    </tr>\r\n</table>\r\n\r\n<p style=\"font-size: 15px; color: #555; font-style: italic; background-color: #f5f5f5; padding: 15px; border-radius: 5px;\">\r\n    💡 <strong>Selection Advice:</strong> If you need single-use water bottles - choose PET. If you need microwave-safe food containers - PP is the best choice. For premium products needing durability and transparency - PC is the ideal material.\r\n</p>', '/img/blog/plastic-types.jpg', 'Expert Nguyen Van A', '2025-11-26 21:02:31', '2025-11-30 02:14:58'),
(8, 'Applications of PET Plastic in Bottle Production', '<h2 style=\"color: #1a237e; border-bottom: 2px solid #304ffe; padding-bottom: 8px;\">PET - An Irreplaceable Material in the Packaging Industry</h2>\r\n\r\n<p style=\"font-size: 17px; color: #283593; font-weight: 500;\">Since its invention in the 1940s, PET plastic has revolutionized the global packaging industry. With superior features, PET accounts for <span style=\"color: #d32f2f; font-weight: bold;\">60%</span> of the market share in plastic bottle production worldwide.</p>\r\n\r\n<h3 style=\"color: #0d47a1; background-color: #bbdefb; padding: 10px; border-radius: 5px;\">🌟 Golden Advantages of PET</h3>\r\n<ul style=\"color: #37474f; line-height: 1.7;\">\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Optimal Transparency:</span> Reaching 90-92%, allowing clear visibility of the product inside, enhancing aesthetics and consumer trust.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Superior Gas Barrier:</span> Minimizing oxygen and CO₂ penetration, preserving beverage quality, especially important for carbonated drinks.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">Ultra Lightweight:</span> A 500ml PET bottle weighs only about 10-12g, while a glass bottle of the same capacity weighs 300-400g.</li>\r\n    <li><span style=\"color: #d32f2f; font-weight: bold;\">100% Recyclable:</span> PET can be fully recycled into new products, minimizing environmental impact.</li>\r\n</ul>\r\n\r\n<h3 style=\"color: #00695c; background-color: #b2dfdb; padding: 10px; border-radius: 5px;\">🏭 Specific Applications of PET</h3>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">1. Mineral and Purified Water Bottles</h4>\r\n<p style=\"color: #455a64;\">This is the most common application of PET. Common capacities include: 330ml (small bottle), 500ml (most popular), 1L, 1.5L and 2L (family size). Each year, hundreds of billions of PET water bottles are produced globally.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">2. Carbonated Soft Drink Bottles</h4>\r\n<p style=\"color: #455a64;\">PET can withstand CO₂ pressure up to 4-5 bar, ensuring rigidity and durability when containing carbonated beverages. Notably, PET does not deform under pressure like some other plastics.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">3. Cooking Oil Bottles</h4>\r\n<p style=\"color: #455a64;\">PET\'s good oxygen barrier helps protect cooking oil from oxidation, maintaining quality and flavor. Oil bottle designs often include handles and convenient pouring spouts.</p>\r\n\r\n<h4 style=\"color: #004d40; border-left: 4px solid #004d40; padding-left: 10px;\">4. Cosmetics and Pharmaceutical Packaging</h4>\r\n<p style=\"color: #455a64;\">PET is used for perfume bottles, lotions, skin creams, and some liquid medicines due to its chemical inertness and non-interaction with product ingredients.</p>\r\n\r\n<div style=\"background-color: #e8eaf6; padding: 15px; border-radius: 6px; margin: 20px 0;\">\r\n    <h4 style=\"color: #303f9f; margin-top: 0;\">📈 PET Development Trends</h4>\r\n    <p style=\"color: #3f51b5;\">PET production technology is constantly improving. Modern production lines can produce up to <span style=\"font-weight: bold; color: #d32f2f;\">20,000 bottles/hour</span> with high precision. Bio-PET is also being researched and developed, using renewable materials instead of petroleum.</p>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #424242; background-color: #f5f5f5; padding: 12px; border-radius: 4px; border-left: 4px solid #ff9800;\">\r\n    🚀 <strong>The Future of PET:</strong> Despite facing environmental challenges, PET will remain the dominant material in packaging due to its economy, high performance, and increasingly improved recyclability.\r\n</p>', '/img/blog/pet-applications.jpg', 'Engineer Tran Thi B', '2025-11-26 21:02:31', '2025-11-30 02:14:58');
INSERT INTO `blog` (`BlogID`, `Title`, `Content`, `Image`, `Author`, `created_at`, `updated_at`) VALUES
(9, 'Why Choose PP Plastic Bottles for Food?', '<h2 style=\"color: #e65100; border-bottom: 2px solid #ff9800; padding-bottom: 10px;\">PP - The Smart Choice for Food Safety</h2>\r\n\r\n<div style=\"background-color: #fff3e0; padding: 15px; border-radius: 6px; border: 1px solid #ffb74d; margin-bottom: 20px;\">\r\n    <h3 style=\"color: #ef6c00; margin-top: 0;\">⚠️ Food Safety Issues</h3>\r\n    <p style=\"color: #5d4037;\">In the context of increasing concerns about harmful chemicals from plastics (such as BPA, phthalates), choosing safe food container materials becomes more important than ever. PP (Polypropylene) emerges as an optimal solution.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #f57c00; background-color: #ffecb3; padding: 12px; border-radius: 5px;\">✅ 7 Convincing Reasons to Choose PP for Food</h3>\r\n\r\n<div style=\"background-color: #fff8e1; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #ff8f00; margin-top: 0;\">1. BPA-FREE - Absolutely Safe</h4>\r\n    <p style=\"color: #5d4037;\">BPA (Bisphenol A) is an industrial chemical that can disrupt endocrine functions, affecting reproductive health and development. PP is completely BPA-free, certified safe by FDA (USA) and EFSA (Europe) for all users, including infants and pregnant women.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #f1f8e9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #689f38; margin-top: 0;\">2. HIGH HEAT RESISTANCE - Microwave Safe</h4>\r\n    <p style=\"color: #33691e;\">PP can withstand temperatures up to <span style=\"font-weight: bold; color: #d32f2f;\">130°C</span>, allowing direct reheating of food in the microwave without deformation or release of harmful substances. This is a superior advantage over PET (only withstands 70-85°C).</p>\r\n</div>\r\n\r\n<div style=\"background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #388e3c; margin-top: 0;\">3. GOOD CHEMICAL RESISTANCE - Non-Corrosive</h4>\r\n    <p style=\"color: #1b5e20;\">PP resists most acids, bases, oils, and common detergents. This ensures the container does not change properties when holding acidic foods (like tomato sauce, pickles) or greasy foods.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #5d4037; background-color: #d7ccc8; padding: 10px; border-radius: 5px;\">🍱 Practical Applications of PP in Daily Life</h3>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Office Lunch Boxes:</span> Multi-compartment design, can be reheated directly in the microwave, airtight lid keeps food fresh.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Baby Milk Bottles:</span> Safe for infants, easy to clean, can be sterilized with boiling water or specialized sterilizers.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Food Storage Containers:</span> Airtight, moisture-proof, helps preserve food longer in the refrigerator, prevents odor transfer.</p>\r\n\r\n<p style=\"color: #4e342e;\"><span style=\"font-weight: bold; color: #d32f2f;\">Kitchen Utensils:</span> Cutting boards, spoons, ladles, baskets... can all be made from safe PP.</p>\r\n\r\n<div style=\"background-color: #fce4ec; padding: 15px; border-radius: 6px; margin: 20px 0;\">\r\n    <h4 style=\"color: #ad1457; margin-top: 0;\">💡 Proper Usage Guide for PP</h4>\r\n    <p style=\"color: #880e4f;\"><span style=\"font-weight: bold;\">Do:</span> Clean with warm water and neutral soap, let dry completely before closing the lid, check the plastic symbol (number 5 in the recycling triangle) before purchasing.</p>\r\n    <p style=\"color: #880e4f;\"><span style=\"font-weight: bold;\">Don\'t:</span> Use when there are deep cracks or scratches, place in conventional ovens (only use with microwaves), store food that is too hot (over 130°C).</p>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #37474f; background-color: #eceff1; padding: 15px; border-radius: 5px; font-style: italic;\">\r\n    🌟 <strong>Conclusion:</strong> PP is not only safe but also convenient and economical. With high heat resistance, BPA-free, and reasonable price, PP deserves to be the top choice for food containers in every household.\r\n</p>', '/img/blog/pp-food-safe.jpg', 'Expert Le Van C', '2025-11-26 21:02:31', '2025-11-30 02:14:58'),
(10, 'PC Plastic and Its Industrial Applications', '<h2 style=\"color: #0d47a1; border-bottom: 2px solid #1976d2; padding-bottom: 10px;\">Polycarbonate - The Material of Technological Breakthrough</h2>\r\n\r\n<p style=\"font-size: 17px; color: #1565c0; font-weight: 500; background-color: #e3f2fd; padding: 15px; border-radius: 5px;\">PC (Polycarbonate) is not just an ordinary plastic - it is a high-engineering polymer with superior properties, deserving to be called <span style=\"color: #d32f2f; font-weight: bold;\">\"organic glass\"</span> or <span style=\"color: #d32f2f; font-weight: bold;\">\"transparent metal\"</span>.</p>\r\n\r\n<h3 style=\"color: #01579b; background: linear-gradient(to right, #bbdefb, #e3f2fd); padding: 12px; border-radius: 5px;\">💎 Special Properties of Polycarbonate</h3>\r\n\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 15px; margin: 20px 0;\">\r\n    <div style=\"flex: 1; min-width: 250px; background-color: #e1f5fe; padding: 15px; border-radius: 5px; border: 1px solid #4fc3f7;\">\r\n        <h4 style=\"color: #0277bd; margin-top: 0;\">🔍 Super High Transparency</h4>\r\n        <p style=\"color: #01579b;\">PC has transparency of 89-91%, almost equivalent to glass (92%). This allows for products with high gloss and clarity, highlighting the contents inside.</p>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 250px; background-color: #f3e5f5; padding: 15px; border-radius: 5px; border: 1px solid #ba68c8;\">\r\n        <h4 style=\"color: #6a1b9a; margin-top: 0;\">💪 Impressive Mechanical Durability</h4>\r\n        <p style=\"color: #4a148c;\">PC has impact resistance <span style=\"font-weight: bold; color: #d32f2f;\">250 times</span> that of ordinary glass and 30 times that of acrylic. A 3mm thick PC sheet can withstand a bullet from a handgun.</p>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 250px; background-color: #e8f5e9; padding: 15px; border-radius: 5px; border: 1px solid #81c784;\">\r\n        <h4 style=\"color: #2e7d32; margin-top: 0;\">🌡️ Wide Temperature Range</h4>\r\n        <p style=\"color: #1b5e20;\">PC operates stably in a temperature range from <span style=\"font-weight: bold; color: #d32f2f;\">-100°C to 135°C</span>, allowing use in both extremely cold and high-temperature environments.</p>\r\n    </div>\r\n</div>\r\n\r\n<h3 style=\"color: #004d40; background-color: #b2dfdb; padding: 12px; border-radius: 5px;\">🏭 Diverse Industrial Applications of PC</h3>\r\n\r\n<h4 style=\"color: #00796b; border-left: 4px solid #00796b; padding-left: 10px;\">1. Automotive and Aviation Industries</h4>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Car Headlights:</span> PC withstands high temperatures from halogen/HID lamps, does not crack upon impact with gravel.</p>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Aircraft Windshields:</span> 50% lighter than glass, withstands extreme pressure and temperatures at high altitudes.</p>\r\n<p style=\"color: #004d40;\"><span style=\"font-weight: bold; color: #d32f2f;\">Subway and High-Speed Train Windows:</span> High safety, does not shatter into small pieces.</p>\r\n\r\n<h4 style=\"color: #5d4037; border-left: 4px solid #5d4037; padding-left: 10px;\">2. Medical Equipment and Pharmaceuticals</h4>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Medical Oxygen Tanks:</span> Transparent for observing oxygen levels, lighter than stainless steel.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Surgical Instruments:</span> Can be sterilized at high temperatures, not corroded by disinfectants.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Medical Device Casings:</span> High durability, easy to clean, resistant to water and chemicals.</p>\r\n\r\n<h4 style=\"color: #bf360c; border-left: 4px solid #bf360c; padding-left: 10px;\">3. Electronics and Optics</h4>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Phone and Tablet Cases:</span> High durability, allows for thin and light designs.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">Camera Lenses, Protective Glasses:</span> High transparency, good scratch resistance.</p>\r\n<p style=\"color: #3e2723;\"><span style=\"font-weight: bold; color: #d32f2f;\">LED Lights, Signboards:</span> Good light transmission, withstands harsh weather.</p>\r\n\r\n<div style=\"background-color: #fff3e0; padding: 15px; border-radius: 6px; margin: 20px 0; border: 1px solid #ffb74d;\">\r\n    <h4 style=\"color: #e65100; margin-top: 0;\">⚠️ Important Notes on PC</h4>\r\n    <p style=\"color: #5d4037;\">Some traditional PC types may contain BPA during production. However, BPA-free PC types have now been developed, especially for applications in contact with food and beverages. Consumers should carefully check product information before purchasing.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background-color: #e1bee7; padding: 10px; border-radius: 5px;\">🚀 PC Development Trends</h3>\r\n<p style=\"color: #4a148c;\">PC production technology is aiming towards goals: <span style=\"font-weight: bold; color: #d32f2f;\">Bio-PC</span> (from renewable materials), <span style=\"font-weight: bold; color: #d32f2f;\">Self-Healing Scratch PC</span>, and <span style=\"font-weight: bold; color: #d32f2f;\">Smart PC</span> (can change color or transparency according to environmental conditions).</p>\r\n\r\n<p style=\"font-size: 16px; color: #263238; background-color: #cfd8dc; padding: 15px; border-radius: 5px; font-weight: 500;\">\r\n    🔬 <strong>Summary:</strong> PC is not only a material for ordinary consumer products but also a high-tech solution for many important industries. With a unique combination of transparency, durability, and heat resistance, PC will continue to play an important role in the Industry 4.0 revolution.\r\n</p>', '/img/blog/pc-industrial.jpg', 'Dr. Pham Thi D', '2025-11-26 21:02:31', '2025-11-30 02:14:58'),
(11, 'PET Plastic Bottle Production Process', '<h2 style=\"color: #1b5e20; border-bottom: 2px solid #43a047; padding-bottom: 10px;\">The Journey from Plastic Pellets to Finished Bottles: 4 Key Stages</h2>\r\n\r\n<p style=\"font-size: 17px; color: #2e7d32; font-weight: 500;\">Producing PET plastic bottles is a high-tech process, combining precise engineering and strict quality control. Each PET bottle goes through a long journey before reaching consumers.</p>\r\n\r\n<div style=\"background-color: #e8f5e9; padding: 20px; border-radius: 6px; margin-bottom: 25px;\">\r\n    <h3 style=\"color: #1b5e20; margin-top: 0;\">🎯 Production Process Overview</h3>\r\n    <p style=\"color: #33691e;\">The standard PET bottle production process includes 4 main stages: <span style=\"font-weight: bold; color: #d32f2f;\">(1) Material Preparation</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(2) Injection Molding to Create Preforms</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(3) Stretch Blow Molding</span> → <span style=\"font-weight: bold; color: #d32f2f;\">(4) Inspection and Packaging</span>.</p>\r\n</div>\r\n\r\n<h3 style=\"color: #ff6f00; background-color: #fff3e0; padding: 12px; border-radius: 5px;\">1. MATERIAL PREPARATION STAGE</h3>\r\n\r\n<p style=\"color: #5d4037; background-color: #fff8e1; padding: 15px; border-radius: 5px;\"><span style=\"font-weight: bold; color: #d32f2f;\">Input Materials:</span> Virgin or recycled PET pellets, usually cylindrical, 2-3mm diameter, 3-4mm long. Pellets can be transparent or colored as required.</p>\r\n\r\n<p style=\"color: #5d4037;\"><span style=\"font-weight: bold; color: #d32f2f;\">Drying Process:</span> PET is very sensitive to moisture. Pellets are dried in specialized dryers at <span style=\"font-weight: bold; color: #d32f2f;\">150-170°C</span> for <span style=\"font-weight: bold; color: #d32f2f;\">4-6 hours</span>. The goal is to reduce moisture below <span style=\"font-weight: bold; color: #d32f2f;\">0.005%</span> (50 ppm). High moisture causes hydrolysis during melting, significantly reducing product durability.</p>\r\n\r\n<p style=\"color: #5d4037;\"><span style=\"font-weight: bold; color: #d32f2f;\">Additive Mixing (if needed):</span> Additives can be added to improve product properties: heat stabilizers, UV blockers, anti-static agents, colorants, antioxidants.</p>\r\n\r\n<h3 style=\"color: #d84315; background-color: #ffccbc; padding: 12px; border-radius: 5px;\">2. INJECTION MOLDING STAGE FOR PREFORMS (Injection Molding)</h3>\r\n\r\n<p style=\"color: #4e342e;\">This is the most important stage, determining preform quality. The process occurs in automatic injection molding machines:</p>\r\n\r\n<ol style=\"color: #4e342e; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Material Feeding:</span> Dried pellets are fed into the machine\'s hopper.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Melting:</span> Pellets move through the heating zone, heated to <span style=\"font-weight: bold; color: #d32f2f;\">270-290°C</span> by electric heaters and screw friction.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Injection:</span> Molten plastic is pumped into the mold at high pressure (800-1200 bar). The mold is rapidly cooled at 10-15°C to shape the preform.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Preform Removal:</span> Robots automatically remove preforms from the mold, trim flash (excess plastic).</li>\r\n</ol>\r\n\r\n<div style=\"background-color: #f3e5f5; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n    <h4 style=\"color: #6a1b9a; margin-top: 0;\">📊 Technical Parameters for Injection Molding Stage</h4>\r\n    <ul style=\"color: #4a148c;\">\r\n        <li>Cycle Time: <span style=\"font-weight: bold; color: #d32f2f;\">15-30 seconds</span> depending on preform size</li>\r\n        <li>Mold Temperature: <span style=\"font-weight: bold; color: #d32f2f;\">10-15°C</span></li>\r\n        <li>Injection Pressure: <span style=\"font-weight: bold; color: #d32f2f;\">800-1200 bar</span></li>\r\n        <li>Cooling Time: <span style=\"font-weight: bold; color: #d32f2f;\">8-15 seconds</span></li>\r\n    </ul>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background-color: #f3e5f5; padding: 12px; border-radius: 5px;\">3. STRETCH BLOW MOLDING STAGE (Stretch Blow Molding)</h3>\r\n\r\n<p style=\"color: #4a148c;\">Preforms from the previous stage are transferred to the blow molding machine to form complete bottles:</p>\r\n\r\n<ol style=\"color: #4a148c; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Preform Heating:</span> Preforms are evenly heated by infrared lamps or ovens to <span style=\"font-weight: bold; color: #d32f2f;\">95-110°C</span> (PET\'s glass transition temperature Tg).</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Orientation and Stretching:</span> Hot preforms are placed in the blow mold, a stretch rod pushes from above to elongate the preform vertically.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Blowing Air to Shape:</span> Compressed air at <span style=\"font-weight: bold; color: #d32f2f;\">20-40 bar</span> is blown into the preform, pressing the plastic against the mold walls to form the bottle. Blowing time is only <span style=\"font-weight: bold; color: #d32f2f;\">1.5-3 seconds</span>.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Cooling:</span> The bottle is held in the mold to cool and stabilize dimensions.</li>\r\n</ol>\r\n\r\n<h3 style=\"color: #004d40; background-color: #b2dfdb; padding: 12px; border-radius: 5px;\">4. INSPECTION AND PACKAGING STAGE</h3>\r\n\r\n<p style=\"color: #004d40;\">Each finished bottle undergoes a strict quality inspection process:</p>\r\n\r\n<ul style=\"color: #004d40; line-height: 1.7;\">\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Visual Inspection:</span> Automatic cameras detect defects like cracks, bubbles, deformations.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Dimensional Check:</span> Measure diameter, height, wall thickness using laser sensors.</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Pressure Test:</span> Test pressure resistance (especially important for carbonated drink bottles).</li>\r\n    <li><span style=\"font-weight: bold; color: #d32f2f;\">Leak Detection:</span> Detect small leaks invisible to the naked eye.</li>\r\n</ul>\r\n\r\n<div style=\"background-color: #e0f7fa; padding: 15px; border-radius: 6px; margin-top: 20px;\">\r\n    <h4 style=\"color: #006064; margin-top: 0;\">🏭 Production Parameters of Modern Lines</h4>\r\n    <ul style=\"color: #006064;\">\r\n        <li>Productivity: <span style=\"font-weight: bold; color: #d32f2f;\">15,000-20,000 bottles/hour</span> (500ml bottles)</li>\r\n        <li>Material Utilization Efficiency: <span style=\"font-weight: bold; color: #d32f2f;\">98-99%</span></li>\r\n        <li>Defect Rate: <span style=\"font-weight: bold; color: #d32f2f;\">under 0.5%</span></li>\r\n        <li>Energy Consumption: <span style=\"font-weight: bold; color: #d32f2f;\">0.35-0.45 kWh/kg</span> product</li>\r\n        <li>Automation Level: <span style=\"font-weight: bold; color: #d32f2f;\">95-98%</span></li>\r\n    </ul>\r\n</div>\r\n\r\n<p style=\"font-size: 16px; color: #263238; background-color: #eceff1; padding: 15px; border-radius: 5px; font-weight: 500;\">\r\n    🔧 <strong>Conclusion:</strong> PET bottle production is a high-tech industry, requiring absolute precision in every step. Each seemingly simple PET bottle is the product of a sophisticated production process, combining precision mechanics, automatic control, and strict quality control.\r\n</p>', '/img/blog/pet-production.jpg', 'Engineer Nguyen Van E', '2025-11-26 21:02:31', '2025-11-30 02:14:58'),
(12, 'Distinguishing PET and HDPE Plastic Bottles', '<h2 style=\"color: #5d4037; border-bottom: 2px solid #8d6e63; padding-bottom: 10px;\">PET vs HDPE: Understand Clearly to Choose the Right Material</h2>\r\n\r\n<p style=\"font-size: 17px; color: #4e342e; font-weight: 500; background-color: #efebe9; padding: 15px; border-radius: 5px;\">In the world of packaging plastics, PET and HDPE are two direct competitors. Although both are thermoplastic plastics, each has completely different characteristics and applications. Understanding this difference is the key to selecting the appropriate material.</p>\r\n\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 20px; margin: 25px 0;\">\r\n    <div style=\"flex: 1; min-width: 300px; background-color: #e8f5e9; padding: 20px; border-radius: 8px; border: 2px solid #4caf50;\">\r\n        <h3 style=\"color: #2e7d32; text-align: center; margin-top: 0;\">🌊 PET<br>(Polyethylene Terephthalate)</h3>\r\n        <div style=\"background-color: #c8e6c9; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n            <h4 style=\"color: #1b5e20; margin-top: 0;\">Identification Features</h4>\r\n            <ul style=\"color: #33691e;\">\r\n                <li>Transparent or tinted transparent</li>\r\n                <li>High hardness, relatively brittle</li>\r\n                <li>Makes a \"crackling\" sound when squeezed hard</li>\r\n                <li>Recycling Code: <span style=\"font-weight: bold; background-color: white; padding: 2px 8px; border-radius: 3px;\">1</span></li>\r\n            </ul>\r\n        </div>\r\n        \r\n        <div style=\"background-color: #a5d6a7; padding: 15px; border-radius: 5px;\">\r\n            <h4 style=\"color: #1b5e20; margin-top: 0;\">Physical Properties</h4>\r\n            <ul style=\"color: #33691e;\">\r\n                <li>Density: <span style=\"font-weight: bold;\">1.38 g/cm³</span></li>\r\n                <li>Melting Temperature: <span style=\"font-weight: bold;\">250-260°C</span></li>\r\n                <li>Transparency: <span style=\"font-weight: bold;\">88-92%</span></li>\r\n                <li>Heat Resistance: <span style=\"font-weight: bold;\">70-85°C</span></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n    \r\n    <div style=\"flex: 1; min-width: 300px; background-color: #e3f2fd; padding: 20px; border-radius: 8px; border: 2px solid #2196f3;\">\r\n        <h3 style=\"color: #1565c0; text-align: center; margin-top: 0;\">🧪 HDPE<br>(High-Density Polyethylene)</h3>\r\n        <div style=\"background-color: #bbdefb; padding: 15px; border-radius: 5px; margin: 15px 0;\">\r\n            <h4 style=\"color: #0d47a1; margin-top: 0;\">Identification Features</h4>\r\n            <ul style=\"color: #1565c0;\">\r\n                <li>Opaque, cloudy or milky white</li>\r\n                <li>Flexible, easily bendable</li>\r\n                <li>Smooth, fine surface</li>\r\n                <li>Recycling Code: <span style=\"font-weight: bold; background-color: white; padding: 2px 8px; border-radius: 3px;\">2</span></li>\r\n            </ul>\r\n        </div>\r\n        \r\n        <div style=\"background-color: #90caf9; padding: 15px; border-radius: 5px;\">\r\n            <h4 style=\"color: #0d47a1; margin-top: 0;\">Physical Properties</h4>\r\n            <ul style=\"color: #1565c0;\">\r\n                <li>Density: <span style=\"font-weight: bold;\">0.94-0.97 g/cm³</span></li>\r\n                <li>Melting Temperature: <span style=\"font-weight: bold;\">120-130°C</span></li>\r\n                <li>Transparency: <span style=\"font-weight: bold;\">Low, opaque</span></li>\r\n                <li>Heat Resistance: <span style=\"font-weight: bold;\">120°C</span></li>\r\n            </ul>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<h3 style=\"color: #6a1b9a; background: linear-g...', '/img/blog/pet-hdpe.jpg', 'Expert Hoang Van F', '2025-11-26 21:02:31', '2025-11-30 02:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `Description`, `Status`) VALUES
(1, 'PET', 'Polyethylene Terephthalate - Transparent, good impact resistance, used for beverages, food', 1),
(2, 'PP', 'Polypropylene - Heat resistant, chemical resistant, used for chemicals, pharmaceuticals', 1),
(3, 'PC', 'Polycarbonate - Durable, high heat resistant, transparent, used for premium products', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colour`
--

CREATE TABLE `colour` (
  `ColourID` int(11) NOT NULL,
  `ColourName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colour`
--

INSERT INTO `colour` (`ColourID`, `ColourName`) VALUES
(1, 'Clear'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Yellow');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `is_handled` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `is_read`, `is_handled`, `created_at`, `updated_at`) VALUES
(1, 'vu', 'nghvukt1@gmail.com', 'test message', 0, 0, '2025-11-28 19:16:54', '2025-11-28 19:16:54'),
(2, 'vu', 'nghvukt1@gmail.com', 'test', 0, 0, '2025-11-28 19:19:33', '2025-11-29 03:48:02');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedBackID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `Rating` decimal(3,1) NOT NULL,
  `CommentText` text NOT NULL,
  `SubmissionDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedBackID`, `ProductID`, `AccountID`, `Rating`, `CommentText`, `SubmissionDate`) VALUES
(1, 1, NULL, 4.5, 'Beautiful bottle, good quality, fast delivery', '2025-11-22 18:37:48'),
(2, 1, NULL, 5.0, 'Product exactly as described, very satisfied', '2025-11-22 18:37:48'),
(3, 4, NULL, 4.0, 'Sturdy bottle, suitable for chemicals', '2025-11-22 18:37:48'),
(4, 7, NULL, 4.5, 'Beautiful sports bottle, premium quality', '2025-11-22 18:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Photo` varchar(500) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `DocumentURL` varchar(500) DEFAULT NULL COMMENT 'Technical document/drawing URL of the product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `CategoryID`, `ProductName`, `Description`, `Photo`, `Status`, `CreatedAt`, `DocumentURL`) VALUES
(1, 1, 'Mineral Water Bottle', 'Premium PET mineral water bottle, food safe', '/img/products/water-pet.jpg', 1, '2025-11-22 18:37:48', 'product_documents/1.pdf'),
(2, 1, 'Soft Drink Bottle', 'PET bottle for carbonated soft drinks, pressure resistant', '/img/products/soda-pet.jpg', 1, '2025-11-22 18:37:48', 'product_documents/2.pdf'),
(3, 1, 'Cooking Oil Bottle', 'Anti-oxidation PET bottle for cooking oil', '/img/products/oil-pet.jpg', 1, '2025-11-22 18:37:48', 'product_documents/3.pdf'),
(4, 2, 'Chemical Bottle', 'Chemical resistant PP bottle, high heat resistant', '/img/products/chemical-pp.jpg', 1, '2025-11-22 18:37:48', 'product_documents/4.pdf'),
(5, 2, 'Shampoo Bottle', 'PP bottle for shampoo, cosmetics', '/img/products/shampoo-pp.jpg', 1, '2025-11-22 18:37:48', 'product_documents/5.pdf'),
(6, 2, 'Dish Soap Bottle', 'PP bottle for household cleaning agents', '/img/products/detergent-pp.jpg', 1, '2025-11-22 18:37:48', 'product_documents/6.pdf'),
(7, 3, 'Sports Water Bottle', 'PC sports bottle, BPA-free, heat resistant', '/img/products/sport-pc.jpg', 1, '2025-11-22 18:37:48', 'product_documents/7.pdf'),
(8, 3, 'Thermal Bottle', 'Premium PC thermal bottle with excellent heat retention', '/img/products/thermal-pc.jpg', 1, '2025-11-22 18:37:48', 'product_documents/8.pdf'),
(9, 3, 'Milk Tea Bottle', 'PC bottle for milk tea, premium beverages', '/img/products/milktea-pc.jpg', 1, '2025-11-22 18:37:48', 'product_documents/9.pdf'),
(11, 2, 'test123', 'test product description', '/img/products/product_1764642059_692e4d0be7ecb.jpg', 1, '2025-12-02 02:20:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productvariant`
--

CREATE TABLE `productvariant` (
  `VariantID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ColourID` int(11) NOT NULL,
  `VolumeID` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockQuantity` int(11) DEFAULT 0,
  `MainImage` varchar(500) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productvariant`
--

INSERT INTO `productvariant` (`VariantID`, `ProductID`, `ColourID`, `VolumeID`, `Price`, `StockQuantity`, `MainImage`, `Status`) VALUES
(1, 1, 1, 1, 0.25, 800, '/img/variants/water-clear.jpg', 1),
(2, 1, 1, 2, 0.30, 600, '/img/variants/water-clear.jpg', 1),
(3, 1, 1, 3, 0.35, 500, '/img/variants/water-clear.jpg', 1),
(4, 1, 1, 4, 0.45, 400, '/img/variants/water-clear.jpg', 1),
(5, 1, 2, 1, 0.28, 700, '/img/variants/water-blue.jpg', 1),
(6, 1, 2, 2, 0.33, 550, '/img/variants/water-blue.jpg', 1),
(7, 1, 2, 3, 0.38, 450, '/img/variants/water-blue.jpg', 1),
(8, 1, 2, 4, 0.48, 350, '/img/variants/water-blue.jpg', 1),
(9, 1, 3, 1, 0.28, 700, '/img/variants/water-green.jpg', 1),
(10, 1, 3, 2, 0.33, 550, '/img/variants/water-green.jpg', 1),
(11, 1, 3, 3, 0.38, 450, '/img/variants/water-green.jpg', 1),
(12, 1, 3, 4, 0.48, 350, '/img/variants/water-green.jpg', 1),
(13, 1, 4, 1, 0.30, 600, '/img/variants/water-yellow.jpg', 1),
(14, 1, 4, 2, 0.35, 500, '/img/variants/water-yellow.jpg', 1),
(15, 1, 4, 3, 0.40, 400, '/img/variants/water-yellow.jpg', 1),
(16, 1, 4, 4, 0.50, 300, '/img/variants/water-yellow.jpg', 1),
(17, 2, 1, 1, 0.35, 700, '/img/variants/soda-clear.jpg', 1),
(18, 2, 1, 2, 0.40, 600, '/img/variants/soda-clear.jpg', 1),
(19, 2, 1, 3, 0.45, 500, '/img/variants/soda-clear.jpg', 1),
(20, 2, 1, 4, 0.55, 400, '/img/variants/soda-clear.jpg', 1),
(21, 2, 2, 1, 0.38, 650, '/img/variants/soda-blue.jpg', 1),
(22, 2, 2, 2, 0.43, 550, '/img/variants/soda-blue.jpg', 1),
(23, 2, 2, 3, 0.48, 450, '/img/variants/soda-blue.jpg', 1),
(24, 2, 2, 4, 0.58, 350, '/img/variants/soda-blue.jpg', 1),
(25, 4, 1, 1, 1.20, 300, '/img/variants/chemical-clear.jpg', 1),
(26, 4, 1, 2, 1.50, 250, '/img/variants/chemical-clear.jpg', 1),
(27, 4, 1, 3, 1.80, 200, '/img/variants/chemical-clear.jpg', 1),
(28, 4, 1, 4, 2.20, 150, '/img/variants/chemical-clear.jpg', 1),
(29, 4, 2, 1, 1.25, 280, '/img/variants/chemical-blue.jpg', 1),
(30, 4, 2, 2, 1.55, 230, '/img/variants/chemical-blue.jpg', 1),
(31, 4, 2, 3, 1.85, 180, '/img/variants/chemical-blue.jpg', 1),
(32, 4, 2, 4, 2.25, 130, '/img/variants/chemical-blue.jpg', 1),
(33, 7, 1, 1, 1.50, 350, '/img/variants/sport-clear.jpg', 1),
(34, 7, 1, 2, 1.80, 300, '/img/variants/sport-clear.jpg', 1),
(35, 7, 1, 3, 2.10, 250, '/img/variants/sport-clear.jpg', 1),
(36, 7, 1, 4, 2.50, 200, '/img/variants/sport-clear.jpg', 1),
(37, 7, 2, 1, 1.55, 330, '/img/variants/sport-blue.jpg', 1),
(38, 7, 2, 2, 1.85, 280, '/img/variants/sport-blue.jpg', 1),
(39, 7, 2, 3, 2.15, 230, '/img/variants/sport-blue.jpg', 1),
(40, 7, 2, 4, 2.55, 180, '/img/variants/sport-blue.jpg', 1),
(41, 3, 1, 1, 0.40, 400, '/img/variants/oil-clear.jpg', 1),
(42, 3, 1, 2, 0.50, 350, '/img/variants/oil-clear.jpg', 1),
(43, 3, 1, 3, 0.60, 300, '/img/variants/oil-clear.jpg', 1),
(44, 3, 1, 4, 0.75, 250, '/img/variants/oil-clear.jpg', 1),
(45, 3, 2, 1, 0.45, 380, '/img/variants/oil-blue.jpg', 1),
(46, 3, 2, 2, 0.55, 330, '/img/variants/oil-blue.jpg', 1),
(47, 3, 2, 3, 0.65, 280, '/img/variants/oil-blue.jpg', 1),
(48, 3, 2, 4, 0.80, 230, '/img/variants/oil-blue.jpg', 1),
(49, 5, 1, 1, 0.60, 450, '/img/variants/shampoo-clear.jpg', 1),
(50, 5, 1, 2, 0.75, 400, '/img/variants/shampoo-clear.jpg', 1),
(51, 5, 1, 3, 0.90, 350, '/img/variants/shampoo-clear.jpg', 1),
(52, 5, 1, 4, 1.10, 300, '/img/variants/shampoo-clear.jpg', 1),
(53, 5, 2, 1, 0.65, 430, '/img/variants/shampoo-blue.jpg', 1),
(54, 5, 2, 2, 0.80, 380, '/img/variants/shampoo-blue.jpg', 1),
(55, 5, 2, 3, 0.95, 330, '/img/variants/shampoo-blue.jpg', 1),
(56, 5, 2, 4, 1.15, 280, '/img/variants/shampoo-blue.jpg', 1),
(57, 5, 3, 1, 0.65, 430, '/img/variants/shampoo-green.jpg', 1),
(58, 5, 3, 2, 0.80, 380, '/img/variants/shampoo-green.jpg', 1),
(59, 5, 3, 3, 0.95, 330, '/img/variants/shampoo-green.jpg', 1),
(60, 5, 3, 4, 1.15, 280, '/img/variants/shampoo-green.jpg', 1),
(61, 6, 1, 1, 0.55, 500, '/img/variants/detergent-clear.jpg', 1),
(62, 6, 1, 2, 0.70, 450, '/img/variants/detergent-clear.jpg', 1),
(63, 6, 1, 3, 0.85, 400, '/img/variants/detergent-clear.jpg', 1),
(64, 6, 1, 4, 1.05, 350, '/img/variants/detergent-clear.jpg', 1),
(65, 6, 2, 1, 0.60, 480, '/img/variants/detergent-blue.jpg', 1),
(66, 6, 2, 2, 0.75, 430, '/img/variants/detergent-blue.jpg', 1),
(67, 6, 2, 3, 0.90, 380, '/img/variants/detergent-blue.jpg', 1),
(68, 6, 2, 4, 1.10, 330, '/img/variants/detergent-blue.jpg', 1),
(69, 6, 3, 1, 0.60, 480, '/img/variants/detergent-green.jpg', 1),
(70, 6, 3, 2, 0.75, 430, '/img/variants/detergent-green.jpg', 1),
(71, 6, 3, 3, 0.90, 380, '/img/variants/detergent-green.jpg', 1),
(72, 6, 3, 4, 1.10, 330, '/img/variants/detergent-green.jpg', 1),
(73, 6, 4, 1, 0.65, 460, '/img/variants/detergent-yellow.jpg', 1),
(74, 6, 4, 2, 0.80, 410, '/img/variants/detergent-yellow.jpg', 1),
(75, 6, 4, 3, 0.95, 360, '/img/variants/detergent-yellow.jpg', 1),
(76, 6, 4, 4, 1.15, 310, '/img/variants/detergent-yellow.jpg', 1),
(77, 8, 1, 1, 2.00, 200, '/img/variants/thermal-clear.jpg', 1),
(78, 8, 1, 2, 2.50, 180, '/img/variants/thermal-clear.jpg', 1),
(79, 8, 1, 3, 3.00, 150, '/img/variants/thermal-clear.jpg', 1),
(80, 8, 1, 4, 3.50, 120, '/img/variants/thermal-clear.jpg', 1),
(81, 8, 2, 1, 2.10, 190, '/img/variants/thermal-blue.jpg', 1),
(82, 8, 2, 2, 2.60, 170, '/img/variants/thermal-blue.jpg', 1),
(83, 8, 2, 3, 3.10, 140, '/img/variants/thermal-blue.jpg', 1),
(84, 8, 2, 4, 3.60, 110, '/img/variants/thermal-blue.jpg', 1),
(85, 8, 3, 1, 2.10, 190, '/img/variants/thermal-green.jpg', 1),
(86, 8, 3, 2, 2.60, 170, '/img/variants/thermal-green.jpg', 1),
(87, 8, 3, 3, 3.10, 140, '/img/variants/thermal-green.jpg', 1),
(88, 8, 3, 4, 3.60, 110, '/img/variants/thermal-green.jpg', 1),
(89, 9, 1, 1, 1.80, 300, '/img/variants/milktea-clear.jpg', 1),
(90, 9, 1, 2, 2.20, 270, '/img/variants/milktea-clear.jpg', 1),
(91, 9, 1, 3, 2.60, 240, '/img/variants/milktea-clear.jpg', 1),
(92, 9, 1, 4, 3.00, 210, '/img/variants/milktea-clear.jpg', 1),
(93, 9, 2, 1, 1.85, 290, '/img/variants/milktea-blue.jpg', 1),
(94, 9, 2, 2, 2.25, 260, '/img/variants/milktea-blue.jpg', 1),
(95, 9, 2, 3, 2.65, 230, '/img/variants/milktea-blue.jpg', 1),
(96, 9, 2, 4, 3.05, 200, '/img/variants/milktea-blue.jpg', 1),
(97, 9, 3, 1, 1.85, 290, '/img/variants/milktea-green.jpg', 1),
(98, 9, 3, 2, 2.25, 260, '/img/variants/milktea-green.jpg', 1),
(99, 9, 3, 3, 2.65, 230, '/img/variants/milktea-green.jpg', 1),
(100, 9, 3, 4, 3.05, 200, '/img/variants/milktea-green.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_count`
--

CREATE TABLE `visitor_count` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor_count`
--

INSERT INTO `visitor_count` (`id`, `date`, `count`) VALUES
(1, '2025-11-27', 10),
(2, '2025-11-28', 4),
(3, '2025-11-29', 7),
(4, '2025-11-30', 1),
(5, '2025-12-01', 2),
(6, '2025-12-02', 4),
(7, '2025-12-04', 5),
(8, '2025-12-05', 2),
(9, '2025-12-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `volume`
--

CREATE TABLE `volume` (
  `VolumeID` int(11) NOT NULL,
  `VolumeValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volume`
--

INSERT INTO `volume` (`VolumeID`, `VolumeValue`) VALUES
(1, '500ml'),
(2, '1L'),
(3, '1.5L'),
(4, '2L');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`BlogID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `colour`
--
ALTER TABLE `colour`
  ADD PRIMARY KEY (`ColourID`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_favorite` (`AccountID`,`ProductID`),
  ADD KEY `AccountID` (`AccountID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedBackID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `AccountID` (`AccountID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `productvariant`
--
ALTER TABLE `productvariant`
  ADD PRIMARY KEY (`VariantID`),
  ADD UNIQUE KEY `unique_variant` (`ProductID`,`ColourID`,`VolumeID`),
  ADD KEY `ColourID` (`ColourID`),
  ADD KEY `VolumeID` (`VolumeID`);

--
-- Indexes for table `visitor_count`
--
ALTER TABLE `visitor_count`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_date` (`date`);

--
-- Indexes for table `volume`
--
ALTER TABLE `volume`
  ADD PRIMARY KEY (`VolumeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `BlogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colour`
--
ALTER TABLE `colour`
  MODIFY `ColourID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedBackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `productvariant`
--
ALTER TABLE `productvariant`
  MODIFY `VariantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `visitor_count`
--
ALTER TABLE `visitor_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
