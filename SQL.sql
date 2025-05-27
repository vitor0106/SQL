-- Criação do banco de dados
CREATE DATABASE EscolarClasse38;

-- Usar o banco de dados
USE EscolarClasse38;

-- Tabela de Alunos
CREATE TABLE Alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    matricula VARCHAR(20) UNIQUE,
    turma VARCHAR(20)
);

-- Tabela de Notas,Relacionada com a tabela Alunos
CREATE TABLE Notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id)
);

-- Inserir alunos
INSERT INTO Alunos (nome, matricula, turma) VALUES
('Ana Silva', 'A001', '1A'),
('Carlos Souza', 'A002', '1A'),
('Beatriz Lima', 'A003', '1B');


-- Inserir notas
INSERT INTO Notas (aluno_id, disciplina, nota) VALUES
(1, 'Matemática', 6.5),
(2, 'Matemática', 5.0),
(3, 'Matemática', 10.0);

-- Exibe as notas dos alunos com seus nomes
SELECT a.nome, n.disciplina, n.nota
FROM Alunos a
INNER JOIN Notas n ON a.id = n.aluno_id;

-- Exibe todos os alunos e suas notas
SELECT a.nome, n.disciplina, n.nota
FROM Alunos a
LEFT JOIN Notas n ON a.id = n.aluno_id;

-- Média de notas por turma
SELECT a.turma, AVG(n.nota) AS media_notas
FROM Alunos a
INNER JOIN Notas n ON a.id = n.aluno_id
GROUP BY a.turma;

-- Exibe turmas com média maior que 5
SELECT a.turma, AVG(n.nota) AS media_notas
FROM Alunos a
INNER JOIN Notas n ON a.id = n.aluno_id
GROUP BY a.turma
HAVING AVG(n.nota) > 5;

-- Atualiza a nota da aluna Ana Silva em Matemática
UPDATE Notas
SET nota = 9.0
WHERE aluno_id = 1 AND disciplina = 'Matemática';

-- Remove a nota de Carlos Souza
DELETE FROM Notas
WHERE aluno_id = 2 AND disciplina = 'Matemática';



