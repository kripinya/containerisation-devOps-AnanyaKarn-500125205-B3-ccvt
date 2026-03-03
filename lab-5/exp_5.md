# Experiment 5  

## Docker Volumes, Environment Variables, Monitoring and Networks

---

## Aim

To understand Docker data persistence using volumes, configure environment variables in containers, monitor container activity, and establish communication between containers using custom Docker networks.

---

## Objectives

- Study the ephemeral nature of container storage  
- Implement named volumes and bind mounts  
- Pass environment variables using different methods  
- Monitor container performance and logs  
- Create and manage Docker networks  
- Enable container-to-container communication  

---

### Part 1: Understanding Data Persistence

Step 1: Run Ubuntu Container

```bash
docker run -it --name test-container ubuntu /bin/bash
```

![Step 1: Run Ubuntu Container](./assets/ex5_1.png)

Inside the container:

```bash
mkdir /data
echo "Hello World" > /data/message.txt
cat /data/message.txt
```

![Inside the container:](./assets/ex5_2.png)

Exit the container:

```bash
exit
```

Restart the container:

```bash
docker start test-container
docker exec test-container cat /data/message.txt
```

![Restart the container:](./assets/ex5_3.png)

### Observation

The file created earlier is not available after container restart if the container was removed. This shows that container storage is temporary unless a volume is attached.

---

### Part 2: Docker Volumes

Step 2: Create a Named Volume

```bash
docker volume create mydata
docker volume ls
```

![Create a Named Volume](./assets/ex5_4.png)

---

Step 3: Run Container with Volume Attached

```bash
docker run -d -v mydata:/app/data --name web-volume nginx
```

![Run Container with Volume Attached](./assets/ex5_5.png)

Verify volume attachment:

```bash
docker inspect web-volume
```

![Verify volume attachment](./assets/ex5_6.png)

### Observations

The volume `mydata` is mounted inside the container at `/app/data`.

---

### Part 3: Bind Mount

Step 4: Create Directory on Host

```bash
mkdir ~/myapp-data
```

![Create Directory on Host](./assets/ex5_7.png)

Run container with bind mount:

```bash
docker run -d -v ~/myapp-data:/app/data --name web-bind nginx
```

Create file on host:

```bash
echo "From Host" > ~/myapp-data/host-file.txt
```


Verify inside container:

```bash
docker exec web-bind cat /app/data/host-file.txt
```

![Bind Mount](./assets/ex5_8.png)

Observation

Data created on the host machine is accessible inside the container through bind mount.

---

### Part 4: Environment Variables

Step 5: Passing Variables using -e Flag

```bash
docker run -d \
-e VAR1=value1 \
-e VAR2=value2 \
--name env-test \
nginx
```

Inspect environment variables:

```bash
docker exec env-test printenv
```

![Passing Variables using -e Flag](./assets/ex5_9.png)

---

## Step 6: Using .env File

Create a file named `.env`:

```bash
echo "API_KEY=secret123" > .env
```

Run container using env file:

```bash
docker run -d --env-file .env --name env-file-test nginx
```

![Run container using env file](./assets/ex5_10.png)

Verify variables:

```bash
docker exec env-file-test printenv
```

![Verify variables](./assets/ex5_11.png)

---

### Part 5: Monitoring Containers

Step 7: View Running Containers

```bash
docker ps
```

![view running containers](./assets/ex5_19.png)

---

Step 8: Real-time Resource Monitoring

```bash
docker stats
```

Single snapshot:

```bash
docker stats --no-stream
```

![docker stats](./assets/ex5_12.png)

---

Step 9: View Processes Inside Container

```bash
docker top web-bind
```

![view process inside container](./assets/ex5_13.png)

---

## Step 10: View Logs

```bash
docker logs web-bind
```

![ogs web-bind](./assets/ex5_14.png)

---

### Part 6: Docker Networks

Step 11: List Existing Networks

```bash
docker network ls
```

![network ls](./assets/ex5_15.png)

---

Step 12: Create Custom Network

```bash
docker network create my-network
```

Verify network:

```bash
docker network ls
```

![docker network ls](./assets/ex5_16.png)

---
Step 13: Run Containers on Custom Network

```bash
docker run -d --name web1 --network my-network nginx
docker run -d --name web2 --network my-network nginx
```

![Run containers on custom network](./assets/ex5_17.png)

---

Step 14: Test Container Communication

```bash
docker exec web1 curl http://web2
```

![test container communication](./assets/ex5_18.png)

Observation

Containers connected to the same custom bridge network can communicate using container names as hostnames.

---

Step 15: Inspect Network

```bash
docker network inspect my-network
```

---

### Result

Docker volumes were successfully implemented to persist data.  
Environment variables were configured using both command-line flags and env files.  
Container monitoring was performed using Docker commands.  
A custom bridge network was created and container-to-container communication was verified successfully.

---

### Conclusion

This experiment demonstrated Docker storage mechanisms, runtime configuration using environment variables, monitoring techniques, and container networking. These features are essential for building reliable and production-ready containerized applications.