DROP DATABASE IF EXISTS umt_gaming_room;

CREATE DATABASE IF NOT EXISTS umt_gaming_room;
USE umt_gaming_room;

CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,

    role ENUM('student', 'ajk', 'advisor') NOT NULL
);

CREATE TABLE student_profile (
    student_id VARCHAR(50) PRIMARY KEY,
    matric_no VARCHAR(20) UNIQUE NOT NULL,
    faculty VARCHAR(100),
    is_member TINYINT(1) DEFAULT 0,

    FOREIGN KEY (student_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE ajk_profile (
    ajk_id VARCHAR(50) PRIMARY KEY,
    staff_id VARCHAR(20) UNIQUE NOT NULL,
    position VARCHAR(100),

    FOREIGN KEY (ajk_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE advisor_profile (
    advisor_id VARCHAR(50) PRIMARY KEY,
    staff_id VARCHAR(20) UNIQUE NOT NULL,
    faculty VARCHAR(100),

    FOREIGN KEY (advisor_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE pricing(
    pricing_id VARCHAR(50) PRIMARY KEY,
    station_type VARCHAR(50) NOT NULL,
    base_price_per_hour DECIMAL(6,2) NOT NULL,
    happy_hour DECIMAL(3,2) NOT NULL DEFAULT 1.00
);

CREATE TABLE gaming_station (
    station_id VARCHAR(20) PRIMARY KEY,
    pricing_id VARCHAR(50),
    station_name VARCHAR(50) NOT NULL,
    specifications TEXT,
    status ENUM('available', 'occupied', 'maintenance') DEFAULT 'available',
    FOREIGN KEY (pricing_id) REFERENCES pricing(pricing_id) ON DELETE SET NULL
);

CREATE TABLE time_slot (
    slot_id VARCHAR(50) PRIMARY KEY,
    station_id VARCHAR(20),
    slot_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    is_available TINYINT(1) DEFAULT 1,
    FOREIGN KEY (station_id) REFERENCES gaming_station(station_id) ON DELETE CASCADE
);

CREATE TABLE booking (
    booking_id VARCHAR(50) PRIMARY KEY,
    student_id VARCHAR(50),
    station_id VARCHAR(20),
    slot_id VARCHAR(50),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'approved', 'completed', 'cancelled') DEFAULT 'pending',
    total_price DECIMAL(6,2),
    FOREIGN KEY (student_id) REFERENCES student_profile(student_id),
    FOREIGN KEY (station_id) REFERENCES gaming_station(station_id),
    FOREIGN KEY (slot_id) REFERENCES time_slot(slot_id)
);

CREATE TABLE payment (
    payment_id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    amount DECIMAL(6,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    proof_image_url VARCHAR(255),
    status ENUM('pending', 'verified', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE
);

CREATE TABLE staff_schedule (
    schedule_id VARCHAR(50) PRIMARY KEY,
    advisor_id VARCHAR(50),
    ajk_id VARCHAR(50),
    shift_date DATE NOT NULL,
    duty_role VARCHAR(100),
    is_assigned TINYINT(1) DEFAULT 1,
    FOREIGN KEY (advisor_id) REFERENCES advisor_profile(advisor_id),
    FOREIGN KEY (ajk_id) REFERENCES ajk_profile(ajk_id)
);

CREATE TABLE announcement (
    announcement_id VARCHAR(50) PRIMARY KEY,
    ajk_id VARCHAR(50),
    title VARCHAR(150) NOT NULL,
    content TEXT,
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_published TINYINT(1) DEFAULT 1,
    FOREIGN KEY (ajk_id) REFERENCES ajk_profile(ajk_id)
);

CREATE TABLE notification (
    notification_id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50),
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read TINYINT(1) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


