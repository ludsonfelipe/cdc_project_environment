# Kafka
list_topics:
	docker exec -it kafka bash bin/kafka-topics.sh --list --bootstrap-server kafka:9092
read_topic:
	docker exec -it kafka bash bin/kafka-console-consumer.sh --topic $(topic) --from-beginning --bootstrap-server kafka:9092

# Connect
send_postgres_connector:
	curl -i -X POST -H "Accept: application/json" -H "Content-Type: application/json" localhost:8083/connectors/ -d @./connectors/postgres_to_kafka.json
send_s3_connector:
	curl -i -X POST -H "Accept: application/json" -H "Content-Type: application/json" localhost:8083/connectors/ -d @./connectors/kafka_to_s3.json
delete_connector:
	curl -X DELETE localhost:8083/connectors/$(conn)
list_connectors:
	curl -X GET localhost:8083/connectors/
create_connectors: send_postgres_connector send_s3_connector

# Minio
minio_console:
	docker exec -it minio_cdc bash
minio_raw_layer:
	docker exec -it minio_cdc bash -c "mc rm --force --dangerous data/raw; mc mb data/raw"
minio_lakehouse_layer:
	docker exec -it minio_cdc bash -c "mc rm --force --dangerous data/lakehouse; mc mb data/lakehouse"
minio_layers: minio_raw_layer minio_lakehouse_layer

# Postgres
postgres_start_data:
	docker cp ./database/bases/df_Orders.csv ecommerce_db:/tmp/orders.csv
	docker cp ./database/bases/df_OrderItems.csv ecommerce_db:/tmp/orderitems.csv
	docker cp ./database/bases/df_Payments.csv ecommerce_db:/tmp/payments.csv
	docker cp ./database/bases/df_Products.csv ecommerce_db:/tmp/products.csv
	docker cp ./database/bases/df_Customers.csv ecommerce_db:/tmp/customers.csv
connect_postgres:
	docker exec -it ecommerce_db psql -h ecommerce_db -U postgres -d ecommerce_db
