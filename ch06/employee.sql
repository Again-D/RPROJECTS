-- 1. `employee` 테이블 생성
CREATE TABLE IF NOT EXISTS employee (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);

-- 2. 더미 데이터 삽입
INSERT INTO employee (name, position, salary) VALUES ('John Doe', 'Manager', 75000.00);
INSERT INTO employee (name, position, salary) VALUES ('Jane Smith', 'Developer', 68000.00);
INSERT INTO employee (name, position, salary) VALUES ('Alice Johnson', 'Analyst', 62000.00);
INSERT INTO employee (name, position, salary) VALUES ('Bob Brown', 'Designer', 58000.00);
INSERT INTO employee (name, position, salary) VALUES ('Carol White', 'HR Specialist', 54000.00);
INSERT INTO employee (name, position, salary) VALUES ('David Black', 'Developer', 70000.00);
INSERT INTO employee (name, position, salary) VALUES ('Eva Green', 'Marketing', 60000.00);
INSERT INTO employee (name, position, salary) VALUES ('Frank Miller', 'Sales', 55000.00);
INSERT INTO employee (name, position, salary) VALUES ('Grace Lee', 'Accountant', 57000.00);
