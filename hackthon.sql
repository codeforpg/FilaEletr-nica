-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 06-Mar-2016 às 13:51
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidaDesconto`(IN AUX INT,IN AUXi INT, OUT resultado INT, OUT desconto FLOAT)
BEGIN
DECLARE vpp FLOAT;
DECLARE v  FLOAT;
DECLARE des FLOAT;

SET resultado = 1;
SET vpp = (SELECT `valorpromocional` FROM ProdutoPromocional o WHERE o.codProdutoPromocional = AUX);
SET v = (SELECT `preço` FROM produto o WHERE o.codProduto = AUXi);

SET des=v-vpp;

IF des <= 0 THEN
SET resultado = -1;
END IF;

SET desconto = des;
SET resultado = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarCEP`(IN AUX VARCHAR(9), OUT resultado INT)
BEGIN

	DECLARE CEP VARCHAR(9);

    SET  RESULTADO = 1;

    SET CEP = AUX;

    SET CEP = REPLACE(CEP,'-','');
    SET CEP = REPLACE(CEP,' ','');
    SET CEP = TRIM(CEP);

    IF CHAR_LENGTH(CEP) <= 7 THEN
    	SET RESULTADO = -1;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarCNPJ`(IN icnpj VARCHAR(20), OUT resposta INT)
BEGIN

	DECLARE cnpj VARCHAR(20);
    DECLARE RESULTADO TINYINT(4);
    DECLARE indice, soma, dig1, dig2 INT;
    SET resposta = 1;
    SET cnpj = icnpj;

	IF (SELECT COUNT(*) FROM Unidade o WHERE o.cnpj = AUX) THEN
		SET resultado = -1;
	END IF;


    /* Calculo do digito 1 */
    SET indice = 1;
    SET soma = 0;
    WHILE (indice <= 12) do
		IF (indice <= 4) THEN
			SET soma = soma + cast(substring(cnpj, indice, 1) AS unsigned) * (6 - indice);SET indice = indice + 1;
		ELSE
            SET soma = soma	+ cast(substring(cnpj, indice, 1) AS unsigned) * (14 - indice);SET indice = indice + 1;
		END IF;
	END WHILE;
    SET dig1 = 11 - (soma % 11);
    IF dig1 > 9 then
		SET dig1 = 0;
	END IF;

	/* Calculo do digito 2 */
    SET indice = 1;
    SET soma = 0;
    WHILE (indice <= 13) do
		IF (indice <= 5) THEN
			SET soma = soma     + cast(substring(cnpj, indice, 1) AS unsigned) * (7 - indice);
			SET indice = indice + 1;
		ELSE
			SET soma = soma     + cast(substring(cnpj, indice, 1) AS unsigned) * (15 - indice);
            SET indice = indice + 1;
		END IF;
    END WHILE;
    SET dig2 = 11 - (soma % 11);
    IF dig2 > 9 then
		SET dig2 = 0;
	END IF;

	/* Validando */
    IF ((dig1 = Substring(cnpj, Length(cnpj)-1, 1))
		AND ( dig2 = Substring(cnpj, Length(cnpj), 1))) then
		SET RESULTADO = true;
	else
		SET RESULTADO = false;

	END IF;

	IF (RESULTADO = FALSE) THEN
		Set resposta = -1;
	END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarCor`(IN AUX VARCHAR(6), OUT resultado INT)
BEGIN

	DECLARE Cor VARCHAR(6);

    SET  RESULTADO = 1;

    SET Cor = AUX;

    SET Cor = REPLACE(Cor,'#','');
    SET Cor = REPLACE(Cor,' ','');
    SET Cor = TRIM(Cor);

    IF CHAR_LENGTH(Cor) <= 5 THEN
    	SET RESULTADO = -1;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarData`(IN dataa TIMESTAMP, OUT resultado INT)
BEGIN
DECLARE agora  TIMESTAMP;
SET agora = CURRENT_TIMESTAMP;
  SET resultado = 1;
IF agora>dataa  THEN
  SET resultado = -1;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarDDD`(IN AUX VARCHAR(5), OUT resultado INT)
BEGIN

	DECLARE DDD VARCHAR(5);

    SET  RESULTADO = 1;

    SET DDD = AUX;

    SET DDD = REPLACE(DDD,'-','');
    SET DDD = REPLACE(DDD,'(','');
    SET DDD = REPLACE(DDD,' ','');
    SET DDD = REPLACE(DDD,')','');
    SET DDD = TRIM(DDD);

    IF CHAR_LENGTH(DDD) <= 1 THEN
    	SET RESULTADO = -1;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarEmail`(IN email VARCHAR(50), IN seletor INT, OUT resultado INT)
BEGIN
SET resultado = 1;

	IF seletor = 1 THEN
	IF (SELECT COUNT(*) FROM Usuario o WHERE o.email = AUX) THEN
		SET resultado = -1;
	END IF;
	END IF;

IF seletor = 2 THEN
	IF (SELECT COUNT(*) FROM Fornecedor o WHERE o.email = AUX) THEN
		SET resultado = -1;
	END IF;
	END IF;


 IF email NOT LIKE '%_@%_.__%' THEN
  SET resultado = -1;
 END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarIE`(IN AUX VARCHAR(15), OUT resultado INT)
BEGIN

	DECLARE IE VARCHAR(15);

    SET  RESULTADO = 1;

    SET IE = AUX;
	IF (SELECT COUNT(*) FROM Unidade o WHERE o.inscricaoEstadual = AUX) THEN
		SET resultado = -1;
	END IF;


    SET IE = REPLACE(IE,'.','');
    SET IE = REPLACE(IE,'-','');
    SET IE = REPLACE(IE,'/','');
    SET IE = REPLACE(IE,' ','');
    SET IE = TRIM(IE);

    IF CHAR_LENGTH(IE) <= 5 THEN
    	SET RESULTADO = -1;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarPeriodo`(IN datainicio TIMESTAMP,IN datafinal TIMESTAMP,OUT resultado INT)
BEGIN
  SET resultado = 1;
IF datainicio>datafinal  THEN
  SET resultado = -1;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarSenha`(IN senha VARCHAR(50), OUT resultado INT)
BEGIN
  SET resultado = 1;
IF CHAR_LENGTH(senha) <= 4  THEN
  SET resultado = -1;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarTel`(IN AUX VARCHAR(15), OUT resultado INT)
BEGIN

	DECLARE Tel VARCHAR(15);

    SET  RESULTADO = 1;

    SET Tel = AUX;

    SET Tel = REPLACE(Tel,'-','');
    SET Tel = REPLACE(Tel,' ','');
    SET Tel = TRIM(Tel);

    IF CHAR_LENGTH(Tel) <= 6 THEN
    	SET RESULTADO = -1;
    END IF;

END$$

DELIMITER ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

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
  ADD CONSTRAINT `fk_Administrador_Usuario1` FOREIGN KEY (`Usuario_codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Administrador_Unidade1` FOREIGN KEY (`Unidade_codUnidade`) REFERENCES `Unidade` (`codUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
