PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
  like_id INTEGER PRIMARY KEY,
  -- amount_likes INTEGER NOT NULL, 
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Mike', 'M'),
  ('Paulo', 'B'),
  ('Sam', 'S'),
  ('Taylor', 'M'),
  ('Chris', 'D');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Circle Time', 'When is circle time?', (SELECT id FROM users WHERE fname = 'Mike')),
  ('Cameras on','Can everyone turn their cameras on?',(SELECT id FROM users WHERE fname = 'Taylor'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 2), --user 2 following question 1 (Mike's question is followed by Paulo)
  (2, 5), -- taylor's question is followed by chris
  (2, 4),
  (1, 3),
  (1, 5);


INSERT INTO
  replies (body, author_id, parent_id, question_id)
VALUES
  ('Circle time is at 5:30.', 3, NULL, 1),
  ('Actually, circle time is at 5:35.', 2, 1, 1),
  ('Sure thing!', 5, null, 2);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (1,2);

