
createdb catalog_capstone

CREATE TABLE book (  
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(50),
  cover_state VARCHAR(10)
  PRIMARY KEY(id)
  CONSTRAINT genre_id_fk
    FOREIGN KEY (genre_id)
    REFERENCES genre (id),
  CONSTRAINT source_id_fk
    FOREIGN KEY (source_id)
    REFERENCES source (id),
  CONSTRAINT author_id_fk
    FOREIGN KEY (author_id)
    REFERENCES author (id),
  CONSTRAINT label_id_fk
    FOREIGN KEY (label_id)
    REFERENCES label (id)
)

CREATE TABLE label (
  id int GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(50),
  color VARCHAR(50),
  PRIMARY KEY (id)
)