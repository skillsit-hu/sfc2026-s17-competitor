CREATE TABLE C2_products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  stock INT NOT NULL
);

INSERT INTO C2_products (id, name, stock) VALUES
  (1, 'Notebook', 10),
  (2, 'Pen', 50),
  (3, 'Eraser', 0);

