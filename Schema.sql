-- SCHEMAS of Database 

CREATE TABLE netflix (
    show_id        VARCHAR(5),
    type           VARCHAR(10),
    title          VARCHAR(250),
    director       TEXT,
    casts          TEXT,
    country        VARCHAR(250),
    date_added     VARCHAR(55),
    release_year   INT,
    rating         VARCHAR(15),
    duration       VARCHAR(15),
    listed_in      VARCHAR(250),
    description    TEXT
);
