0. Install Docker and Docker Connect https://github.com/nicklz/docker_connect

1. git clone git@github.com:nicklz/clarku_docker.git
2. cd clarku_docker
3. cp ~/.ssh/id_rsa data/www/id_rsa
4. docker-compose up -d
5. docker exec -it clarku_web bash (or dc clarku)
6. ./scripts/setup.sh


7. Visit http://local.clarku.edu:10061
