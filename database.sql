CREATE DATABASE  IF NOT EXISTS `delivery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `delivery`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha_hash` varchar(255) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Kaique Gomes','kaique.admin@example.com','hash_admin1','gerente'),(2,'Aparecida Alves','aparecida.n@example.com','hash_admin2','suporte'),(3,'Anna Cunha','anna.l@example.com','hash_admin3','gerente'),(4,'Ana Clara','ana.f@example.com','hash_admin4','suporte'),(5,'Isadora Miranda','isadora.m@example.com','hash_admin5','desenvolvedor');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_entregador`
--

DROP TABLE IF EXISTS `avaliacao_entregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao_entregador` (
  `id_avaliacaoentregador` int NOT NULL AUTO_INCREMENT,
  `id_entregador` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_avaliacaoentregador`),
  KEY `id_entregador` (`id_entregador`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `avaliacao_entregador_ibfk_1` FOREIGN KEY (`id_entregador`) REFERENCES `entregador` (`id_entregador`),
  CONSTRAINT `avaliacao_entregador_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_entregador`
--

LOCK TABLES `avaliacao_entregador` WRITE;
/*!40000 ALTER TABLE `avaliacao_entregador` DISABLE KEYS */;
INSERT INTO `avaliacao_entregador` VALUES (1,1,1,5,'Muito rápido e educado!','2025-10-01'),(2,2,2,4,'Entrega pontual.','2025-10-02'),(3,3,3,5,'Excelente serviço.','2025-10-03'),(4,4,4,3,'Demorou um pouco.','2025-10-03'),(5,5,5,5,'Muito atencioso.','2025-10-04');
/*!40000 ALTER TABLE `avaliacao_entregador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_estabelecimento`
--

DROP TABLE IF EXISTS `avaliacao_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao_estabelecimento` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `id_estab` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_estab` (`id_estab`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `avaliacao_estabelecimento_ibfk_1` FOREIGN KEY (`id_estab`) REFERENCES `estabelecimento` (`id_estab`),
  CONSTRAINT `avaliacao_estabelecimento_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_estabelecimento`
--

LOCK TABLES `avaliacao_estabelecimento` WRITE;
/*!40000 ALTER TABLE `avaliacao_estabelecimento` DISABLE KEYS */;
INSERT INTO `avaliacao_estabelecimento` VALUES (1,1,1,5,'Comida excelente!','2025-10-01'),(2,2,2,4,'Boa refeição.','2025-10-02'),(3,3,3,5,'Muito saboroso.','2025-10-03'),(4,4,4,3,'Poderia ser mais quente.','2025-10-03'),(5,5,5,4,'Entrega dentro do prazo.','2025-10-04');
/*!40000 ALTER TABLE `avaliacao_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto`
--

DROP TABLE IF EXISTS `categoria_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto`
--

LOCK TABLES `categoria_produto` WRITE;
/*!40000 ALTER TABLE `categoria_produto` DISABLE KEYS */;
INSERT INTO `categoria_produto` VALUES (1,'Lanches','Sanduíches e hambúrgueres'),(2,'Bebidas','Refrigerantes e sucos'),(3,'Pizzas','Pizzas doces e salgadas'),(4,'Sobremesas','Doces em geral'),(5,'Salgados','Pastéis e coxinhas');
/*!40000 ALTER TABLE `categoria_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `senha_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rebeca Barbosa','rebeca@email.com','74999990001','hash1'),(2,'João Silva','joao@email.com','74999990002','hash2'),(3,'Maria Souza','maria@email.com','74999990003','hash3'),(4,'Pedro Lima','pedro@email.com','74999990004','hash4'),(5,'Ana Costa','ana@email.com','74999990005','hash5');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom` (
  `id_cupom` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor_desconto` decimal(10,2) NOT NULL,
  `tipo` enum('PERCENTUAL','FIXO') NOT NULL,
  `validade` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cupom`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
INSERT INTO `cupom` VALUES (1,'DESC10','10% de desconto',10.00,'PERCENTUAL','2025-12-31',1),(2,'VALE5','R$5 de desconto',5.00,'FIXO','2025-11-30',1),(3,'PROMO15','15% off',15.00,'PERCENTUAL','2025-10-30',1),(4,'FRETEGRATIS','Frete grátis',7.00,'FIXO','2025-09-30',1),(5,'CLIENTE20','20% off clientes fiéis',20.00,'PERCENTUAL','2025-12-31',1);
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_cliente`
--

DROP TABLE IF EXISTS `endereco_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_cliente` (
  `id_endereco` int NOT NULL,
  `id_cliente` int NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `padrao` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_endereco`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `endereco_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_cliente`
--

LOCK TABLES `endereco_cliente` WRITE;
/*!40000 ALTER TABLE `endereco_cliente` DISABLE KEYS */;
INSERT INTO `endereco_cliente` VALUES (1,1,'Rua A','10','Centro','Irecê','44700-000',NULL,0),(2,2,'Rua B','20','Boa Vista','Irecê','44700-111',NULL,0),(3,3,'Rua C','30','Novo Horizonte','Irecê','44700-222',NULL,0),(4,4,'Rua D','40','São José','Irecê','44700-333',NULL,0),(5,5,'Rua E','50','Planalto','Irecê','44700-444',NULL,0);
/*!40000 ALTER TABLE `endereco_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_entregador` int NOT NULL,
  `hora_saida` time DEFAULT NULL,
  `hora_entrega` time DEFAULT NULL,
  `status` enum('aguardando','em rota','entregue') NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_entregador` (`id_entregador`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_entregador`) REFERENCES `entregador` (`id_entregador`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,1,1,'19:30:00','19:50:00','entregue'),(2,2,2,'18:45:00',NULL,'em rota'),(3,3,4,'12:00:00',NULL,'em rota'),(4,4,5,NULL,NULL,'aguardando'),(5,5,3,'20:00:00','20:25:00','entregue');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregador`
--

DROP TABLE IF EXISTS `entregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregador` (
  `id_entregador` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `placa_veiculo` varchar(10) DEFAULT NULL,
  `tipo_veiculo` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_entregador`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregador`
--

LOCK TABLES `entregador` WRITE;
/*!40000 ALTER TABLE `entregador` DISABLE KEYS */;
INSERT INTO `entregador` VALUES (1,'Lucas Almeida','74999990020','111.222.333-44','ABC1D23','moto','disponível'),(2,'Rafael Santos','74999990021','222.333.444-55','XYZ2E34','moto','em entrega'),(3,'Carla Menezes','74999990022','333.444.555-66','QWE3R45','carro','disponível'),(4,'João Oliveira','74999990023','444.555.666-77','ASD4F56','moto','em entrega'),(5,'Paulo Nunes','74999990024','555.666.777-88','ZXC5V67','bicicleta','disponível');
/*!40000 ALTER TABLE `entregador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento`
--

DROP TABLE IF EXISTS `estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estabelecimento` (
  `id_estab` int NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `horario_abre` time DEFAULT NULL,
  `horario_fecha` time DEFAULT NULL,
  `ativo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_estab`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
INSERT INTO `estabelecimento` VALUES (1,'Sabor Caseiro','11111111000111','74999990101','Rua Central, 10','10:00:00','22:00:00',1),(2,'Lanche Bom','22222222000122','74999990102','Av Brasil, 20','09:00:00','23:00:00',1),(3,'Pizza Top','33333333000133','74999990103','Rua das Pizzas, 30','18:00:00','00:00:00',1),(4,'Doces & Cia','44444444000144','74999990104','Rua Doce, 40','08:00:00','20:00:00',1),(5,'Pastelaria Sol','55555555000155','74999990105','Av Sol, 50','10:00:00','21:00:00',1);
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id_item` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,1,1,2,18.50,37.00),(2,2,3,1,7.00,7.00),(3,3,4,1,45.00,45.00),(4,4,5,2,3.00,6.00),(5,5,2,3,5.00,15.00);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id_pagamento` int NOT NULL,
  `id_pedido` int NOT NULL,
  `metodo` enum('cartão','pix','dinheiro') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` enum('aprovado','pendente','aguardando') NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,'cartão',30.00,'aprovado','2025-10-01'),(2,2,'pix',22.00,'pendente',NULL),(3,3,'dinheiro',25.00,'aguardando',NULL),(4,4,'cartão',12.00,'aprovado','2025-10-03'),(5,5,'pix',40.00,'aprovado','2025-10-04');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_estab` int DEFAULT NULL,
  `id_cupom` int DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_estab` (`id_estab`),
  KEY `id_cupom` (`id_cupom`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_estab`) REFERENCES `estabelecimento` (`id_estab`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_cupom`) REFERENCES `cupom` (`id_cupom`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,'2025-10-01','entregue',30.00),(2,2,2,NULL,'2025-10-02','em rota',22.00),(3,3,3,2,'2025-10-03','em preparo',25.00),(4,4,4,NULL,'2025-10-03','aguardando',12.00),(5,5,5,3,'2025-10-04','entregue',40.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_estab` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_estab` (`id_estab`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_estab`) REFERENCES `estabelecimento` (`id_estab`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_produto` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,1,'X-Burguer','Hambúrguer com queijo',18.50,50),(2,1,2,'Refrigerante','Coca-Cola lata',5.00,100),(3,2,5,'Pastel','Pastel de carne',7.00,80),(4,3,3,'Pizza Calabresa','Pizza média',45.00,20),(5,4,4,'Brigadeiro','Doce tradicional',3.00,200);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-26  1:58:20
