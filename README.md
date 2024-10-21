# Projeto de Integração de Dados com Kafka, Postgres, Minio e Spark

## Visão Geral

Este projeto é uma arquitetura de integração de dados que utiliza Kafka, Postgres, Minio e Spark para processar e armazenar dados de forma eficiente. A configuração é gerenciada por meio de contêineres Docker, facilitando a implantação e o gerenciamento dos serviços.

## Estrutura do Projeto

- **Makefile**: Contém comandos para interagir com os serviços, como listar tópicos Kafka, enviar conectores, e gerenciar camadas no Minio.
- **docker-compose.yml**: Define os serviços Docker, incluindo Postgres, Kafka, Zookeeper, Minio, Spark e Jupyter.
- **database/init.sql**: Script SQL para inicializar o banco de dados Postgres com tabelas e configurações necessárias.
- **.env**: Arquivo de configuração de ambiente para variáveis sensíveis, como credenciais do Postgres.
- **.dockerignore** e **.gitignore**: Arquivos para ignorar diretórios e arquivos desnecessários durante o build e versionamento.

## Configuração

1. **Pré-requisitos**:
   - Docker e Docker Compose instalados.
   - Variáveis de ambiente configuradas no arquivo `.env`.

2. **Configuração do Banco de Dados**:
   - O script `init.sql` cria as tabelas necessárias no banco de dados Postgres e ajusta as configurações de replicação.

3. **Configuração dos Serviços**:
   - O arquivo `docker-compose.yml` define todos os serviços necessários. Certifique-se de que as portas necessárias estão livres.

## Execução

1. **Iniciar os Serviços**:
   ```docker-compose up -d```

2. **Interagir com os Serviços**:
   - Use o `Makefile` para executar comandos comuns, como listar tópicos Kafka ou conectar-se ao banco de dados Postgres.

3. **Criar os Conectores**:
   Use o comando ```make create_connectors``` para criar os conectores necessários, como o conector do Postgres e o conector do S3, que serão usados para a captura de dados do Postgres e a ingestão no Minio.

4. **Gerenciar Camadas no Minio**:
   Use o comando ```make minio_layers``` para criar as camadas no Minio, como a camada raw e a camada lakehouse.

5. **Iniciar os dados no Postgres**:
   Use o comando ```make postgres_start_data``` para iniciar os dados no Postgres.

6. **Conectar ao Postgres**:
   Use o comando ```make connect_postgres``` para conectar ao Postgres.

7. **Copie os dados para o Postgres**:
   Utilize o comando ```COPY orders FROM '/tmp/orders.csv' DELIMITER ',' CSV HEADER;``` para copiar os dados para o Postgres da tabela orders, e faça isso para as tabelas orderitems, payments, products e customers.

## Detalhes dos Componentes

### Kafka

- **Tópicos**: Gerencie tópicos usando os comandos no `Makefile`.
- **Conectores**: Configure conectores para integrar Postgres e Minio com Kafka.

### Postgres

- **Tabelas**: Estrutura de tabelas definida no `init.sql`.
- **Replicação**: Configurada para permitir a captura de mudanças de dados.

### Minio

- **Camadas de Dados**: Gerencie camadas de dados brutas e de lakehouse usando comandos no `Makefile`.

### Spark

- **Processamento de Dados**: Use o Spark para processar dados armazenados no Minio.
- **Jupyter Notebook**: Acesse notebooks para análise de dados interativa.

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou novas funcionalidades. Abra uma issue ou envie um pull request.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

