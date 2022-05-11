
CREATE SCHEMA IF NOT EXISTS `db_tt` DEFAULT CHARACTER SET utf8 ;
USE `db_tt` ;

CREATE TABLE IF NOT EXISTS `db_tt`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `senha` VARCHAR(200) NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_tt`.`publicacoes` (
  `id_publicacao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(200) NOT NULL,
  `publicacoescol` VARCHAR(45) NULL,
  `id_usuario_criacao` INT NOT NULL,
  PRIMARY KEY (`id_publicacao`),
  INDEX `fk_publicacoes_usuarios_idx` (`id_usuario_criacao` ASC) VISIBLE,
  CONSTRAINT `fk_publicacoes_usuarios`
    FOREIGN KEY (`id_usuario_criacao`)
    REFERENCES `db_tt`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_tt`.`curtidas` (
  `id_publicacao` INT NOT NULL,
  `id_usuario_curtiu` INT NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_publicacao`, `id_usuario_curtiu`),
  INDEX `fk_curtidas_usuarios1_idx` (`id_usuario_curtiu` ASC) VISIBLE,
  CONSTRAINT `fk_curtidas_publicacoes1`
    FOREIGN KEY (`id_publicacao`)
    REFERENCES `db_tt`.`publicacoes` (`id_publicacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curtidas_usuarios1`
    FOREIGN KEY (`id_usuario_curtiu`)
    REFERENCES `db_tt`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_tt`.`comentarios` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(500) NOT NULL,
  `id_publicacao` INT NOT NULL,
  `id_usuario_criacao` INT NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_comentario`),
  INDEX `fk_comentarios_usuarios1_idx` (`id_usuario_criacao` ASC) VISIBLE,
  INDEX `fk_comentarios_publicacoes1_idx` (`id_publicacao` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuarios1`
    FOREIGN KEY (`id_usuario_criacao`)
    REFERENCES `db_tt`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_publicacoes1`
    FOREIGN KEY (`id_publicacao`)
    REFERENCES `db_tt`.`publicacoes` (`id_publicacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
