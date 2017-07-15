0. Install Docker (https://blog.jayway.com/2017/04/19/running-docker-on-bash-on-windows/)

1. git clone git@github.com:nicklz/clarku_docker.git
2. cd clarku_docker
3. cp ~/.ssh/id_rsa data/www/id_rsa
4. docker-compose up -d
5. docker exec -it clarku_web bash (or dc clarku)
6. ./scripts/setup.sh


7. Visit http://local.clarku.edu:10061
