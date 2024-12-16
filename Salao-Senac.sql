-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema salao_senac
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema salao_senac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `salao_senac` DEFAULT CHARACTER SET utf8mb3 ;
USE `salao_senac` ;

-- -----------------------------------------------------
-- Table `salao_senac`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`usuario` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `tipo_usuario` ENUM('Cliente', 'Funcionário') NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `salao_senac`.`cargo`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `salao_senac`.`cargo`;

CREATE TABLE IF NOT EXISTS `salao_senac`.`cargo` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `salao_senac`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`cliente` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`cliente` (
  `cpf_cliente` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(75) NOT NULL,
  `telefone` VARCHAR(12) NOT NULL,
  `usuario_cliente` INT NOT NULL,
  PRIMARY KEY (`cpf_cliente`),
  UNIQUE INDEX `usuario_cliente_UNIQUE` (`usuario_cliente` ASC) VISIBLE,
  CONSTRAINT `usuario_cliente`
    FOREIGN KEY (`usuario_cliente`)
    REFERENCES `salao_senac`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`funcionario` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`funcionario` (
  `matricula` VARCHAR(15) NOT NULL,
  `cpf_func` VARCHAR(14) NOT NULL,
  `usuario_func` INT NOT NULL,
  `nome` VARCHAR(75) NOT NULL,
  `telefone` VARCHAR(12) NOT NULL,
  `salario` DECIMAL(6,2) NOT NULL,
  `cargo_id` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `usuario_func_UNIQUE` (`usuario_func` ASC) VISIBLE,
  CONSTRAINT `usuario_func`
    FOREIGN KEY (`usuario_func`)
    REFERENCES `salao_senac`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cargo_id`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `salao_senac`.`cargo` (`id_cargo`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`agendamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`agendamento` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`agendamento` (
  `id_agendamento` INT NOT NULL AUTO_INCREMENT,
  `data_agendada` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `cliente_cpf` VARCHAR(14) NOT NULL,
  `matricula_func` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  INDEX `cliente_cpf_idx` (`cliente_cpf` ASC) VISIBLE,
  INDEX `matricula_func_idx` (`matricula_func` ASC) VISIBLE,
  CONSTRAINT `cliente_cpf`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `salao_senac`.`cliente` (`cpf_cliente`)
    ON DELETE CASCADE,
  CONSTRAINT `matricula_func`
    FOREIGN KEY (`matricula_func`)
    REFERENCES `salao_senac`.`funcionario` (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`atendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`atendimento` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`atendimento` (
  `id_atendimento` INT NOT NULL AUTO_INCREMENT,
  `agendamento_id` INT NOT NULL,
  `matricula_func` VARCHAR(15) NOT NULL,
  `duracao_mins` INT NOT NULL,
  PRIMARY KEY (`id_atendimento`),
  INDEX `agendamento_id_idx` (`agendamento_id` ASC) VISIBLE,
  INDEX `matricula_func_idx` (`matricula_func` ASC) VISIBLE,
  CONSTRAINT `agendamento_id2`
    FOREIGN KEY (`agendamento_id`)
    REFERENCES `salao_senac`.`agendamento` (`id_agendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `matricula_func4`
    FOREIGN KEY (`matricula_func`)
    REFERENCES `salao_senac`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`categorias` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_fornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`equipamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`equipamento` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`equipamento` (
  `id_equipamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `fornecedor_id` INT NOT NULL,
  `manutencao_recente` DATE NOT NULL,
  PRIMARY KEY (`id_equipamento`),
  INDEX `fornecedor_id_idx` (`fornecedor_id` ASC) VISIBLE,
  CONSTRAINT `fornecedor_id`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `salao_senac`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`feedback` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`feedback` (
  `id_feedback` INT NOT NULL AUTO_INCREMENT,
  `cliente_cpf` VARCHAR(14) NOT NULL,
  `atendimento_id` INT NOT NULL,
  `avaliacao` INT NOT NULL,
  `comentario` VARCHAR(200) NOT NULL,
  `selo_cortesia` ENUM('Sim', 'Não') NOT NULL,
  `selo_limpeza` ENUM('Sim', 'Não') NOT NULL,
  `selo_eficiencia` ENUM('Sim', 'Não') NOT NULL,
  `selo_satisfacao` ENUM('Sim', 'Não') NOT NULL,
  `selo_orientacao` ENUM('Sim', 'Não') NOT NULL,
  `matricula_func` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_feedback`),
  INDEX `cliente_id_idx` (`cliente_cpf` ASC) VISIBLE,
  INDEX `atendimento_id_idx` (`atendimento_id` ASC) VISIBLE,
  INDEX `matricula_func_idx` (`matricula_func` ASC) VISIBLE,
  CONSTRAINT `atendimento_id1`
    FOREIGN KEY (`atendimento_id`)
    REFERENCES `salao_senac`.`atendimento` (`id_atendimento`),
  CONSTRAINT `cliente_id1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `salao_senac`.`cliente` (`cpf_cliente`),
  CONSTRAINT `matricula_func1`
    FOREIGN KEY (`matricula_func`)
    REFERENCES `salao_senac`.`funcionario` (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`pagamento` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`pagamento` (
  `id_pagamento` INT NOT NULL AUTO_INCREMENT,
  `metodo_pag` ENUM('Crédito', 'Débito', 'Pix', 'Dinheiro') NOT NULL,
  `valor` DECIMAL(7,2) NOT NULL,
  `data_venda` TIME NOT NULL,
  `cliente_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  INDEX `cliente_cpf_idx` (`cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `cliente_cpf1`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `salao_senac`.`cliente` (`cpf_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`produtos` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`produtos` (
  `id_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(65) NOT NULL,
  `preco` DECIMAL(7,2) NOT NULL,
  `estoque` INT NOT NULL,
  `fornecedor_id` INT NULL,
  PRIMARY KEY (`id_produtos`),
  INDEX `fornecedor_id_idx` (`fornecedor_id` ASC) VISIBLE,
  CONSTRAINT `fornecedor_id1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `salao_senac`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`produto_atendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`produto_atendimento` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`produto_atendimento` (
  `atendimento_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  PRIMARY KEY (`atendimento_id`, `produto_id`),
  INDEX `produto_id_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `atendimento_id`
    FOREIGN KEY (`atendimento_id`)
    REFERENCES `salao_senac`.`atendimento` (`id_atendimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `produto_id1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `salao_senac`.`produtos` (`id_produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`servicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`servicos` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`servicos` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(120) NOT NULL,
  `preco_base` DECIMAL(7,2) NOT NULL,
  `duracao_mins` INT NOT NULL,
  `categoria_id` INT NULL,
  PRIMARY KEY (`id_servico`),
  INDEX `categoria_id_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `categoria_id1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `salao_senac`.`categorias` (`id_categoria`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`venda_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`venda_produto` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`venda_produto` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `produto_id` INT NOT NULL,
  `desconto` DECIMAL(4,2) NOT NULL DEFAULT '0.00',
  `data_venda` DATE NOT NULL,
  `qtde` INT NOT NULL,
  `cliente_cpf` VARCHAR(14) NULL DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `produto_id_idx` (`produto_id` ASC) VISIBLE,
  INDEX `cliente_cpf_idx` (`cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `produto_id`
    FOREIGN KEY (`produto_id`)
    REFERENCES `salao_senac`.`produtos` (`id_produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cliente_cpf4`
    FOREIGN KEY (`cliente_cpf`)
    REFERENCES `salao_senac`.`cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`venda_servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`venda_servico` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`venda_servico` (
  `atendimento_id` INT NOT NULL,
  `servico_id` INT NOT NULL,
  `desconto` DECIMAL(4,2) NOT NULL DEFAULT 00.00,
  `preco_final` DECIMAL(7,2) NOT NULL,
  `duracao_mins` INT NOT NULL,
  PRIMARY KEY (`atendimento_id`, `servico_id`),
  INDEX `servico_id_idx` (`servico_id` ASC) VISIBLE,
  CONSTRAINT `atendimento_id3`
    FOREIGN KEY (`atendimento_id`)
    REFERENCES `salao_senac`.`atendimento` (`id_atendimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `servico_id1`
    FOREIGN KEY (`servico_id`)
    REFERENCES `salao_senac`.`servicos` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `salao_senac`.`horarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`horarios` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`horarios` (
  `id_horario` INT NOT NULL AUTO_INCREMENT,
  `hora_inicio` TIME NOT NULL,
  `hora_fim` TIME NOT NULL,
  PRIMARY KEY (`id_horario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salao_senac`.`funcionario_turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salao_senac`.`funcionario_turno` ;

CREATE TABLE IF NOT EXISTS `salao_senac`.`funcionario_turno` (
  `turno_id` INT NOT NULL AUTO_INCREMENT,
  `matricula_func` VARCHAR(15) NOT NULL,
  `dia_semana` VARCHAR(25) NOT NULL,
  `horario_id` INT NOT NULL,
  PRIMARY KEY (`turno_id`),
  INDEX `matricula_func_idx` (`matricula_func` ASC) VISIBLE,
  INDEX `horario_id_idx` (`horario_id` ASC) VISIBLE,
  CONSTRAINT `matricula_func2`
    FOREIGN KEY (`matricula_func`)
    REFERENCES `salao_senac`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `horario_id`
    FOREIGN KEY (`horario_id`)
    REFERENCES `salao_senac`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
