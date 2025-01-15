-- Correções e melhorias no script SQL para o esquema 'ecommerce'

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4;
USE `ecommerce`;

-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(100) NULL,
  `Descricao` VARCHAR(255) NULL,
  `Valor` DECIMAL(14,2) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `RazaoSocial` VARCHAR(100) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `Contato` VARCHAR(100) NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE (`CNPJ`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produtos_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos_Fornecedor` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` FLOAT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `idx_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_Produtos_Fornecedor_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `Fornecedor` (`idFornecedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produtos_Fornecedor_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `Local` VARCHAR(100) NOT NULL,
  `Quantidade` FLOAT NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produtos_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos_Estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Localizacao` VARCHAR(255) NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  INDEX `idx_Estoque` (`Estoque_idEstoque`),
  CONSTRAINT `fk_Produtos_Estoque_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produtos_Estoque_Estoque`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `Estoque` (`idEstoque`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Endereco` VARCHAR(255) NULL,
  `CPF` CHAR(11) NOT NULL,
  `Dt_Nascimento` DATE NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE (`CPF`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `StatusPedido` ENUM('Em Andamento', 'Processado', 'Enviado', 'Entregue') NOT NULL DEFAULT 'Em Andamento',
  `Descricao` VARCHAR(255) NULL,
  `Frete` DECIMAL(14,2) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `idx_Cliente` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produtos_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos_Pedido` (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` DECIMAL(14,2) NOT NULL,
  `Status` ENUM('Disponivel', 'Sem Estoque') NOT NULL DEFAULT 'Disponivel',
  PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`),
  INDEX `idx_Pedido` (`Pedido_idPedido`),
  INDEX `idx_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_Produtos_Pedido_Pedido`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `Pedido` (`idPedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produtos_Pedido_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `RazaoSocial` VARCHAR(45) NOT NULL,
  `Local` VARCHAR(45) NULL,
  `NomeFantasia` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produtos_Vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos_Vendedores` (
  `Vendedor_idVendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` FLOAT NOT NULL,
  PRIMARY KEY (`Vendedor_idVendedor`, `Produto_idProduto`),
  INDEX `idx_Vendedor` (`Vendedor_idVendedor`),
  CONSTRAINT `fk_Produtos_Vendedores_Vendedor`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `Vendedor` (`idVendedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produtos_Vendedores_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
