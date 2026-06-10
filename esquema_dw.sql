-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Dim_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dim_Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `rango_edad` VARCHAR(20) NOT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `nivel_lealtad` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dim_Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(150) NOT NULL,
  `categoria` VARCHAR(100) NOT NULL,
  `marca` VARCHAR(100) NOT NULL,
  `costo_unitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Tiempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dim_Tiempo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Tiempo` (
  `id_tiempo` INT NOT NULL,
  `fecha_completa` DATE NOT NULL,
  `año` INT NOT NULL,
  `trimestre` INT NOT NULL,
  `mes` VARCHAR(20) NOT NULL,
  `dia_semana` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tiempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dim_Sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dim_Sucursal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dim_Sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(100) NOT NULL,
  `region` VARCHAR(100) NOT NULL,
  `tipo_tienda` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hechos_Ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Hechos_Ventas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Hechos_Ventas` (
  `id_ventas` INT NOT NULL AUTO_INCREMENT,
  `cantidad_vendida` INT NOT NULL,
  `monto_total` DECIMAL(12,2) NOT NULL,
  `descuento_aplicado` DECIMAL(10,2) NOT NULL,
  `Dim_Cliente_id_cliente` INT NOT NULL,
  `Dim_Producto_id_producto` INT NOT NULL,
  `Dim_Tiempo_id_tiempo` INT NOT NULL,
  `Dim_Sucursal_id_sucursal` INT NOT NULL,
  PRIMARY KEY (`id_ventas`),
  INDEX `fk_Hechos_Ventas_Dim_Cliente_idx` (`Dim_Cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_Hechos_Ventas_Dim_Producto1_idx` (`Dim_Producto_id_producto` ASC) VISIBLE,
  INDEX `fk_Hechos_Ventas_Dim_Tiempo1_idx` (`Dim_Tiempo_id_tiempo` ASC) VISIBLE,
  INDEX `fk_Hechos_Ventas_Dim_Sucursal1_idx` (`Dim_Sucursal_id_sucursal` ASC) VISIBLE,
  CONSTRAINT `fk_Hechos_Ventas_Dim_Cliente`
    FOREIGN KEY (`Dim_Cliente_id_cliente`)
    REFERENCES `mydb`.`Dim_Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hechos_Ventas_Dim_Producto1`
    FOREIGN KEY (`Dim_Producto_id_producto`)
    REFERENCES `mydb`.`Dim_Producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hechos_Ventas_Dim_Tiempo1`
    FOREIGN KEY (`Dim_Tiempo_id_tiempo`)
    REFERENCES `mydb`.`Dim_Tiempo` (`id_tiempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hechos_Ventas_Dim_Sucursal1`
    FOREIGN KEY (`Dim_Sucursal_id_sucursal`)
    REFERENCES `mydb`.`Dim_Sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
