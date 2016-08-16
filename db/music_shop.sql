DROP TABLE stock;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255),
  genre varchar(255),
  UNIQUE (name)
);

CREATE TABLE albums (
  id serial4 primary key,
  name varchar(255),
  artist_id int4 references artists(id) on delete cascade,
  UNIQUE (name)
);

CREATE TABLE stock (
  id serial4 primary key,
  album_id int4 references albums(id) on delete cascade,
  format varchar(255),
  stock_level int4,
  threshold int4,
  buy_price int4,
  sell_price int4
);
