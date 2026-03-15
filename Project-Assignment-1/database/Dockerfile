FROM postgres:15-alpine

# Environment variables are normally set in docker-compose.yml
# but they can be provided here as fallbacks.
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=assignment1

# If we had initialization schemas we would copy them like this:
# COPY init.sql /docker-entrypoint-initdb.d/
