-- Desabilitar o autocommit
SET autocommit = 0;

-- Iniciar a transação
START TRANSACTION;

-- Exemplo de atualização e inserção
UPDATE products SET stock = stock - 10 WHERE product_id = 1;
INSERT INTO sales (product_id, quantity) VALUES (1, 10);

-- Confirmar a transação
COMMIT;

-- Habilitar o autocommit novamente
SET autocommit = 1;
