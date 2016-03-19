-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 19-Mar-2016 às 14:28
-- Versão do servidor: 5.5.47-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `hackthon`
--
CREATE DATABASE IF NOT EXISTS `hackthon` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hackthon`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Administrador`
--

CREATE TABLE IF NOT EXISTS `Administrador` (
  `codAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_codUsuario` int(11) NOT NULL,
  `Unidade_codUnidade` int(11) NOT NULL,
  PRIMARY KEY (`codAdministrador`),
  KEY `fk_Administrador_Usuario1_idx` (`Usuario_codUsuario`),
  KEY `fk_Administrador_Unidade1_idx` (`Unidade_codUnidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cidade`
--

CREATE TABLE IF NOT EXISTS `Cidade` (
  `codCidade` int(11) NOT NULL AUTO_INCREMENT,
  `Estado_codEstado` int(11) NOT NULL,
  `uf` varchar(4) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codCidade`),
  KEY `fk_Cidade_Estado1_idx` (`Estado_codEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Estado`
--

CREATE TABLE IF NOT EXISTS `Estado` (
  `codEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `uf` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Paciente`
--

CREATE TABLE IF NOT EXISTS `Paciente` (
  `codPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `cor` char(15) DEFAULT NULL,
  `corid` int(11) DEFAULT NULL,
  `codigo` char(7) DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `emitido` tinyint(4) DEFAULT '0',
  `Administrador_codAdministrador` int(11) DEFAULT NULL,
  PRIMARY KEY (`codPaciente`),
  KEY `fk_Notícia_Administrador1_idx` (`Administrador_codAdministrador`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE IF NOT EXISTS `telefone` (
  `codtelefone` int(11) NOT NULL AUTO_INCREMENT,
  `ddd` varchar(5) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `Unidade_codUnidade` int(11) NOT NULL,
  PRIMARY KEY (`codtelefone`),
  KEY `fk_telefone_usu_Unidade1_idx` (`Unidade_codUnidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Unidade`
--

CREATE TABLE IF NOT EXISTS `Unidade` (
  `codUnidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `inscricaoEstadual` varchar(15) DEFAULT NULL,
  `endRua` char(200) DEFAULT NULL,
  `endNum` char(10) DEFAULT NULL,
  `endCep` char(10) DEFAULT NULL,
  `endBairro` char(20) DEFAULT NULL,
  `endComp` char(10) DEFAULT NULL,
  `habilitado_compra` tinyint(1) DEFAULT NULL,
  `Cidade_codCidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`codUnidade`),
  KEY `fk_Unidade_Cidade1_idx` (`Cidade_codCidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `codUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `email` char(45) NOT NULL,
  `senha` char(42) NOT NULL,
  PRIMARY KEY (`codUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Administrador`
--
ALTER TABLE `Administrador`
  ADD CONSTRAINT `fk_Administrador_Unidade1` FOREIGN KEY (`Unidade_codUnidade`) REFERENCES `Unidade` (`codUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Administrador_Usuario1` FOREIGN KEY (`Usuario_codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Cidade`
--
ALTER TABLE `Cidade`
  ADD CONSTRAINT `fk_Cidade_Estado1` FOREIGN KEY (`Estado_codEstado`) REFERENCES `Estado` (`codEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Paciente`
--
ALTER TABLE `Paciente`
  ADD CONSTRAINT `fk_Notícia_Administrador10` FOREIGN KEY (`Administrador_codAdministrador`) REFERENCES `Administrador` (`codAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_telefone_usu_Unidade1` FOREIGN KEY (`Unidade_codUnidade`) REFERENCES `Unidade` (`codUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Unidade`
--
ALTER TABLE `Unidade`
  ADD CONSTRAINT `fk_Unidade_Cidade1` FOREIGN KEY (`Cidade_codCidade`) REFERENCES `Cidade` (`codCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
