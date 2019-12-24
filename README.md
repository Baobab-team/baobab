# Baobab

### Clone repository

`git clone --recursive [URL to Git repo]`

### Preriquisites
* [PostgreSQL](https://www.postgresql.org)
* [Docker](https://www.docker.com) 



### Setup 

```
# Setup environment variables
mv .env.sample .env 

# Build the image
docker-compose up -d --build

# Create the database
docker-compose exec api python manage.py create_db

# Seed database
docker-compose exec api python manage.py seed_db 

# Remove volumes and containers(if need be)
docker-compose down -v 

```


Once done, head to http://localhost:5000/
