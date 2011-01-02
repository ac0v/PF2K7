BEGIN TRANSACTION;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username   char(64)  NOT NULL DEFAULT '',
    password   char(64)  NOT NULL,
    email      char(64)  NOT NULL DEFAULT '',
    name       char(64)  NOT NULL DEFAULT '',
    town       char(64)  NOT NULL DEFAULT '',
    country    char(64)  NOT NULL DEFAULT '',
    motto1     char(256) NOT NULL DEFAULT '',
    motto2     char(256) NOT NULL DEFAULT '',
    likes      char(256) NOT NULL DEFAULT '',
    dislikes   char(256) NOT NULL DEFAULT '',
    gps        char(16)  NOT NULL DEFAULT '',
    enneagram1 int(8)    NOT NULL DEFAULT 0,
    enneagram2 int(8)    NOT NULL DEFAULT 0
);

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

COMMIT;
