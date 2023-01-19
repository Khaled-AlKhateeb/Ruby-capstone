-- genre Table
CREATE TABLE genres (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150),
    PRIMARY KEY (id)
);

-- Music-Album table
CREATE TABLE music_albums (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    genre_name VARCHAR(150),
    author_id INT,
    author_first_name VARCHAR(150),
    author_last_name VARCHAR(150),
    source_id INT,
    source_name VARCHAR(150),
    label_id INT,
    label_name VARCHAR(150),
    label_color VARCHAR(150),

    PRIMARY KEY (id),
    CONSTRAINT fk_genres
        FOREIGN KEY (genres_id)
            REFERENCES genres(id),
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES  author(id),
    CONSTRAINT fk_source
        FOREIGN KEY (source_id)
            REFERENCES  source(id),
    CONSTRAINT fk_label
        FOREIGN KEY (label_id)
            REFERENCES  label(id)
);

-- Label Table
CREATE TABLE labels (
  id SERIAL NOT NULL,
@@ -21,3 +60,4 @@ CREATE TABLE books (
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
)