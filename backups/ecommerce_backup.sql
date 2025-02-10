-- Backup gerado via mysqldump
-- Servidor: localhost    Versão: 8.0.30 MySQL

-- Banco de dados: ecommerce
-- ------------------------------------------------------
-- Estrutura da tabela `products`
CREATE TABLE `products` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `stock` INT NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (`product_id`)
);

-- Dados da tabela `products`
INSERT INTO `products` (`product_id`, `name`, `stock`, `price`) VALUES
(1, 'Notebook', 50, 2999.99),
(2, 'Smartphone', 80, 1999.99),
(3, 'Fone Bluetooth', 100, 199.99);

-- ------------------------------------------------------
-- Estrutura da tabela `sales`
CREATE TABLE `sales` (
  `sale_id` INT AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `sale_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`)
);

-- Dados da tabela `sales`
INSERT INTO `sales` (`sale_id`, `product_id`, `quantity`, `sale_date`) VALUES
(1, 1, 5, '2025-02-10 10:00:00'),
(2, 2, 2, '2025-02-10 11:30:00');
