# Docker

# Lista os containers ativos
docker ps

# Lista os containers
docker ps -a

# Ativa o conainer
docker start nome_do_container

docker start pgdb
docker start pgadmin
docker start nflix-api-users
docker start nflix-api-movies
docker start nflix-api-gateway
docker start nflix-web

# lista as imagens que foi dado pull
docker images

# Ambiente

# Banco
http://localhost:15432/browser/

#  APIS

# {"status":"NinjaFlix - API Gateway"}
http://localhost:3000/

# {"status": "NinjaFlix - Users API"}
http://localhost:3001/

# {"status": "NinjaFlix - Movies API"}
http://localhost:3002/


# Ambiente de teste
docker pull postgres
docker run --name pgdb --network=skynet -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgres
docker run --name pgadmin --network=skynet -e "PGADMIN_DEFAULT_EMAIL=roo@qaninja.io" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -p 15432:80 -d dpage/pgadmin4

docker pull papitoio/nflix-api-users
docker run --name nflix-api-users --network=skynet -e "DATABASE=pgdb" -p 3001:3001 -d papitoio/nflix-api-users

docker pull papitoio/nflix-api-movies
docker run --name nflix-api-movies --network=skynet -e "DATABASE=pgdb" -p 3002:3002 -d papitoio/nflix-api-movies

docker pull papitoio/nflix-api-gateway
docker run --name nflix-api-gateway --network=skynet -e "DATABASE=pgdb" -e "API_USERS=http://nflix-api-users:3001" -e "API_MOVIES=http://nflix-api-movies:3002" -p 3000:3000 -d papitoio/nflix-api-gateway

docker pull papitoio/nflix-web
docker run --name nflix-web --network=skynet -e "VUE_APP_API=http://localhost:3000" -p 8080:8080 -d papitoio/nflix-web

