# Zabbix External Script: Wanguard License Monitor

Este repositório contém um script externo para o Zabbix monitorar os dias restantes da licença do **Andrisoft Wanguard** via API REST.

## 📋 Requisitos

-   `jq` instalado no servidor Zabbix ou no proxy que executará o script.
-   Acesso de rede do servidor Zabbix/proxy ao Wanguard.
-   Uma chave de API válida gerada no Wanguard.

## 🚀 Instalação e Configuração

### 1. Edite o Script

Antes de instalar, você **precisa** editar o arquivo `check_wanguard_license.sh` e substituir os valores das seguintes variáveis:

-   `API_KEY`: Cole a sua chave da API do Wanguard no lugar de `"SUA_CHAVE_API_AQUI"`.
-   `API_URL`: Altere a URL para o endereço do seu servidor Wanguard, substituindo `<SEU_DOMINIO>`.

### 2. Instale o Script no Servidor Zabbix

Copie o script já editado para a pasta de scripts externos do Zabbix e defina as permissões corretas:

```bash
sudo cp check_wanguard_license.sh /usr/lib/zabbix/externalscripts/
sudo chmod 750 /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
sudo chown zabbix:zabbix /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
```

### 3. Teste o Script

Execute o script manualmente como o usuário `zabbix` para garantir que ele funciona e retorna um número:

```bash
sudo -u zabbix /usr/lib/zabbix/externalscripts/check_wanguard_license.sh
```

### 4. Crie o Item no Zabbix

No seu host do Wanguard no Zabbix, crie um novo item com a seguinte configuração:

-   **Nome:** Wanguard License Days Remaining (ou como preferir)
-   **Tipo:** `Script externo`
-   **Chave:** `check_wanguard_license.sh`
-   **Tipo de informação:** `Numérico (inteiro sem sinal)`
-   **Unidades:** `days`

## 📄 Licença

Este projeto é licenciado sob a Licença MIT.