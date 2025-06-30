-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/06/2023 às 19:56
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cinebd2025`
--
CREATE DATABASE IF NOT EXISTS `cinebd2025` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cinebd2025`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes_assistidos`
--

DROP TABLE IF EXISTS `filmes_assistidos`;
CREATE TABLE `filmes_assistidos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `avaliacao` decimal(9,1) NOT NULL DEFAULT 0.0,
  `genero_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `filmes_assistidos`
--

INSERT INTO `filmes_assistidos` (`id`, `titulo`, `avaliacao`, `genero_id`) VALUES
(1, 'INTERESTELAR', 9.8, 2),
(2, 'AMOR A TODA PROVA', 9.7, 5),
(3, 'SIMPLESMENTE AMOR', 9.5, 5),
(4, 'GLADIADOR', 8.9, 7),
(5, 'DJANGO LIVRE', 9.3, 7),
(6, 'ENTRE FACAS E SEGREDOS', 9.5, 6),
(8, 'GRAVIDADE', 6.9, 2),
(9, 'PULP FICTION', 9.4, 7),
(10, 'AS BRANQUELAS', 5.4, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

DROP TABLE IF EXISTS `generos`;
CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`id`, `descricao`) VALUES
(7, 'AÇÃO'),
(3, 'COMÉDIA'),
(5, 'COMÉDIA ROMÂNTICA'),
(76, 'DRAMA'),
(2, 'FICÇÃO CIENTÍFICA'),
(1, 'INDEFINIDO'),
(10, 'ROMANCE'),
(6, 'SUSPENSE');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filmes_assistidos`
--
ALTER TABLE `filmes_assistidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_filme_titulo` (`titulo`),
  ADD KEY `fk_filmes_assistidos__genero_id` (`genero_id`);

--
-- Índices de tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx__generos_descricao` (`descricao`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filmes_assistidos`
--
ALTER TABLE `filmes_assistidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `filmes_assistidos`
--
ALTER TABLE `filmes_assistidos`
  ADD CONSTRAINT `fk_filmes_assistidos__genero_id` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
