-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/10/2023 às 05:27
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_educatech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `raAluno` varchar(7) NOT NULL,
  `nomeAluno` varchar(50) NOT NULL,
  `dataNascimento` date NOT NULL,
  `idTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`raAluno`, `nomeAluno`, `dataNascimento`, `idTurma`) VALUES
('0988977', 'Caio Felipe Silva', '0000-00-00', 8),
('1234569', 'Henry Smith ', '2017-04-07', 3),
('2023014', 'Amanda Saturno', '2017-04-06', 3),
('4565534', 'Bianca Batista', '0000-00-00', 8),
('4576768', 'Aline Dantas ', '0000-00-00', 9),
('6787898', 'David Vasconcelos', '0000-00-00', 8),
('7415269', 'Samy Alecrim ', '2017-08-10', 3),
('9696348', 'Patrick Leite', '2017-01-25', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `idAula` int(11) NOT NULL,
  `resumoAula` text DEFAULT NULL,
  `dataAula` date DEFAULT NULL,
  `idTurma` int(11) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idDIsciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `idCardapio` int(11) NOT NULL,
  `dataCardapio` date NOT NULL,
  `idRefeicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario_aula`
--

CREATE TABLE `comentario_aula` (
  `idComentario` int(11) NOT NULL,
  `nomeContato` varchar(50) NOT NULL,
  `dataComentario` date NOT NULL,
  `descComentario` text NOT NULL,
  `idAula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nomeDisciplina` varchar(35) NOT NULL,
  `fundamental1` tinyint(1) NOT NULL,
  `fundamental2` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `nomeDisciplina`, `fundamental1`, `fundamental2`) VALUES
(1, 'Educação básica (Fundamental I)', 1, 0),
(2, 'Artes', 0, 1),
(3, 'Ciências', 0, 1),
(4, 'Educação Fisica', 1, 1),
(5, 'Geografia', 0, 1),
(6, 'História', 0, 1),
(7, 'Língua portuguesa', 0, 1),
(8, 'Língua inglesa', 1, 1),
(9, 'Matemática', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `docente_disciplina`
--

CREATE TABLE `docente_disciplina` (
  `idUsuario` int(11) DEFAULT NULL,
  `idDisciplina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `docente_disciplina`
--

INSERT INTO `docente_disciplina` (`idUsuario`, `idDisciplina`) VALUES
(11, 1),
(11, 7),
(11, 8),
(13, 2),
(13, 6),
(14, 3),
(14, 5),
(15, 7),
(15, 8),
(16, 4),
(17, 9),
(18, 2),
(18, 3),
(19, 5),
(19, 9),
(20, 3),
(20, 6),
(21, 1),
(22, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `escola`
--

CREATE TABLE `escola` (
  `idEscola` int(11) NOT NULL,
  `nomeEscola` varchar(50) NOT NULL,
  `enderecoEscola` varchar(255) NOT NULL,
  `telefoneEscola` varchar(15) NOT NULL,
  `statusConta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `escola`
--

INSERT INTO `escola` (`idEscola`, `nomeEscola`, `enderecoEscola`, `telefoneEscola`, `statusConta`) VALUES
(13, 'E.E Luz e Paz ', 'Jandira - SP / Rua Dos Fantasmas  Nº: 96 / Bairro da Alegria', '(11) 4002-8922', 1),
(14, '', ' -  /  Nº:  / ', '', 1),
(15, '', ' -  /  Nº:  / ', '', 1),
(16, 'E.E Alessandro Cruz', 'Jandira - SP / Rua das Laranjeiras Nº: 456 / Centro', '(11) 2309-0965', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `media_aluno`
--

CREATE TABLE `media_aluno` (
  `raAluno` varchar(7) NOT NULL,
  `cicloBoletim` varchar(2) NOT NULL,
  `mediaAluno` float NOT NULL,
  `totalFaltas` int(11) NOT NULL,
  `totalPresenca` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia`
--

CREATE TABLE `noticia` (
  `idNoticia` int(11) NOT NULL,
  `dataNoticia` date NOT NULL,
  `tituloNoticia` varchar(50) NOT NULL,
  `descNoticia` text NOT NULL,
  `idEscola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `presenca_aula`
--

CREATE TABLE `presenca_aula` (
  `idAula` int(11) NOT NULL,
  `raAluno` varchar(7) NOT NULL,
  `presenca` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `refeicao`
--

CREATE TABLE `refeicao` (
  `idRefeicao` int(11) NOT NULL,
  `descRefeicao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefa_aula`
--

CREATE TABLE `tarefa_aula` (
  `idTarefa` int(11) NOT NULL,
  `idAula` int(11) NOT NULL,
  `descTarefa` text NOT NULL,
  `dataTarefa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL,
  `idEscola` int(11) NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `turma` varchar(1) NOT NULL,
  `periodo` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`idTurma`, `idEscola`, `ciclo`, `turma`, `periodo`) VALUES
(3, 13, '1', 'A', 'MANHÃ'),
(8, 13, '1', 'B', 'MANHÃ'),
(9, 13, '1', 'C', 'TARDE'),
(13, 13, '4', 'A', 'MANHÃ'),
(14, 13, '3', 'A', 'MANHÃ'),
(15, 13, '3', 'C', 'TARDE'),
(16, 13, '2', 'A', 'MANHÃ'),
(18, 13, '6', 'A', 'MANHÃ'),
(19, 13, '7', 'A', 'MANHÃ'),
(20, 13, '8', 'A', 'MANHÃ'),
(21, 13, '9', 'A', 'MANHÃ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_disciplina`
--

CREATE TABLE `turma_disciplina` (
  `idTurma` int(11) DEFAULT NULL,
  `idDisciplina` int(11) DEFAULT NULL,
  `aula` int(11) NOT NULL,
  `diaSemana` varchar(8) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turma_disciplina`
--

INSERT INTO `turma_disciplina` (`idTurma`, `idDisciplina`, `aula`, `diaSemana`, `idUsuario`) VALUES
(8, 7, 1, 'segunda', 11),
(8, 7, 2, 'segunda', 11),
(8, 2, 3, 'segunda', 11),
(8, 5, 4, 'segunda', 11),
(8, 5, 5, 'segunda', 11),
(8, 9, 1, 'terca', 11),
(8, 9, 2, 'terca', 11),
(8, 8, 3, 'terca', 15),
(8, 3, 4, 'terca', 11),
(8, 3, 5, 'terca', 11),
(8, 6, 1, 'quarta', 11),
(8, 6, 2, 'quarta', 11),
(8, 2, 3, 'quarta', 11),
(8, 4, 4, 'quarta', 16),
(8, 4, 5, 'quarta', 16),
(8, 8, 1, 'quinta', 15),
(8, 8, 2, 'quinta', 15),
(8, 2, 3, 'quinta', 11),
(8, 5, 4, 'quinta', 11),
(8, 4, 5, 'quinta', 16),
(8, 6, 1, 'sexta', 11),
(8, 3, 2, 'sexta', 11),
(8, 7, 3, 'sexta', 11),
(8, 9, 4, 'sexta', 11),
(8, 8, 5, 'sexta', 15),
(3, 2, 1, 'segunda', 21),
(3, 7, 2, 'segunda', 21),
(3, 7, 3, 'segunda', 21),
(3, 4, 4, 'segunda', 22),
(3, 4, 5, 'segunda', 22),
(3, 3, 1, 'terca', 21),
(3, 3, 2, 'terca', 21),
(3, 9, 3, 'terca', 21),
(3, 9, 4, 'terca', 21),
(3, 8, 5, 'terca', 15),
(3, 2, 1, 'quarta', 21),
(3, 2, 2, 'quarta', 21),
(3, 7, 3, 'quarta', 21),
(3, 5, 4, 'quarta', 21),
(3, 5, 5, 'quarta', 21),
(3, 6, 1, 'quinta', 21),
(3, 8, 2, 'quinta', 15),
(3, 8, 3, 'quinta', 15),
(3, 5, 4, 'quinta', 21),
(3, 2, 5, 'quinta', 21),
(3, 4, 1, 'sexta', 22),
(3, 7, 2, 'sexta', 21),
(3, 6, 3, 'sexta', 21),
(3, 3, 4, 'sexta', 21),
(3, 5, 5, 'sexta', 21),
(18, 4, 1, 'segunda', 22),
(18, 4, 2, 'segunda', 22),
(18, 8, 3, 'segunda', 15),
(18, 7, 4, 'segunda', 11),
(18, 7, 5, 'segunda', 11),
(18, 2, 1, 'terca', 18),
(18, 2, 2, 'terca', 18),
(18, 5, 3, 'terca', 19),
(18, 5, 4, 'terca', 19),
(18, 9, 5, 'terca', 17),
(18, 9, 1, 'quarta', 17),
(18, 9, 2, 'quarta', 17),
(18, 3, 3, 'quarta', 20),
(18, 3, 4, 'quarta', 20),
(18, 6, 5, 'quarta', 13),
(18, 7, 1, 'quinta', 11),
(18, 6, 2, 'quinta', 13),
(18, 6, 3, 'quinta', 13),
(18, 8, 4, 'quinta', 15),
(18, 8, 5, 'quinta', 15),
(18, 9, 1, 'sexta', 17),
(18, 5, 2, 'sexta', 19),
(18, 5, 3, 'sexta', 19),
(18, 3, 4, 'sexta', 20),
(18, 4, 5, 'sexta', 22),
(9, 2, 1, 'segunda', 11),
(9, 3, 2, 'segunda', 11),
(9, 3, 3, 'segunda', 11),
(9, 7, 4, 'segunda', 11),
(9, 7, 5, 'segunda', 11),
(9, 5, 1, 'terca', 11),
(9, 5, 2, 'terca', 11),
(9, 6, 3, 'terca', 11),
(9, 6, 4, 'terca', 11),
(9, 2, 5, 'terca', 11),
(9, 9, 1, 'quarta', 11),
(9, 9, 2, 'quarta', 11),
(9, 8, 3, 'quarta', 15),
(9, 4, 4, 'quarta', 16),
(9, 4, 5, 'quarta', 16),
(9, 3, 1, 'quinta', 11),
(9, 3, 2, 'quinta', 11),
(9, 8, 3, 'quinta', 15),
(9, 9, 4, 'quinta', 11),
(9, 9, 5, 'quinta', 11),
(9, 7, 1, 'sexta', 11),
(9, 7, 2, 'sexta', 11),
(9, 4, 3, 'sexta', 16),
(9, 6, 4, 'sexta', 11),
(9, 6, 5, 'sexta', 11),
(21, 2, 1, 'segunda', 18),
(21, 2, 2, 'segunda', 18),
(21, 5, 3, 'segunda', 19),
(21, 8, 4, 'segunda', 15),
(21, 8, 5, 'segunda', 15),
(21, 3, 1, 'terca', 20),
(21, 3, 2, 'terca', 20),
(21, 9, 3, 'terca', 17),
(21, 9, 4, 'terca', 17),
(21, 4, 5, 'terca', 22),
(21, 5, 1, 'quarta', 19),
(21, 5, 2, 'quarta', 19),
(21, 2, 3, 'quarta', 18),
(21, 6, 4, 'quarta', 13),
(21, 6, 5, 'quarta', 13),
(21, 7, 1, 'quinta', 11),
(21, 7, 2, 'quinta', 11),
(21, 5, 3, 'quinta', 19),
(21, 3, 4, 'quinta', 20),
(21, 4, 5, 'quinta', 22),
(21, 9, 1, 'sexta', 17),
(21, 9, 2, 'sexta', 17),
(21, 2, 3, 'sexta', 18),
(21, 2, 4, 'sexta', 18),
(21, 8, 5, 'sexta', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_fund1_responsavel`
--

CREATE TABLE `turma_fund1_responsavel` (
  `idTurma` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turma_fund1_responsavel`
--

INSERT INTO `turma_fund1_responsavel` (`idTurma`, `idUsuario`) VALUES
(8, 11),
(3, 21),
(9, 11),
(9, 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idEscola` int(11) NOT NULL,
  `nomeUsuario` varchar(50) NOT NULL,
  `cpfUsuario` varchar(11) NOT NULL,
  `emailUsuario` varchar(50) NOT NULL,
  `loginUsuario` varchar(20) NOT NULL,
  `senhaUsuario` varchar(20) NOT NULL,
  `tipoUsuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idEscola`, `nomeUsuario`, `cpfUsuario`, `emailUsuario`, `loginUsuario`, `senhaUsuario`, `tipoUsuario`) VALUES
(2, 13, 'Vanessa Silva', '11122233344', 'vanessa.silva@email.com', 'vanessa.silva', 'Fatec@2023!', 'admin-nivel-3'),
(6, 13, 'Felipe Mendes', '77744400032', 'felipe@email.com', 'felipe.mendes', 'Fatec@2023!', 'admin-nivel-2'),
(7, 13, 'Ana Trindade', '55544477778', 'ana@email.com', 'ana.trindade', 'Fatec@2023!', 'admin-nivel-1'),
(11, 13, 'Maria Isabel da Silva', '48411120209', 'mariaisa123@outlook.com', 'maria.silva', 'Fatec@2023!', 'docente'),
(13, 13, 'Terezinha de Jesus ', '01023319703', 'terezinha2000@outlook.com', 'terezinha.jesus', 'Fatec@2023!', 'docente'),
(14, 13, 'Marcelo Gomes Pereira ', '46195414111', 'marcelogm@gmail.com', 'marcelo.pereira', 'Fatec@2023!', 'docente'),
(15, 13, 'Lisandra Pires Silva', '46198080324', 'lisandra_123@gmail.com', 'lisandra.silva', 'Fatec@2023!', 'docente'),
(16, 13, 'Gustavo Silva', '91293461922', 'gustavosilva@hotmail.com', 'gustavo.silva', 'Fatec@2023', 'docente'),
(17, 13, 'Cícera Gonçalves ', '50070061235', 'cicera_gonc@gmail.com', 'cicera.gonçalves', 'Fatec@2023!', 'docente'),
(18, 13, 'Bianca Braund ', '30230299912', 'bianca@email.com', 'bianca.braund', 'Fatec@2023!', 'docente'),
(19, 13, 'Bruno Martins', '99944455500', 'brunoma@hotmail.com', 'bruno.martins', 'Fatec@2023!', 'docente'),
(20, 13, 'Adilson Guilherme Souza', '99896526514', 'adilsongui@outlook.com', 'adilson.souza', 'Fatec@2023!', 'docente'),
(21, 13, 'Luciana Pereira ', '10298943136', 'luciana123@yahoo.com', 'luciana.pereira', 'Fatec@2023!', 'docente'),
(22, 13, 'Camila Oliveira Santos', '30010026988', 'camila_santos@email.com', 'camila.santos', 'Fatec@2023!', 'docente'),
(24, 14, '', '', '', '', '', 'admin-nivel-3'),
(26, 16, 'Cadu Santos', '98453423009', 'cadu@email.com', 'cadu.santos', 'Fatec123', 'admin-nivel-3');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD UNIQUE KEY `raAluno` (`raAluno`),
  ADD KEY `idTurma` (`idTurma`);

--
-- Índices de tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`idAula`),
  ADD KEY `idTurma` (`idTurma`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idDIsciplina` (`idDIsciplina`);

--
-- Índices de tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`idCardapio`),
  ADD KEY `idRefeicao` (`idRefeicao`);

--
-- Índices de tabela `comentario_aula`
--
ALTER TABLE `comentario_aula`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idAula` (`idAula`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`);

--
-- Índices de tabela `docente_disciplina`
--
ALTER TABLE `docente_disciplina`
  ADD KEY `fk_idUsuario` (`idUsuario`),
  ADD KEY `fk_idDisciplina` (`idDisciplina`);

--
-- Índices de tabela `escola`
--
ALTER TABLE `escola`
  ADD PRIMARY KEY (`idEscola`);

--
-- Índices de tabela `media_aluno`
--
ALTER TABLE `media_aluno`
  ADD KEY `idDisciplina` (`idDisciplina`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `raAluno` (`raAluno`);

--
-- Índices de tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`idNoticia`),
  ADD KEY `idEscola` (`idEscola`);

--
-- Índices de tabela `presenca_aula`
--
ALTER TABLE `presenca_aula`
  ADD KEY `idAula` (`idAula`),
  ADD KEY `raAluno` (`raAluno`);

--
-- Índices de tabela `refeicao`
--
ALTER TABLE `refeicao`
  ADD PRIMARY KEY (`idRefeicao`);

--
-- Índices de tabela `tarefa_aula`
--
ALTER TABLE `tarefa_aula`
  ADD PRIMARY KEY (`idTarefa`),
  ADD KEY `idAula` (`idAula`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`),
  ADD KEY `idEscola` (`idEscola`);

--
-- Índices de tabela `turma_disciplina`
--
ALTER TABLE `turma_disciplina`
  ADD KEY `idTurma` (`idTurma`),
  ADD KEY `idDisciplina` (`idDisciplina`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices de tabela `turma_fund1_responsavel`
--
ALTER TABLE `turma_fund1_responsavel`
  ADD KEY `idTurma` (`idTurma`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `cpfUsuario` (`cpfUsuario`),
  ADD KEY `fk_idEscola` (`idEscola`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `idAula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `idCardapio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentario_aula`
--
ALTER TABLE `comentario_aula`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `escola`
--
ALTER TABLE `escola`
  MODIFY `idEscola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `idNoticia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `refeicao`
--
ALTER TABLE `refeicao`
  MODIFY `idRefeicao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tarefa_aula`
--
ALTER TABLE `tarefa_aula`
  MODIFY `idTarefa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON DELETE CASCADE,
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON DELETE CASCADE;

--
-- Restrições para tabelas `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON DELETE CASCADE,
  ADD CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `aula_ibfk_3` FOREIGN KEY (`idDIsciplina`) REFERENCES `disciplina` (`idDisciplina`);

--
-- Restrições para tabelas `cardapio`
--
ALTER TABLE `cardapio`
  ADD CONSTRAINT `cardapio_ibfk_1` FOREIGN KEY (`idRefeicao`) REFERENCES `refeicao` (`idRefeicao`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comentario_aula`
--
ALTER TABLE `comentario_aula`
  ADD CONSTRAINT `comentario_aula_ibfk_1` FOREIGN KEY (`idAula`) REFERENCES `aula` (`idAula`);

--
-- Restrições para tabelas `docente_disciplina`
--
ALTER TABLE `docente_disciplina`
  ADD CONSTRAINT `fk_idDisciplina` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Restrições para tabelas `media_aluno`
--
ALTER TABLE `media_aluno`
  ADD CONSTRAINT `media_aluno_ibfk_1` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_aluno_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_aluno_ibfk_3` FOREIGN KEY (`raAluno`) REFERENCES `aluno` (`raAluno`);

--
-- Restrições para tabelas `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `noticia_ibfk_1` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`) ON DELETE CASCADE;

--
-- Restrições para tabelas `presenca_aula`
--
ALTER TABLE `presenca_aula`
  ADD CONSTRAINT `presenca_aula_ibfk_1` FOREIGN KEY (`idAula`) REFERENCES `aula` (`idAula`) ON DELETE CASCADE,
  ADD CONSTRAINT `presenca_aula_ibfk_2` FOREIGN KEY (`raAluno`) REFERENCES `aluno` (`raAluno`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tarefa_aula`
--
ALTER TABLE `tarefa_aula`
  ADD CONSTRAINT `tarefa_aula_ibfk_1` FOREIGN KEY (`idAula`) REFERENCES `aula` (`idAula`) ON DELETE CASCADE;

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`) ON DELETE CASCADE;

--
-- Restrições para tabelas `turma_disciplina`
--
ALTER TABLE `turma_disciplina`
  ADD CONSTRAINT `turma_disciplina_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `turma_disciplina_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`),
  ADD CONSTRAINT `turma_disciplina_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Restrições para tabelas `turma_fund1_responsavel`
--
ALTER TABLE `turma_fund1_responsavel`
  ADD CONSTRAINT `turma_fund1_responsavel_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `turma_fund1_responsavel_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_idEscola` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
