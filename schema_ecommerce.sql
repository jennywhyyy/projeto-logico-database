-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`Pessoa Física`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Pessoa Física` (
  `cod_pessoa_fisica` INT NOT NULL AUTO_INCREMENT,
  `CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`cod_pessoa_fisica`),
  UNIQUE INDEX `idPessoa Física_UNIQUE` (`cod_pessoa_fisica` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Pessoa Jurídica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Pessoa Jurídica` (
  `cod_pessoa_juridica` INT NOT NULL AUTO_INCREMENT,
  `CNPJ` CHAR(14) NOT NULL,
  PRIMARY KEY (`cod_pessoa_juridica`),
  UNIQUE INDEX `idPessoa Jurídica_UNIQUE` (`cod_pessoa_juridica` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Endereço de entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Endereço de entrega` (
  `cod_endereço` INT NOT NULL AUTO_INCREMENT,
  `CEP` CHAR(8) NOT NULL,
  `Número` CHAR(2) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  `Frete` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`cod_endereço`),
  UNIQUE INDEX `idEndereço_UNIQUE` (`cod_endereço` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Cliente` (
  `cod_cliente` INT NOT NULL AUTO_INCREMENT,
  `cpf` CHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `primeiro_nome` VARCHAR(20) NOT NULL,
  `segundo_nome` VARCHAR(20) NULL,
  `sobrenome` VARCHAR(20) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereço_cobrança` VARCHAR(45) NOT NULL,
  `cod_pessoa_fisica` INT NOT NULL,
  `cod_pessoa_juridica` INT NOT NULL,
  `cod_endereço` INT NOT NULL,
  UNIQUE INDEX `idCliente_UNIQUE` (`cod_cliente` ASC) VISIBLE,
  PRIMARY KEY (`cod_cliente`, `cod_pessoa_fisica`, `cod_pessoa_juridica`, `cod_endereço`),
  UNIQUE INDEX `CPF_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Cliente_Pessoa Física1_idx` (`cod_pessoa_fisica` ASC) VISIBLE,
  INDEX `fk_Cliente_Pessoa Jurídica1_idx` (`cod_pessoa_juridica` ASC) VISIBLE,
  INDEX `fk_Cliente_Endereço1_idx` (`cod_endereço` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pessoa Física1`
    FOREIGN KEY (`cod_pessoa_fisica`)
    REFERENCES `ecommerce`.`Pessoa Física` (`cod_pessoa_fisica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Pessoa Jurídica1`
    FOREIGN KEY (`cod_pessoa_juridica`)
    REFERENCES `ecommerce`.`Pessoa Jurídica` (`cod_pessoa_juridica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Endereço1`
    FOREIGN KEY (`cod_endereço`)
    REFERENCES `ecommerce`.`Endereço de entrega` (`cod_endereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Vendedor Terceirizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Vendedor Terceirizado` (
  `cod_vendedor` INT NOT NULL AUTO_INCREMENT,
  `razão_social` VARCHAR(45) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `localização` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  PRIMARY KEY (`cod_vendedor`),
  UNIQUE INDEX `idVendedor_UNIQUE` (`cod_vendedor` ASC) VISIBLE,
  UNIQUE INDEX `Razão social_UNIQUE` (`razão_social` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `Contato_UNIQUE` (`contato` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Produto` (
  `cod_produto` INT NOT NULL AUTO_INCREMENT,
  `descrição` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NOT NULL,
  `categoria` ENUM('Eletrônicos', 'Decoração', 'Ferramentas', 'Alimentação', 'Vestuário') NOT NULL,
  `avaliação_produto` FLOAT NULL DEFAULT 0,
  PRIMARY KEY (`cod_produto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`cod_produto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Entrega` (
  `cod_postagem` INT NOT NULL AUTO_INCREMENT,
  `código_rastreio` CHAR(13) NOT NULL,
  `status` ENUM('Não enviado', 'Enviado', 'A caminho', 'Entregue') NOT NULL DEFAULT 'Não enviado',
  PRIMARY KEY (`cod_postagem`),
  UNIQUE INDEX `idEntrega_UNIQUE` (`cod_postagem` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Pagamento` (
  `cod_pagamento` INT NOT NULL AUTO_INCREMENT,
  `status` ENUM('Processando', 'Confirmado', 'Negado') NOT NULL DEFAULT 'Processando',
  `modo_pagamento` ENUM('Crédito', 'Débito', 'Boleto') NOT NULL DEFAULT 'Crédito',
  `cod_cliente` INT NOT NULL,
  `Cliente_cod_pessoa_fisica` INT NOT NULL,
  `Cliente_cod_pessoa_juridica` INT NOT NULL,
  `Cliente_cod_endereço` INT NOT NULL,
  PRIMARY KEY (`cod_pagamento`, `cod_cliente`, `Cliente_cod_pessoa_fisica`, `Cliente_cod_pessoa_juridica`, `Cliente_cod_endereço`),
  UNIQUE INDEX `idPagamento_UNIQUE` (`cod_pagamento` ASC) VISIBLE,
  INDEX `fk_Pagamento_Cliente1_idx` (`cod_cliente` ASC, `Cliente_cod_pessoa_fisica` ASC, `Cliente_cod_pessoa_juridica` ASC, `Cliente_cod_endereço` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Cliente1`
    FOREIGN KEY (`cod_cliente` , `Cliente_cod_pessoa_fisica` , `Cliente_cod_pessoa_juridica` , `Cliente_cod_endereço`)
    REFERENCES `ecommerce`.`Cliente` (`cod_cliente` , `cod_pessoa_fisica` , `cod_pessoa_juridica` , `cod_endereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Pedido` (
  `cod_pedido` INT NOT NULL AUTO_INCREMENT,
  `status_pedido` ENUM('Em análise', 'Em andamento', 'Enviado', 'Entregue') NULL DEFAULT 'Em andamento',
  `descrição` VARCHAR(45) NULL,
  `cod_postagem` INT NOT NULL,
  `cod_cliente` INT NOT NULL,
  `cod_pessoa_fisica` INT NOT NULL,
  `cod_pessoa_juridica` INT NOT NULL,
  `cod_pagamento` INT NOT NULL,
  `cod_endereço` INT NOT NULL,
  PRIMARY KEY (`cod_pedido`, `cod_postagem`, `cod_cliente`, `cod_pessoa_fisica`, `cod_pessoa_juridica`, `cod_pagamento`, `cod_endereço`),
  UNIQUE INDEX `idPedido_UNIQUE` (`cod_pedido` ASC) VISIBLE,
  INDEX `fk_Pedido_Entrega1_idx` (`cod_postagem` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`cod_cliente` ASC, `cod_pessoa_fisica` ASC, `cod_pessoa_juridica` ASC) VISIBLE,
  INDEX `fk_Pedido_Pagamento1_idx` (`cod_pagamento` ASC) VISIBLE,
  INDEX `fk_Pedido_Endereço1_idx` (`cod_endereço` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`cod_postagem`)
    REFERENCES `ecommerce`.`Entrega` (`cod_postagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`cod_cliente` , `cod_pessoa_fisica` , `cod_pessoa_juridica`)
    REFERENCES `ecommerce`.`Cliente` (`cod_cliente` , `cod_pessoa_fisica` , `cod_pessoa_juridica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pagamento1`
    FOREIGN KEY (`cod_pagamento`)
    REFERENCES `ecommerce`.`Pagamento` (`cod_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Endereço1`
    FOREIGN KEY (`cod_endereço`)
    REFERENCES `ecommerce`.`Endereço de entrega` (`cod_endereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Estoque` (
  `cod_estoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`cod_estoque`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`cod_estoque` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Fornecedor` (
  `cod_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `razão_social` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_fornecedor`),
  UNIQUE INDEX `idFornecedor_UNIQUE` (`cod_fornecedor` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `Razão Social_UNIQUE` (`razão_social` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `Contato_UNIQUE` (`contato` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Relação de produto por pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Relação de produto por pedido` (
  `cod_produto` INT NOT NULL,
  `cod_pedido` INT NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `status` ENUM('Disponível', 'Indisponível') NOT NULL DEFAULT 'Disponível',
  PRIMARY KEY (`cod_produto`, `cod_pedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`cod_pedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`cod_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `ecommerce`.`Produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`cod_pedido`)
    REFERENCES `ecommerce`.`Pedido` (`cod_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Fornecimento de produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Fornecimento de produto` (
  `cod_produto` INT NOT NULL,
  `cod_fornecedor` INT NOT NULL,
  `quantidade` INT NULL DEFAULT 1,
  PRIMARY KEY (`cod_produto`, `cod_fornecedor`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`cod_fornecedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto1_idx` (`cod_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `ecommerce`.`Produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`cod_fornecedor`)
    REFERENCES `ecommerce`.`Fornecedor` (`cod_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Produto em estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Produto em estoque` (
  `cod_produto` INT NOT NULL,
  `cod_estoque` INT NOT NULL,
  `quantidade` INT NULL DEFAULT 0,
  PRIMARY KEY (`cod_produto`, `cod_estoque`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`cod_estoque` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`cod_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `ecommerce`.`Produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`cod_estoque`)
    REFERENCES `ecommerce`.`Estoque` (`cod_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`Venda de Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`Venda de Produto` (
  `cod_produto` INT NOT NULL,
  `cod_vendedor` INT NOT NULL,
  `quantidade` INT NULL DEFAULT 1,
  PRIMARY KEY (`cod_produto`, `cod_vendedor`),
  INDEX `fk_Produto_has_Vendedor Terceirizado_Vendedor Terceirizado1_idx` (`cod_vendedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Vendedor Terceirizado_Produto1_idx` (`cod_produto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Vendedor Terceirizado_Produto1`
    FOREIGN KEY (`cod_produto`)
    REFERENCES `ecommerce`.`Produto` (`cod_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Vendedor Terceirizado_Vendedor Terceirizado1`
    FOREIGN KEY (`cod_vendedor`)
    REFERENCES `ecommerce`.`Vendedor Terceirizado` (`cod_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
  