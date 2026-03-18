# Experiment 6: Docker Run vs Docker Compose

**Aim/Objective:**
To prove that the same setup can be done using `docker run` (manual) and `docker compose` (automated & clean), demonstrating manual vs automated setup, converting multi-container setups, assigning volumes and networks, setting resource limits, and building custom images.

---

## TASK 1 — Single Container (Easy Start)

### Part A: Using docker run (Manual Setup)
We run an Nginx container manually, exposing it on port `8081` and mapping a local `html` volume.

```bash
docker run -d \
--name lab-nginx \
-p 8081:80 \
-v $(pwd)/html:/usr/share/nginx/html \
nginx:alpine
```

Verify it's running:
```bash
docker ps
curl http://localhost:8081
```

*(Insert Screenshot: Terminal showing `docker run` execution and `docker ps`)*
*(Insert Screenshot: Browser showing `http://localhost:8081` output)*

Clean up:
```bash
docker stop lab-nginx
docker rm lab-nginx
```

### Part B: Same using Docker Compose
Create a `docker-compose.yml` file to automate the same:

```yaml
version: '3.8'
services:
  nginx:
    image: nginx:alpine
    container_name: lab-nginx
    ports:
      - "8081:80"
    volumes:
      - ./html:/usr/share/nginx/html
```

Run and verify:
```bash
docker compose up -d
docker compose ps
docker compose down
```

*(Insert Screenshot: Terminal showing `docker compose up -d` and `docker compose ps`)*

---

## TASK 2 — Multi-Container App (IMPORTANT ⭐)
Demonstrating why Compose is better for multi-container apps (WordPress + MySQL).

### Using Docker Run (Manual Setup)
**Step 1:** Create Custom Network
```bash
docker network create wp-net
```

**Step 2:** Start MySQL Container
```bash
docker run -d \
--name mysql \
--network wp-net \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_DATABASE=wordpress \
mysql:5.7
```
*(Note for Apple Silicon: append `--platform linux/amd64` to mysql:5.7)*

**Step 3:** Start WordPress Container
```bash
docker run -d \
--name wordpress \
--network wp-net \
-p 8082:80 \
-e WORDPRESS_DB_HOST=mysql \
-e WORDPRESS_DB_PASSWORD=secret \
wordpress:latest
```

Verify:
Open `http://localhost:8082`

*(Insert Screenshot: Browser showing WordPress installation page)*

### Using Docker Compose (Clean Way)
Automating the setup cleanly using `docker-compose.yml`:

```yaml
version: '3.8'
services:
  mysql:
    image: mysql:5.7
    platform: linux/amd64
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: wordpress
    volumes:
      - mysql_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    ports:
      - "8082:80"
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_PASSWORD: secret
    depends_on:
      - mysql

volumes:
  mysql_data:
```

Run and clean up:
```bash
docker compose up -d
docker compose down -v
```

*(Insert Screenshot: Terminal output showing creation of network, volume, mysql, and wordpress containers)*

---

## TASK 3 — Convert Docker Run → Compose

**Given `docker run` command:**
```bash
docker run -d \
--name webapp \
-p 5000:5000 \
-e APP_ENV=production \
-e DEBUG=false \
--restart unless-stopped \
node:18-alpine
```

**Converted `docker-compose.yml`:**
```yaml
version: '3.8'
services:
  webapp:
    image: node:18-alpine
    container_name: webapp
    ports:
      - "5000:5000"
    environment:
      APP_ENV: production
      DEBUG: "false"
    restart: unless-stopped
```

---

## TASK 4 — Volume + Network Conversion

Writing **ONE** compose file combining a backend and a postgres DB with a custom network and volume.

**Converted `docker-compose.yml`:**
```yaml
version: '3.8'

services:
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: appdb
    volumes:
      - pgdata:/var/lib/postgresql/data
    networks:
      - custom-network
      
  backend:
    image: node:18-alpine
    environment:
      DB_HOST: db
      DB_USER: user
      DB_PASSWORD: password
    ports:
      - "3000:3000"
    depends_on:
      - db
    networks:
      - custom-network

volumes:
  pgdata:

networks:
  custom-network:
```

---

## TASK 5 — Resource Limits

**Given `docker run` command:**
```bash
docker run -d \
--name limited-app \
-p 9000:9000 \
--memory="256m" \
--cpus="0.5" \
--restart always \
nginx:alpine
```

**Converted `docker-compose.yml`:**
```yaml
services:
  limited-app:
    image: nginx:alpine
    ports:
      - "9000:9000"
    restart: always
    deploy:
      resources:
        limits:
          memory: 256m
          cpus: "0.5"
```

---

## TASK 6 — Build Your Own App

Demonstrating the difference between `image:` (prebuilt) and `build:` (custom) in compose.

**Step 1:** Create `app.js`
```javascript
const http = require('http');
http.createServer((req, res) => {
 res.end("Docker Compose Build Lab");
}).listen(3000);
```

**Step 2:** Create `Dockerfile`
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY app.js .
EXPOSE 3000
CMD ["node", "app.js"]
```

**Step 3:** Create `docker-compose.yml`
```yaml
version: '3.8'
services:
  nodeapp:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: custom-node-app
    ports:
      - "3000:3000"
```

**Run the custom build:**
```bash
docker compose up --build -d
```
Verify the output by opening `http://localhost:3000`.

*(Insert Screenshot: Browser output showing "Docker Compose Build Lab")*

---

## FINAL SUMMARY
Proven Concepts:
- **docker run**: Demonstrated manual setup configuration.
- **docker compose**: Demonstrated automated, structured setup handling dependencies seamlessly.
- **multi-container**: Successfully deployed WordPress connected to a MySQL backend.
- **conversion**: Converted various `docker run` shell scripts into neat declarative YAML code.
- **volumes + network**: Built a real-world multi-tier architecture using bridge networks and named volumes.
- **build**: Managed custom application lifecycle (build, deploy) from a Dockerfile using Compose.
