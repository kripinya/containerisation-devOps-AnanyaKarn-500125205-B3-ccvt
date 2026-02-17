# Experiment -3

Date: February 4, 2026

## **Ex-3 Deploying NGINX Using Different Base Images and Comparing Image Layers**

# Terminologies:

## **1. Docker**

Docker is a **containerization platform** that allows applications to be packaged along with their dependencies into lightweight, portable units called containers. It ensures consistency across development, testing, and production environments.

---

## **2. Container**

A container is a **lightweight, standalone executable unit** that includes the application code, runtime, libraries, and dependencies required to run the application. Containers share the host OS kernel, making them faster and more efficient than virtual machines.

---

## **3. Docker Image**

A Docker image is a **read-only template** used to create containers. It contains the application, its dependencies, and instructions needed to run the application. Images are built in layers and stored in Docker registries.

---

## **4. Base Image**

A base image is the **starting image** used in a Dockerfile using the FROM instruction.

Examples used in this experiment:

- nginx:latest
- ubuntu:22.04
- alpine:latest

The base image significantly affects:

- Image size
- Security surface
- Startup time
- Performance

---

## **5. NGINX**

NGINX is a **high-performance web server**, reverse proxy, and load balancer. In containerized environments, NGINX is commonly used to:

- Serve static content
- Act as a reverse proxy
- Load balance multiple backend services

---

## **6. Official Docker Image**

An official Docker image is an image **maintained by the software vendor or Docker**, following best practices for security, updates, and performance.

The nginx:latest image is an official image and is **production-ready**.

---

## **7. Ubuntu-Based Image**

An Ubuntu-based image uses the **Ubuntu Linux distribution** as the base OS.

Characteristics:

- Large image size
- Full OS utilities available
- Easier debugging
- Larger attack surface

Used mainly for **learning and debugging**, not production.

---

## **8. Alpine Linux**

Alpine Linux is a **minimal, security-focused Linux distribution** designed for containers.

Characteristics:

- Very small size
- Uses musl libc instead of glibc
- Faster image pull and startup
- Minimal packages

Highly preferred in **microservices and cloud environments**.

---

## **9. Dockerfile**

A Dockerfile is a **text file containing instructions** used to build a Docker image.

Common instructions used in this experiment:

- FROM – specifies base image
- RUN – executes commands during build
- EXPOSE – documents the container’s listening port
- CMD – specifies default command to run

---

## **10. Image Layers**

Docker images are built in **layers**, where each instruction in a Dockerfile creates a new layer.

Benefits of layers:

- Faster builds
- Efficient caching
- Reduced storage usage

More layers usually mean a **larger image size**.

---

## **11. Docker History**

docker history is a command used to inspect **individual layers** of an image. It shows:

- Layer size
- Commands used to create each layer
- Image build structure

Used in this experiment to compare Ubuntu, Alpine, and official images.

---

## **12. Port Mapping**

Port mapping connects a **container port** to a **host machine port** using -p host_port:container_port.

Example: 

```powershell
-p 8080:80
```

This allows access to container services via the host browser.

---

## **13. Reverse Proxy**

A reverse proxy is a server that **forwards client requests to backend servers**.

NGINX commonly acts as a reverse proxy in containerized and microservices architectures.

---

## **14. Attack Surface**

Attack surface refers to the **number of potential vulnerabilities** in a system.

Larger images (like Ubuntu-based) have:

- More packages
- More system utilities
- Higher attack surface

Smaller images (like Alpine) reduce security risks.

---

## **15. Production-Ready**

An image is considered production-ready if it:

- Is optimized for performance
- Receives regular security updates
- Has minimal vulnerabilities
- Follows best container practices

Official NGINX and Alpine-based images are generally production-ready.

---

## **16. Microservices**

Microservices is an architectural style where applications are built as **small, independent services**.

Alpine-based NGINX images are ideal for microservices due to:

- Small size
- Fast startup
- Low resource usage

---

## **17. CI/CD Pipeline**

CI/CD (Continuous Integration / Continuous Deployment) automates building, testing, and deploying applications. Smaller images like Alpine improve pipeline speed and efficiency.

---

## **18. Docker Registry**

A Docker registry is a storage location for Docker images.

Example:

- Docker Hub (docker.io)

Images like nginx, ubuntu, and alpine are pulled from Docker Hub.

---

# Aim

To deploy NGINX using different Docker base images (Official, Ubuntu, and Alpine), compare their image sizes and layers, and analyze performance, security, and real-world use cases in containerised environments.

### **Objectives**

- Deploy NGINX using:
    - Official NGINX image
    - Ubuntu-based image
    - Alpine-based image
- Compare Docker image sizes and layers
- Understand the impact of base images on performance and security
- Identify real-world use cases of each approach

**PART 1: OFFICIAL NGINX IMAGE**

```powershell
docker pull nginx:latest
```

```powershell
output:
5-B3-ccvt % docker pull nginx:latest
latest: Pulling from library/nginx
Digest: sha256:9dd288848f4495869f76676e419ae2d767ca99fece2ec37ec0261f9fdaab5204
Status: Image is up to date for nginx:latest
docker.io/library/nginx:latest
```

## **Step 2: Run container**

```powershell
docker run -d --name nginx-official -p 8080:80 nginx
```

```powershell
output:
5-B3-ccvt % docker run -d --name nginx-official -p 8080:80 nginx
b803d61c0b08d105b0c2d806258556a4ec44794d59e621ee0aba272497883d55
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % 
```

## **Step 3: Verify**

```powershell
http://localhost:8080
```

![image.png](Experiment%20-3/image.png)

## **PART 2: NGINX USING UBUNTU BASE IMAGE**

### **Step 1: Create a folder**

```powershell
mkdir nginx-ubuntu
cd nginx-ubuntu
```

### Creating a Dockerfile

```powershell
nano Dockerfile
```

add this to Dockerfile:

```powershell
FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Build Image

```powershell
docker build -t nginx-ubuntu .
```

```powershell
Output: 
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % docker build -t nginx-ubuntu .
[+] Building 30.6s (6/6) FINISHED                      docker:desktop-linux
 => [internal] load build definition from Dockerfile                   0.0s
 => => transferring dockerfile: 215B                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04        0.1s
 => [internal] load .dockerignore                                      0.0s
 => => transferring context: 2B                                        0.0s
 => CACHED [1/2] FROM docker.io/library/ubuntu:22.04@sha256:c7eb02004  0.0s
 => => resolve docker.io/library/ubuntu:22.04@sha256:c7eb020043d8fc2a  0.0s
 => [2/2] RUN apt-get update &&     apt-get install -y nginx &&       27.8s
 => exporting to image                                                 2.5s 
 => => exporting layers                                                2.0s 
 => => exporting manifest sha256:361a2c1ac01d409fa134cd46e1719118e814  0.0s 
 => => exporting config sha256:880dc5e63abc808ad34026a17d9eddb786fce7  0.0s 
 => => exporting attestation manifest sha256:42fdd1efb6adf1b1492ba7ae  0.0s 
 => => exporting manifest list sha256:6955e8a1dc779bc1fb2f414d86dfe81  0.0s 
 => => naming to docker.io/library/nginx-ubuntu:latest                 0.0s
 => => unpacking to docker.io/library/nginx-ubuntu:latest              0.5s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/qgvzb768v5ir6atrzdafmdkyy
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % 
```

### **Step 4: Run container**

```powershell
docker run -d --name nginx-ubuntu -p 8081:80 nginx-ubuntu
```

```powershell
Output: 
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % docker run -d --name nginx-ubuntu -p 8081:80 nginx-ubuntu
9465cd7ffc708fae44675c552b07872cadfd9ad32b560bab82471e21a9c0e9f6
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % 
```

Open Browser:

[http://localhost:808](http://localhost:8081/)1

![image.png](Experiment%20-3/image%201.png)

### **Step 5: Check size**

```powershell
docker images | grep nginx
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % docker images | grep nginx
WARNING: This output is designed for human readability. For machine-readable output, please use --format.
nginx-ubuntu:latest        6955e8a1dc77        187MB         50.5MB   U    
nginx:latest               9dd288848f44        258MB         64.1MB   U    
ananyakarn@Ananyas-MacBook-Air-2 nginx-ubuntu % 
```

### **PART 3: NGINX USING ALPINE BASE IMAGE**

1. Create a folder

```powershell
cd ..
mkdir nginx-alpine
cd nginx-alpine
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

### **Step 2: Dockerfile**

```powershell
nano Dockerfile
```

add this to the nano file:

```powershell
FROM alpine:latest
RUN apk add --no-cache nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### **Step 3: Build image**

```powershell
docker build -t nginx-alpine .
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker build -t nginx-alpine .
[+] Building 12.4s (7/7) FINISHED                      docker:desktop-linux
 => [internal] load build definition from Dockerfile                   0.0s
 => => transferring dockerfile: 130B                                   0.0s
 => [internal] load metadata for docker.io/library/alpine:latest      10.7s
 => [auth] library/alpine:pull token for registry-1.docker.io          0.0s
 => [internal] load .dockerignore                                      0.0s
 => => transferring context: 2B                                        0.0s
 => [1/2] FROM docker.io/library/alpine:latest@sha256:25109184c71bdad  0.0s
 => => resolve docker.io/library/alpine:latest@sha256:25109184c71bdad  0.0s
 => [2/2] RUN apk add --no-cache nginx                                 1.5s
 => exporting to image                                                 0.2s
 => => exporting layers                                                0.1s
 => => exporting manifest sha256:59d4ed14a60711393d6d0153be8b1e7d239a  0.0s
 => => exporting config sha256:9c9f34e6039f06813c62ee8fd30c80b8ebd487  0.0s 
 => => exporting attestation manifest sha256:db4357c25af73e9c63c8e74f  0.0s
 => => exporting manifest list sha256:7aed72a533184c9a8b465bb0500769f  0.0s
 => => naming to docker.io/library/nginx-alpine:latest                 0.0s
 => => unpacking to docker.io/library/nginx-alpine:latest              0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/r0c3fmg15m5uja3b6zpknxlkz
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

### **Step 4: Run container**

```powershell
docker run -d --name nginx-alpine -p 8082:80 nginx-alpine
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker run -d --name nginx-alpine -p 8082:80 nginx-alpine
f9556333adcd483baf606220045486ef96c016a08f897dbfeb78a70f0eaefe79
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

Image size comparison

```powershell
docker images | grep nginx
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker images | grep nginx
WARNING: This output is designed for human readability. For machine-readable output, please use --format.
nginx-alpine:latest        7aed72a53318       16.7MB         5.08MB   U    
nginx-ubuntu:latest        6955e8a1dc77        187MB         50.5MB   U    
nginx:latest               9dd288848f44        258MB         64.1MB   U    
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

## **PART 4: IMAGE LAYERS**

```powershell
docker history nginx
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker history nginx
IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
9dd288848f44   27 hours ago   CMD ["nginx" "-g" "daemon off;"]                0B        buildkit.dockerfile.v0
<missing>      27 hours ago   STOPSIGNAL SIGQUIT                              0B        buildkit.dockerfile.v0
<missing>      27 hours ago   EXPOSE map[80/tcp:{}]                           0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENTRYPOINT ["/docker-entrypoint.sh"]            0B        buildkit.dockerfile.v0
<missing>      27 hours ago   COPY 30-tune-worker-processes.sh /docker-ent…   16.4kB    buildkit.dockerfile.v0
<missing>      27 hours ago   COPY 20-envsubst-on-templates.sh /docker-ent…   12.3kB    buildkit.dockerfile.v0
<missing>      27 hours ago   COPY 15-local-resolvers.envsh /docker-entryp…   12.3kB    buildkit.dockerfile.v0
<missing>      27 hours ago   COPY 10-listen-on-ipv6-by-default.sh /docker…   12.3kB    buildkit.dockerfile.v0
<missing>      27 hours ago   COPY docker-entrypoint.sh / # buildkit          8.19kB    buildkit.dockerfile.v0
<missing>      27 hours ago   RUN /bin/sh -c set -x     && groupadd --syst…   84.2MB    buildkit.dockerfile.v0
<missing>      27 hours ago   ENV DYNPKG_RELEASE=1~trixie                     0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENV PKG_RELEASE=1~trixie                        0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENV ACME_VERSION=0.3.1                          0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENV NJS_RELEASE=1~trixie                        0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENV NJS_VERSION=0.9.4                           0B        buildkit.dockerfile.v0
<missing>      27 hours ago   ENV NGINX_VERSION=1.29.4                        0B        buildkit.dockerfile.v0
<missing>      27 hours ago   LABEL maintainer=NGINX Docker Maintainers <d…   0B        buildkit.dockerfile.v0
<missing>      2 days ago     # debian.sh --arch 'arm64' out/ 'trixie' '@1…   109MB     debuerreotype 0.17
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

```powershell
docker history nginx-ubuntu
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker history nginx-ubuntu
IMAGE          CREATED       CREATED BY                                      SIZE      COMMENT
6955e8a1dc77   2 hours ago   CMD ["nginx" "-g" "daemon off;"]                0B        buildkit.dockerfile.v0
<missing>      2 hours ago   EXPOSE [80/tcp]                                 0B        buildkit.dockerfile.v0
<missing>      2 hours ago   RUN /bin/sh -c apt-get update &&     apt-get…   57.5MB    buildkit.dockerfile.v0
<missing>      3 weeks ago   /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago   /bin/sh -c #(nop) ADD file:643ece0a7a3a6026f…   79.1MB    
<missing>      3 weeks ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B        
<missing>      3 weeks ago   /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B        
<missing>      3 weeks ago   /bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH     0B        
<missing>      3 weeks ago   /bin/sh -c #(nop)  ARG RELEASE                  0B        
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```

```powershell
docker history nginx-alpine
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % docker history nginx-alpine
IMAGE          CREATED       CREATED BY                                      SIZE      COMMENT
7aed72a53318   2 hours ago   CMD ["nginx" "-g" "daemon off;"]                0B        buildkit.dockerfile.v0
<missing>      2 hours ago   EXPOSE [80/tcp]                                 0B        buildkit.dockerfile.v0
<missing>      2 hours ago   RUN /bin/sh -c apk add --no-cache nginx # bu…   2.3MB     buildkit.dockerfile.v0
<missing>      7 days ago    CMD ["/bin/sh"]                                 0B        buildkit.dockerfile.v0
<missing>      7 days ago    ADD alpine-minirootfs-3.23.3-aarch64.tar.gz …   9.36MB    buildkit.dockerfile.v0
ananyakarn@Ananyas-MacBook-Air-2 nginx-alpine % 
```