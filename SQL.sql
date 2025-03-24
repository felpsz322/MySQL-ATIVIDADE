ATIVIDADE 1 - CLINICA MEDICA

CREATE DATABASE IF NOT EXISTS db_clinica_medica
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_clinica_medica;

CREATE TABLE IF NOT EXISTS tb_paciente (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_especialidade(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_medico(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	nome VARCHAR(255) NOT NULL,
    	id_especialidade INTEGER, 
CONSTRAINT fk_especialidade_id FOREIGN KEY (id_especialidade) REFERENCES tb_especialidade (id)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_consulta(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	dt_consulta DATE NOT NULL,
	id_medico INTEGER NOT NULL,
	id_paciente INTEGER NOT NULL,
CONSTRAINT fk_medico_id FOREIGN KEY (id_medico) REFERENCES tb_medico (id),
CONSTRAINT fk_paciente_id FOREIGN KEY (id_paciente) REFERENCES tb_paciente (id)
) AUTO_INCREMENT = 1;




## ATIVIDADE 2 LIVROS

CREATE DATABASE IF NOT EXISTS db_emprestimo_livro
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_emprestimo_livro;

CREATE TABLE IF NOT EXISTS tb_autor(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_livro(
	titulo VARCHAR(255) NOT NULL,
    ano_publicacao DATE,
    id_livro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_autor INTEGER NOT NULL,
    CONSTRAINT fk_autor_id FOREIGN KEY (id_autor) REFERENCES tb_autor (id)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_usuario (
    id_user INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT UQ_email UNIQUE (email)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_emprestimo (
    id_emprestimo INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dt_emprestimo DATE NOT NULL,
    dt_devolucao DATE NOT NULL,
    id_livro INTEGER NOT NULL,
    id_user INTEGER NOT NULL,
    CONSTRAINT fk_livro_id_livro FOREIGN KEY (id_livro) REFERENCES tb_livro (id_livro),
    CONSTRAINT fk_user_id_user FOREIGN KEY (id_user) REFERENCES tb_usuario (id_user)
);

## Atividade 3 e-commerce

CREATE DATABASE ecommerce
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE ecommerce;

CREATE TABLE tb_produto(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco FLOAT(6,2) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_cliente(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
CONSTRAINT uq_email UNIQUE (email)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_pedido(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATE NOT NULL,
    id_cliente INTEGER,
CONSTRAINT fk_cliente_id FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id)
) AUTO_INCREMENT = 1;

CREATE TABLE pedido_produto(
    id_pedido INTEGER,
    id_produto INTEGER,
CONSTRAINT fk_pedido_id FOREIGN KEY (id_pedido) REFERENCES tb_pedido (id),
CONSTRAINT fk_produto_id FOREIGN KEY (id_produto) REFERENCES tb_produto (id)
);






## atividade 4 - ESCOLA DE MAGIA

CREATE DATABASE db_Escola_Magia
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_Escola_Magia;

CREATE TABLE tb_professor (
	nome VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT
) AUTO_INCREMENT = 1;

CREATE TABLE tb_feitico (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	dificuldade INTEGER
) AUTO_INCREMENT = 1;

CREATE TABLE tb_mago (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_aula(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	conteudo VARCHAR(255) NOT NULL,
	id_professor INTEGER NOT NULL,
CONSTRAINT fk_professor_id FOREIGN KEY (id_professor) REFERENCES tb_professor (id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_aula_mago(
	id_aula INTEGER,
	id_mago INTEGER,
CONSTRAINT fk_aula_id FOREIGN KEY (id_aula) REFERENCES tb_aula (id),
CONSTRAINT fk_mago_id FOREIGN KEY (id_mago) REFERENCES tb_mago (id)
);

CREATE TABLE tb_aula_feitico(
	id_aula2 INTEGER,
	id_feitico2 INTEGER NOT NULL,
CONSTRAINT fk_aula_id2 FOREIGN KEY (id_aula2) REFERENCES tb_aula (id),
CONSTRAINT fk_feitico_id2 FOREIGN KEY(id_feitico2) REFERENCES tb_feitico (id)
)





## ATIVIDADE 5 SUPERHUMANOS


CREATE DATABASE db_superhumanos
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_superhumanos;

CREATE TABLE tb_heroi (
	poder VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT
) AUTO_INCREMENT = 1;

CREATE TABLE tb_vilao (
	poder VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT
) AUTO_INCREMENT = 1;

CREATE TABLE tb_local (
	nome VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT
) AUTO_INCREMENT = 1;

CREATE TABLE tb_missao (
	nome VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_local INTEGER NOT NULL,
CONSTRAINT fk_local_id FOREIGN KEY (id_local) REFERENCES tb_local (id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_heroi_missao(
	id_heroi INTEGER NOT NULL,
	id_missao INTEGER NOT NULL,
CONSTRAINT fk_heroi_id FOREIGN KEY (id_heroi) REFERENCES tb_heroi (id),
CONSTRAINT fk_missao_id FOREIGN KEY (id_missao) REFERENCES tb_missao (id)
);

CREATE TABLE tb_missao_vilao(
	id_vilao INTEGER NOT NULL,
	id_missao2 INTEGER NOT NULL,
CONSTRAINT fk_vilao_id FOREIGN KEY (id_vilao) REFERENCES tb_vilao (id),
CONSTRAINT fk_missao_id2 FOREIGN KEY (id_missao2) REFERENCES tb_missao (id)
);





## ATIVIDADE 6 - PARQUE DIVERSAO

CREATE DATABASE db_parque_diversao
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_parque_diversao;

CREATE TABLE tb_visitante (
	nome VARCHAR(255) NOT NULL,
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	altura FLOAT(3,2) NOT NULL
) AUTO_INCREMENT = 1;



CREATE TABLE tb_ingresso_briquedo (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	altura_min FLOAT (3,2),
	valor FLOAT (6,2) NOT NULL,
	id_visitante INTEGER,
CONSTRAINT fk_visitante_id FOREIGN KEY (id_visitante) REFERENCES tb_visitante (id)
) AUTO_INCREMENT = 1;






## ATIVIDADE 7 - ZOOLOGICO

CREATE DATABASE db_zoologico
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_zoologico;

CREATE TABLE tb_especie(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR (255)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_cuidador(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_habitat (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	condicao_ambiental VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_animal (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	idade DATE NOT NULL,
	id_habitat INTEGER,
	id_especie INTEGER,
    CONSTRAINT fk_habitat_id FOREIGN KEY (id_habitat) REFERENCES tb_habitat(id),
    CONSTRAINT fk_especie_id FOREIGN KEY (id_especie) REFERENCES tb_especie(id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_cuidador_habitat(
	id_cuidador INTEGER,
	id_habitat2 INTEGER,
CONSTRAINT fk_cuidador_id FOREIGN KEY (id_cuidador) REFERENCES tb_cuidador (id),
CONSTRAINT fk_habitat_id2 FOREIGN KEY (id_habitat2) REFERENCES tb_habitat (id)
);





## ATIVIDADE 8 - LOJA DE QUADRINHOS

CREATE DATABASE db_loja_quadrinhos
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_loja_quadrinhos;

CREATE TABLE tb_cliente(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_autor(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_venda(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	valor FLOAT(6,2) NOT NULL,
	id_cliente INTEGER,
CONSTRAINT fk_cliente_id FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_quadrinho (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(255) NOT NULL,
    id_autor INTEGER,
CONSTRAINT fk_autor_id FOREIGN KEY (id_autor) REFERENCES tb_autor (id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_quadrinho_venda(
	id_quadrinho INTEGER,
	id_venda INTEGER,
CONSTRAINT fk_quadrinho_id FOREIGN KEY (id_quadrinho) REFERENCES tb_quadrinho (id),
CONSTRAINT fk_venda_id FOREIGN KEY (id_venda) REFERENCES tb_venda (id)
);





ATIVIDADE 9 RESTAURANTE 
CREATE DATABASE db_restaurante
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_restaurante;

CREATE TABLE tb_planeta(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_prato(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	ingrediente_principal VARCHAR (255) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tb_cliente (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (255) NOT NULL,
	id_planeta INTEGER,
CONSTRAINT fk_planeta_id FOREIGN KEY (id_planeta) REFERENCES tb_planeta (id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_pedido (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	valor INTEGER NOT NULL,
	id_cliente INTEGER,
CONSTRAINT fk_cliente_id FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id)
) AUTO_INCREMENT = 1;

CREATE TABLE tb_pedido_prato (
	id_prato INTEGER,
	id_pedido INTEGER,
CONSTRAINT fk_prato_id FOREIGN KEY (id_prato) REFERENCES tb_prato (id),
CONSTRAINT fk_pedido_id FOREIGN KEY (id_pedido) REFERENCES tb_pedido (id)
);



ATIVIDADE 10 - FILMES

CREATE DATABASE IF NOT EXISTS db_filme 
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_filme;

CREATE TABLE IF NOT EXISTS tb_diretor(
	nome VARCHAR (255) NOT NULL,
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nacionalidade VARCHAR(255)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_ator(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	nacionalidade VARCHAR(255)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_filme(
	titulo VARCHAR(255) NOT NULL,
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	ano_lancamento DATE NOT NULL,
	id_diretor INTEGER,
CONSTRAINT fk_diretor_id FOREIGN KEY (id_diretor) REFERENCES tb_diretor (id)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_autor_filme(
	id_ator INTEGER,
	id_filme INTEGER,
CONSTRAINT fk_ator_id FOREIGN KEY (id_ator) REFERENCES tb_ator (id),
CONSTRAINT fk_filme_id FOREIGN KEY (id_filme) REFERENCES tb_filme (id)
);
