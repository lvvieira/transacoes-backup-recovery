# transacoes-backup-recovery

# Criando Transações, Executando Backup e Recovery de Banco de Dados

Este projeto contém exemplos de transações no MySQL, tanto simples quanto utilizando procedures, além de scripts para backup e recovery do banco de dados.

## Estrutura do projeto:
- **transacao_simples.sql**: Executa uma transação sem o uso de procedures.
- **transacao_procedure.sql**: Define uma transação com rollback parcial ou total usando uma procedure.
- **backup_e_recovery.sh**: Script para executar o backup e recovery utilizando mysqldump.
- **ecommerce_backup.sql**: Arquivo de backup do banco de dados e-commerce.

## Instruções:
1. Clone o repositório:
    ```bash
    git clone https://github.com/lvvieira/transacoes-backup-recovery.git
    ```

2. Execute as transações:
    - No MySQL Workbench ou terminal, execute os scripts `transacao_simples.sql` e `transacao_procedure.sql`.

3. Execute o script de backup e recovery:
    ```bash
    bash scripts/backup_e_recovery.sh
    ```

---
