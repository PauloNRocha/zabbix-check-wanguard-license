# Zabbix External Script: Wanguard License Monitor

Este repositório contém um script externo para o Zabbix monitorar os dias restantes da licença do **Andrisoft Wanguard** via API REST.

## 📦 Arquivos

- `check_wanguard_license.sh` — Script principal.
- `README.md` — Instruções de uso.
- `LICENSE` — Licença MIT.

## 🚀 Instalação

1. Copie o script para a pasta de *external scripts* do Zabbix:
   ```bash
   sudo cp check_wanguard_license.sh /usr/lib/zabbix/externalscripts/
   sudo chmod 750 /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
   sudo chown zabbix:zabbix /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
   ```

2. Crie o arquivo com sua API key:
   ```bash
   echo "SUA_CHAVE_API" | sudo tee /etc/zabbix/wanguard_apikey
   sudo chown zabbix:zabbix /etc/zabbix/wanguard_apikey
   sudo chmod 640 /etc/zabbix/wanguard_apikey
   ```

3. Teste manualmente:
   ```bash
   sudo -u zabbix /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
   ```

4. Crie um item no Zabbix com:
   - Tipo: Script externo
   - Chave: `check_wanguard_license.sh`
   - Tipo de informação: Numérico (inteiro)

## 📌 Requisitos

- `jq` instalado no sistema.
- Acesso local ao Wanguard e API ativada com chave.

## 📄 Licença

MIT
