#!/bin/bash

# Definindo variáveis
DB_USER="root"
DB_PASSWORD="sua_senha"
DB_NAME="ecommerce"
BACKUP_FILE="backups/ecommerce_backup.sql"

# 1. Realizar o backup do banco de dados usando mysqldump
echo "Executando backup do banco de dados..."
mysqldump -u $DB_USER -p$DB_PASSWORD --routines --triggers --events $DB_NAME > $BACKUP_FILE
echo "Backup concluído e salvo em $BACKUP_FILE."

# 2. Recuperar o banco de dados (opcional)
echo "Deseja executar a recuperação do banco de dados a partir do backup? (s/n)"
read CONFIRMATION
if [ "$CONFIRMATION" == "s" ]; then
    echo "Recuperando banco de dados..."
    mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $BACKUP_FILE
    echo "Recovery concluído com sucesso."
else
    echo "Recovery não foi executado."
fi
