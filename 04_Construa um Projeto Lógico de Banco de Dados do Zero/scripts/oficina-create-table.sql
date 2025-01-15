-- Melhorias aplicadas ao script original da oficina mecânica

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8;
USE `oficina`;

-- -----------------------------------------------------
-- Tabela Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `CPF` CHAR(11) NOT NULL UNIQUE,
  `Endereco` VARCHAR(150) NULL,
  `Telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Veiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Placa` CHAR(7) NOT NULL UNIQUE,
  `Modelo` VARCHAR(50) NOT NULL,
  `Marca` VARCHAR(50) NOT NULL,
  `Ano` YEAR NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Equipe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `NomeEquipe` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEquipe`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB;

-- Inserindo dados iniciais na tabela Status
INSERT INTO `Status` (`Descricao`) VALUES ('Em Andamento'), ('Concluído');

-- -----------------------------------------------------
-- Tabela OrdemServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrdemServico` (
  `idOrdemServico` INT NOT NULL AUTO_INCREMENT,
  `idStatus` INT NOT NULL,
  `Descricao` VARCHAR(150) NOT NULL,
  `ValorTotal` DECIMAL(10,2) NULL,
  `DataEmissao` DATE NOT NULL,
  `DataConclusao` DATE NULL,
  `idVeiculo` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  PRIMARY KEY (`idOrdemServico`),
  FOREIGN KEY (`idStatus`) REFERENCES `Status` (`idStatus`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo` (`idVeiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Servico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(100) NOT NULL,
  `Valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Peca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(100) NOT NULL,
  `Valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idPeca`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela OrdemServico_has_Servico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrdemServico_has_Servico` (
  `idOrdemServico` INT NOT NULL,
  `idServico` INT NOT NULL,
  `Quantidade` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idOrdemServico`, `idServico`),
  FOREIGN KEY (`idOrdemServico`) REFERENCES `OrdemServico` (`idOrdemServico`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`idServico`) REFERENCES `Servico` (`idServico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela OrdemServico_has_Peca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrdemServico_has_Peca` (
  `idOrdemServico` INT NOT NULL,
  `idPeca` INT NOT NULL,
  `Quantidade` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idOrdemServico`, `idPeca`),
  FOREIGN KEY (`idOrdemServico`) REFERENCES `OrdemServico` (`idOrdemServico`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`idPeca`) REFERENCES `Peca` (`idPeca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Tabela Mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Endereco` VARCHAR(150) NULL,
  `Especialidade` VARCHAR(100) NULL,
  `idEquipe` INT NOT NULL,
  PRIMARY KEY (`idMecanico`),
  FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
