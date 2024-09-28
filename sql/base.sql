CREATE DATABASE `VampireClan`;
CREATE DATABASE `VampireCity`;

CREATE TABLE `VampireClan`.`Clans` (
  `clan_id` CHAR(36) NOT NULL PRIMARY KEY DEFAULT UUID(),
  `clan_name` ENUM(
    'Caitiff',
    'Brujah',
    'Gangrel',
    'Malkavian',
    'Nosferatu',
    'Toreador',
    'Tremere',
    'Ventrue'
  ) DEFAULT 'Caitiff',
  `discipline_1` ENUM(
    'Animalism',
    'Auspex',
    'Celerity',
    'Dementation',
    'Dominate',
    'Fortitude',
    'Obfuscate',
    'Potence',
    'Presence',
    'Proteam',
    'Thaumaturgy'
  ) NOT NULL,
  `discipline_2` ENUM(
    'Animalism',
    'Auspex',
    'Celerity',
    'Dementation',
    'Dominate',
    'Fortitude',
    'Obfuscate',
    'Potence',
    'Presence',
    'Proteam',
    'Thaumaturgy'
  ) NOT NULL,
  `discipline_3` ENUM(
    'Animalism',
    'Auspex',
    'Celerity',
    'Dementation',
    'Dominate',
    'Fortitude',
    'Obfuscate',
    'Potence',
    'Presence',
    'Proteam',
    'Thaumaturgy'
  ) NOT NULL,
  `weakness` ENUM(
    'Uncontrolled Temper',
    'Bestial Features',
    'Madness',
    'Horrible Appearance',
    'Beauty Obsessed',
    'Refined Palate'
  ) NOT NULL
);

CREATE TABLE `VampireClan`.`Members` (
  `member_id` CHAR(36) NOT NULL PRIMARY KEY DEFAULT UUID(),
  `member_name` VARCHAR(50) NOT NULL,
  `clan_id` CHAR(36) NOT NULL,
  `generation` ENUM(
    '10th & 11th',
    '12th & 13th',
    '14th & 15th',
    '16th'
  ) NOT NULL,
  `sire` VARCHAR(50),
  `age` VARCHAR(5) NOT NULL,
  `haven` VARCHAR(80),
CONSTRAINT fk_clan_id FOREIGN KEY (clan_id) REFERENCES `VampireClan`.`Clans`(clan_id)
);

CREATE TABLE `VampireCity`.`Domains` (
  `domain_id` CHAR(36) NOT NULL PRIMARY KEY DEFAULT UUID(),
  `domain_name` VARCHAR(50) NOT NULL,
  `ruler_id` VARCHAR(50) NOT NULL,
  `population` VARCHAR(4) NOT NULL,
  `controlled_by_id` VARCHAR(36) NOT NULL,
CONSTRAINT fk_ruler_id FOREIGN KEY (ruler_id) REFERENCES `VampireClan`.`Members`(member_id),
CONSTRAINT fk_controlled_by_id FOREIGN KEY (controlled_by_id) REFERENCES `VampireClan`.`Clans` (clan_id)
);

CREATE TABLE `VampireCity`.`Locations` (
  `location_id` CHAR(36) NOT NULL PRIMARY KEY DEFAULT UUID(),
  `location_name` VARCHAR(50) NOT NULL,
  `domain_id` CHAR(36) NOT NULL,
  `type` ENUM(
    'Haven',
    'Elysium',
    'Hunting Ground'
  ) NOT NULL,
  `description` TINYTEXT NOT NULL,
  `security_level` ENUM(
    'Low',
    'Medium',
    'High'
  ) NOT NULL,
CONSTRAINT fk_domain_id FOREIGN KEY (domain_id) REFERENCES `VampireCity`.`Domains`(domain_id)
);