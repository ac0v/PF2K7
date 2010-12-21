BEGIN TRANSACTION;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    email char(64) NOT NULL DEFAULT '',
    name char(64) NOT NULL DEFAULT '',
    town char(64) NOT NULL DEFAULT '',
    country char(64) NOT NULL DEFAULT '',
    motto1 char(256) NOT NULL DEFAULT '',
    motto2 char(256) NOT NULL DEFAULT '',
    username char(64) NOT NULL DEFAULT '',
    password char(64) NOT NULL,
    -- TODO - add lkes and dislikes
    gps char(16) NOT NULL DEFAULT '',
    enneagram1 int(8) NOT NULL DEFAULT 0,
    enneagram2 int(8) NOT NULL DEFAULT 0
);

-- INSERT INTO "users" VALUES(1,'friend','foDCGe8hfTtg.', 'active', NULL);
-- INSERT INTO "users" VALUES(2,'neighbor','baxXrXtQl0c6Y', 'active', NULL);

CREATE TABLE users_to_roles (
    user int(11) NOT NULL,
    role int(11) NOT NULL,
    PRIMARY KEY (user,role),
    FOREIGN KEY(user) REFERENCES users(id),
    FOREIGN KEY(role) REFERENCES roles(id)
);

-- INSERT INTO "users_to_roles" VALUES(1,1);

CREATE TABLE roles (
    id INTEGER PRIMARY KEY,
    role char(32) DEFAULT NULL);

-- INSERT INTO "roles" VALUES(1,'can_whisper');

-- CREATE TABLE ideas (
    -- id INTEGER PRIMARY KEY,
    -- text text NOT NULL,
    -- secret char(3) NOT NULL DEFAULT 'no',
    -- added char(20) NOT NULL DEFAULT 'unknown',
    -- added_by char(32) NOT NULL DEFAULT 'unknown'
-- );

-- INSERT INTO "ideas" VALUES(1,'I like food','no',
    -- 'Sun Apr 19 09:19:04 2009','SneakyCat');
-- INSERT INTO "ideas" VALUES(2,'I only eat salmon.','no',
    -- 'Sun Apr 19 10:55:53 2009','friend');
-- INSERT INTO "ideas" VALUES(3,'I like milk too.','yes',
    -- 'Sun Apr 19 10:56:02 2009', 'SneakyCat');
-- INSERT INTO "ideas" VALUES(4,'I hear a twitter.','no',
    -- 'Sun Apr 19 11:26:08 2009', 'SneakyCat');
-- INSERT INTO "ideas" VALUES(5,'I think I will eat it.','yes',
    -- 'Sun Apr 19 11:26:20 2009', 'SneakyCat');

COMMIT;
