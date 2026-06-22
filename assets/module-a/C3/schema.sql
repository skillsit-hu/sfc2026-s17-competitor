CREATE TABLE C3_scores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  player_name VARCHAR(50) NOT NULL,
  score INT NOT NULL
);

INSERT INTO C3_scores (player_name, score) VALUES
  ('Alice', 980),
  ('Bob', 870),
  ('Charlie', 870),
  ('Diana', 1200),
  ('Ethan', 540);
