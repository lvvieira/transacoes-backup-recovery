DELIMITER //
CREATE PROCEDURE process_order(
    IN order_id INT,
    IN product_id INT,
    IN quantity INT
)
BEGIN
    DECLARE stock_available INT;
    DECLARE exit_handler FOR SQLEXCEPTION
    BEGIN
        -- Em caso de erro, realizar rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro ao processar a transação, rollback executado.';
    END;

    -- Desabilitar autocommit e iniciar a transação
    SET autocommit = 0;
    START TRANSACTION;

    -- Verificar estoque disponível
    SELECT stock INTO stock_available FROM products WHERE product_id = product_id;

    -- Se não houver estoque suficiente, sinalizar erro
    IF stock_available < quantity THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente.';
    END IF;

    -- Caso contrário, realizar atualização e registrar a venda
    UPDATE products SET stock = stock - quantity WHERE product_id = product_id;
    INSERT INTO sales (order_id, product_id, quantity) VALUES (order_id, product_id, quantity);

    -- Confirmar a transação
    COMMIT;

    -- Habilitar autocommit novamente
    SET autocommit = 1;
END;
//
DELIMITER ;
