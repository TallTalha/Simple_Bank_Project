postgres:
	docker run --name myPostgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=talha -d postgres:12-alpine
createdb:
	docker exec -it myPostgres12 createdb --username=root --owner=root simple_bank 
dropdb:
	docker exec -it myPostgres12 dropdb simple_bank
migrateup:
	 migrate -path db/migration -database "postgresql://root:talha@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	 migrate -path db/migration -database "postgresql://root:talha@localhost:5432/simple_bank?sslmode=disable" -verbose down


.PHONY: postgres createdb dropdb migrateup migratedown