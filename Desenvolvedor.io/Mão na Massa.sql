DROP TABLE alunos;

CREATE TABLE alunos
(
    id int PRIMARY KEY IDENTITY,
    nome VARCHAR(80) NOT NULL,
    cpf CHAR(11) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    estado CHAR(2) NOT NULL,
    data_nascimento DATE,
    ativo bit DEFAULT 1
)

CREATE TABLE categorias
(
    id int PRIMARY KEY IDENTITY,
    descricao VARCHAR(80) NOT NULL,
    cadastrado_em DATETIME DEFAULT GETDATE()
)

CREATE TABLE cursos
(
    id int PRIMARY KEY IDENTITY,
    categoria_id INT NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    total_horas INT NOT NULL,
    valor DECIMAL(12,2) NOT NULL DEFAULT 0,
    cadastrado_em DATETIME DEFAULT GETDATE(),
    ativo bit DEFAULT 1,
    CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id)
)

CREATE TABLE alunos_cursos
(
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    cadastrado_em DATETIME DEFAULT GETDATE(),
    CONSTRAINT pk_alunos_cursos PRIMARY KEY(aluno_id, curso_id),
    CONSTRAINT fk_aluno_id FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    CONSTRAINT fk_curso_id FOREIGN KEY (curso_id) REFERENCES cursos(id),
)

INSERT INTO alunos(nome, cpf, cidade, estado, data_nascimento) VALUES 
    ('Rafael',  '00000000001', 'Aracaju', 'SE', '2000-01-01'),
    ('Eduardo', '00000000002', 'São Paulo', 'SP', '2000-02-02'),
    ('Bruno', '00000000003', 'São Paulo', 'SP', '2000-03-03'),
    ('Tiago', '00000000004', 'Rio de Janeiro', 'RJ', '2000-04-04'),
    ('Heloysa', '00000000005', 'Aracaju', 'SE', '2000-05-05');

INSERT INTO categorias(descricao) VALUES
    ('Acesso a dados'),
    ('Seguranca'), 
    ('WEB');

INSERT INTO cursos(descricao, categoria_id, total_horas, valor) VALUES
    ('EF Core'                         ,1, 17, 300),
    ('SQL Server'                      ,1,  5, 200), 
    ('ASP.NET Core Enterprise'         ,3,  5, 200),
    ('Fundamentos de IdentityServer4'  ,2,  5, 200);

INSERT INTO alunos_cursos(aluno_id,curso_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (4, 4),
    (5, 1),
    (5, 2),
    (5, 3);

SELECT * FROM categorias;