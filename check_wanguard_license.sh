#!/bin/bash
# Script para verificar os dias restantes da licença do Wanguard.

# Caminho absoluto para o jq, caso esteja fora do PATH do Zabbix
JQ_BIN="/usr/bin/jq"

# Substitua pela sua chave real
API_KEY="SUA_CHAVE_API_AQUI"

# URL da API (ajuste se necessário)
API_URL="https://<SEU_DOMINIO>/wanguard-api/v1/license_manager"

# Faz a requisição com o header da API Key
response=$(curl -s -k -H "X-API-Key: $API_KEY" "$API_URL")

# DEBUG: Mostra a resposta bruta (comente quando tudo estiver OK)
# echo "$response"

# Extrai os dias restantes usando jq
dias_restantes=$(echo "$response" | $JQ_BIN -r '.license_expiry_date_remaining' | grep -oE '[0-9]+')

# DEBUG: Mostra valor extraído (comente quando tudo estiver OK)
# echo "Dias restantes extraídos: $dias_restantes"

# Valida se o valor foi realmente extraído
if [[ -z "$dias_restantes" ]]; then
    echo "Erro: Não foi possível extrair os dias restantes da licença."
    exit 1
fi

# Mostra o resultado final para o Zabbix
echo "$dias_restantes"