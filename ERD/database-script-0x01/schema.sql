-- Table `User`
-- Stores information about both hosts and guests.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `User` (
  `user_id` VARCHAR(36) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `Property`
-- Stores information about the rental properties.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Property` (
  `property_id` VARCHAR(36) NOT NULL,
  `host_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `price_per_night` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  INDEX `fk_Property_User_idx` (`host_id` ASC),
  CONSTRAINT `fk_Property_User`
    FOREIGN KEY (`host_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `Booking`
-- Stores information about property bookings made by users.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Booking` (
  `booking_id` VARCHAR(36) NOT NULL,
  `property_id` VARCHAR(36) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `status` ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_Booking_Property_idx` (`property_id` ASC),
  INDEX `fk_Booking_User_idx` (`user_id` ASC),
  CONSTRAINT `fk_Booking_Property`
    FOREIGN KEY (`property_id`)
    REFERENCES `Property` (`property_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `Payment`
-- Stores payment information related to a booking.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payment` (
  `payment_id` VARCHAR(36) NOT NULL,
  `booking_id` VARCHAR(36) NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `payment_method` ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  `payment_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_Payment_Booking_idx` (`booking_id` ASC),
  CONSTRAINT `fk_Payment_Booking`
    FOREIGN KEY (`booking_id`)
    REFERENCES `Booking` (`booking_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `Review`
-- Stores reviews left by users for properties.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Review` (
  `review_id` VARCHAR(36) NOT NULL,
  `property_id` VARCHAR(36) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `rating` INT NOT NULL CHECK (`rating` >= 1 AND `rating` <= 5),
  `comment` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  INDEX `fk_Review_Property_idx` (`property_id` ASC),
  INDEX `fk_Review_User_idx` (`user_id` ASC),
  CONSTRAINT `fk_Review_Property`
    FOREIGN KEY (`property_id`)
    REFERENCES `Property` (`property_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Review_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `Message`
-- Stores messages exchanged between users.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Message` (
  `message_id` VARCHAR(36) NOT NULL,
  `sender_id` VARCHAR(36) NOT NULL,
  `recipient_id` VARCHAR(36) NOT NULL,
  `message_body` TEXT NOT NULL,
  `sent_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  INDEX `fk_Message_Sender_idx` (`sender_id` ASC),
  INDEX `fk_Message_Recipient_idx` (`recipient_id` ASC),
  CONSTRAINT `fk_Message_Sender`
    FOREIGN KEY (`sender_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Message_Recipient`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;