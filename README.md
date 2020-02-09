# Baobab

### Clone repository

`git clone --recursive [URL to Git repo]`

### Preriquisites
* [PostgreSQL](https://www.postgresql.org)
* [Docker](https://www.docker.com) 



### Setup 

```
# Move to api directory
cd baoabab-api 

# Copy file
mv .env.local .env 

# Build the image
docker-compose up -d --build

# Create the database (1st time only)
docker-compose exec backend python manage.py db init

# GENERATE migrations
docker-compose exec backend python manage.py db migrate

# RUN migrations
docker-compose exec backend python manage.py db upgrade

# Seed database
docker-compose exec backend python manage.py seed_db 

# Remove volumes and containers(if need be)
docker-compose down -v 

```

Update submodule
```
git submodule update
```
Once done, head to http://localhost:4200  or http://localhost:5000/api_v1/businesses
