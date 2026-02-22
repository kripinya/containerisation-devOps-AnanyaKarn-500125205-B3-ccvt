### Experiment file
Course Name- Containerisation and DevOps

Student Name- Ananya Karn

Sap_ID - 500125205

Roll No. - R2142231061

Semester - 6th

Instructor - Prateek Gautam Sir

github pages : https://kripinya.github.io/containerisation-devOps-AnanyaKarn-500125205-B3-ccvt/

---

### Experiment-0-1 : Setup of Ubuntu Virtual Machine using Vagrant and VMware Fusion and Deployment of Nginx & Docker

Date: January 21, 2026

Experiment No. - 1

Aim/ Objective

The aim of this experiment is to provision an Ubuntu 22.04 virtual machine using Vagrant with VMware Fusion on Apple Silicon architecture, install and configure the Nginx web server, and deploy Docker Engine to validate containerized application execution.

</aside>

**Software and hardware requirements:**
| **Component** | **Details** |
| --- | --- |
| Host Operating System | macOS (Apple Silicon – ARM64) |
| Virtualization Platform | VMware Fusion |
| VM Automation Tool | Vagrant |
| Guest OS | Ubuntu 22.04 LTS (ARM64) |
| Web Server | Nginx |
| Container Platform | Docker Engine |
| Code Editor | Visual Studio Code |
| System Architecture | ARM64 |

**Theory/BackGround**

**Virtualization**

Virtualization is a technology that allows multiple operating systems to run on a single physical machine by abstracting the underlying hardware resources. Instead of dedicating one physical system to one operating system, virtualization enables efficient utilization of CPU, memory, and storage by creating isolated virtual environments known as virtual machines. Each virtual machine behaves like a real computer with its own operating system and applications, while sharing the same physical hardware.

**Vagrant**

Vagrant is an open-source tool used for automating the creation and management of virtual machines. It provides a simple and reproducible workflow for setting up development environments using configuration files known as *Vagrantfiles*. With Vagrant, virtual machines can be created, configured, started, stopped, and destroyed using simple command-line instructions. This eliminates manual setup and ensures consistency across different systems, making it highly useful in DevOps and cloud-based environments.

**VMware Fusion**

VMware Fusion is a virtualization platform used on macOS to run virtual machines efficiently. On Apple Silicon (ARM64) architecture, VMware Fusion is preferred because it provides native support for ARM-based processors. Other virtualization tools such as VirtualBox have limited or unstable support on Apple Silicon, whereas VMware Fusion is optimized for performance and compatibility. Therefore, VMware Fusion is an ideal provider for running Ubuntu virtual machines on macOS systems with Apple Silicon.

**Nginx**

Nginx is a high-performance web server widely used for serving static and dynamic web content. It is known for its lightweight architecture, high concurrency handling, and low memory usage. Nginx is commonly used as a web server, reverse proxy, and load balancer in modern web applications. In this experiment, Nginx is installed inside the Ubuntu virtual machine to demonstrate the deployment and management of a web service.

**Docker**

Docker is an open-source containerization platform that allows applications to be packaged along with their dependencies into lightweight containers. Containers ensure that applications run consistently across different environments by isolating them from the underlying system. Docker is widely used in DevOps practices because it simplifies application deployment, improves scalability, and reduces configuration issues. In this experiment, Docker Engine is installed inside the Ubuntu virtual machine to validate container execution using a sample container.

**Virtual Machines vs Containers**
The main difference between virtual machines and containers lies in their architecture and resource usage. Virtual machines include a full operating system along with the application, making them heavier and slower to start. Containers, on the other hand, share the host operating system kernel and only include the application and its dependencies, making them lightweight and faster. While virtual machines provide strong isolation at the hardware level, containers offer efficient and scalable application deployment. Both technologies are essential in modern infrastructure, and this experiment demonstrates their combined usage.

---
**System Architecture/Setup Description**

In this experiment, macOS acts as the host operating system. VMware Fusion is used as the virtualization provider, while Vagrant automates the creation and management of the Ubuntu 22.04 ARM virtual machine. Inside the virtual machine, Nginx is deployed as a web server and Docker Engine is installed to run containerized applications.

---
**Setup:**
**PART A — Experiment 0 (Environment Setup)**
To install and configure required tools (WSL/Ubuntu, Docker, Vagrant, virtualization platform) for performing containerisation experiments.
Include:
- Host OS (macOS Apple Silicon)
- VMware Fusion
- Vagrant
- Docker
- Ubuntu ARM64

**Procedure-**
**Step 1 : Installation and verification of Vagrant:**
Vagrant is used to automate the creation and management of virtual machines.
To install Vagrant, run these command in the local terminal of the host system:
```java
brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant
```
![image.png](./assets/image.png)
First, the installation of Vagrant is verified on the host system using the terminal.
```java
vagrant --version
```
![image.png](./assets/e1_image1.png)
**Explanation:**
This command checks whether Vagrant is correctly installed on the macOS system and displays the installed version.

**Step 2: Installation and Setup of VMware Fusion**
VMware Fusion is used as the virtualization provider for Apple Silicon (ARM64) architecture.
1. VMware Fusion is downloaded from the official VMware website.
2. The application is installed by dragging it into the Applications folder.
3. VMware Fusion is opened once to allow system permissions.
4. Required permissions such as system extensions and network access are granted.

**Explanation:**
VMware Fusion provides native ARM support on Apple Silicon, making it suitable for running Ubuntu virtual machines efficiently.
![image.png](./assets/e1_image2.png)
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%203.png)


**Step 3: Creation of Project Directory**
A dedicated directory is created to store Vagrant configuration files.
```powershell
mkdir ubuntu-vagrant
cd ubuntu-vagrant
```
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%204.png)
**Explanation:**
This directory contains the Vagrantfile, which defines the virtual machine configuration.

---
**Step 4: Configuration of Vagrantfile**
The virtual machine configuration is defined using a Vagrantfile.
```powershell
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.provider "vmware_desktop" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
```
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%205.png)
**Explanation:**
This configuration specifies the Ubuntu 22.04 box compatible with ARM architecture and assigns CPU and memory resources using VMware Fusion as the provider.

---
**Step 5: Starting the Virtual Machine**
The Ubuntu virtual machine is started using the following command:
```powershell
vagrant up --provider=vmware_desktop
```
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%206.png)
**Explanation:**
This command downloads the required Ubuntu box and boots the virtual machine using VMware Fusion.

---
**Step 6: Accessing the Virtual Machine**
Secure shell access to the virtual machine is established using:
```powershell
vagrant ssh
```
![Screenshot 2026-01-21 at 12.22.12 PM.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/c1cc5658-9d03-4015-8405-d01744ed4c3a.png)
**Explanation:**
This command allows the user to interact with the Ubuntu virtual machine through the terminal.

---
**Step 7: Installation of Nginx Web Server**
The Nginx web server is installed inside the Ubuntu virtual machine.
```powershell
sudo apt update
sudo apt install -y nginx
```
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/5198099b-8eb4-4485-84e9-61954600fd0e.png)
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%207.png)
The Nginx service is started and enabled:
```powershell
sudo systemctl start nginx
sudo systemctl enable nginx
```
The status of the service is checked using:
```powershell
systemctl status nginx
```
![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/2d132b8a-9291-4dcb-a763-423db1af30c2.png)
**Explanation:**
These commands install and configure Nginx to run as a web server inside the virtual machine.
```powershell
vagrant@vagrant:~$ curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>
<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>
<p><em>Thank you for using nginx.</em></p>
</body>
</html>
vagrant@vagrant:~$ 
```
---
**Step 8: Installation of Docker Engine**

Docker Engine is installed inside the Ubuntu virtual machine to enable containerization.

```powershell
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo apt install -y docker.io
```

![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%208.png)

Docker repository is added and Docker Engine is installed.

After installation, the Docker service is verified by running:

```powershell
docker --version
```

![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%209.png)

---

### **Step 9: Verification of Docker Installation**

A test container is executed to verify successful installation of Docker.

```powershell
docker run hello-world
```

![image.png](LAB-1/Experiment-0-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using%20Vagrant%20and%20VMware%20Fusion%20and%20Deployment%20of%20Nginx%20%26%20Docker/image%2010.png)

**Explanation:**

This command downloads and runs a test Docker image, confirming that Docker is installed and functioning correctly.

---

This procedure successfully completes:

- Virtual machine provisioning using Vagrant
- Virtualization using VMware Fusion
- Deployment of Nginx web server
- Installation and verification of Docker Engine

> Result:
> 

> Ubuntu virtual machine was successfully created using Vagrant and VMware Fusion. Nginx web server and Docker Engine were installed and verified successfully.
> 

---

## **VM vs Container Comparison**

### VM:

![image.png](./assets/e1_image1.png)

### Container:

![image.png](./assets/e1_image)

| **Parameter** | **VM** | **Container** |
| --- | --- | --- |
| Boot Time | High | Very Low |
| RAM Usage | High | Low |
| CPU Overhead | Higher | Minimal |
| Disk Usage | Large | Small |
| Isolation | Strong | Moderate |

## **Observations**

- ARM64 architecture requires compatible virtualization support
- Vagrant simplifies VM provisioning
- Docker runs inside the virtual machine
- Nginx service runs successfully on Ubuntu

---

## Conclusion

The experiment successfully demonstrated the creation of a DevOps-ready environment using Vagrant and VMware Fusion. The installation of Nginx and Docker validated service deployment and container execution within the virtual machine.

---
### EXPERIMENT 2

Date: January 22, 2026

**Docker Installation, Configuration, and Running Images**

**Aim / Objective:** To install and configure Docker, pull images from Docker Hub, run containers with port mapping, and perform container lifecycle management operations such as start, stop, remove, and image deletion.

---
**Software & Hardware Requirements**
| **Component** | **Details** |
| --- | --- |
| Host OS | macOS (Apple Silicon – ARM64) |
| Container Platform | Docker Engine / Docker Desktop |
| Image Used | nginx |
| Terminal | macOS Terminal |
| Internet | Required (for pulling images) |

**Theory**
**Image**
A **Docker Image** is a **read-only template** that contains the application code, libraries, dependencies, and configuration needed to run a container.
Images are built once and can be reused to create multiple containers.
Example: nginx:latest, ubuntu:24.04

**Container**

A **Container** is a **running instance of a Docker image**.

It is lightweight, isolated, and shares the host operating system kernel while running independently from other containers.

Key points:

- Fast startup
- Portable across environments
- Uses fewer resources than virtual machines

**Port Mapping**

**Port mapping** connects a port on the host machine to a port inside the container, allowing external access to services running inside the container.

Example:

```powershell
docker run -p 8080:80 nginx
```

- 8080 → Host port
- 80 → Container port

This allows accessing the containerized application via:

```powershell
http://localhost:8080
```
**Docker Lifecycle**

The typical **container lifecycle** follows these stages:

1. **Create** – Container is created from an image.
2. **Run** – Container starts executing the application.
3. **Stop** – Execution is paused or terminated.
4. **Remove** – Container is deleted when no longer needed.

---

**Procedure**

**Step 1 — Pull Docker Image**

```powershell
docker pull nginx
```
![image.png](EXPERIMENT%202/image.png)

Downloads the official nginx image from Docker Hub.

---
**Step 2 — Run Container with Port Mapping**

```powershell
docker run -d -p 8080:80 --name nginx-container nginx
```

![image.png](EXPERIMENT%202/image%201.png)

- d → detached mode
- p 8080:80 → host port 8080 mapped to container port 80
- -name → custom container name

---

### **Step 3 — Verify Running Container**

```powershell
docker ps
```

![image.png](EXPERIMENT%202/image%202.png)

Then verify Nginx:

```powershell
curl localhost:8080
```

![image.png](EXPERIMENT%202/image%203.png)

OR open browser:

```powershell
http://localhost:8080
```

![image.png](EXPERIMENT%202/image%204.png)

You should see “Welcome to nginx!”

---

### **Step 4 — Stop Container**

```powershell
docker stop nginx-container
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % docker stop nginx-container
nginx-container
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % 
```

---

### **Step 5 — Remove Container**

```powershell
docker rm nginx-container
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % docker rm nginx-container
nginx-container
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % 
```

---

### **Step 6 — Remove Image**

```powershell
docker rmi nginx
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % docker rmi nginx
Untagged: nginx:latest
Deleted: sha256:341bf0f3ce6c5277d6002cf6e1fb0319fa4252add24ab6a0e262e0056d313208
ananyakarn@Ananyas-MacBook-Air-2 containerisation-devOps-AnanyaKarn-500125205-B3-ccvt % 
```

If image in use → stop/remove container first.

---

## **Container Lifecycle Summary**

Image → Container Created → Running → Stopped → Removed

---

## **Observations**

Example points:

- Image pulled successfully from Docker Hub
- Container exposed nginx service on port 8080
- docker ps shows active containers
- Containers start quickly with minimal overhead

---

### Result

<aside>
<img src="https://www.notion.so/icons/code_blue.svg" alt="https://www.notion.so/icons/code_blue.svg" width="40px" />

Docker image was successfully pulled, container executed with port mapping, verified through browser output, and lifecycle operations (stop, remove, image removal) were completed successfully.

</aside>

---

## Conclusion

> The experiment demonstrated Docker fundamentals including image pulling, container execution, and lifecycle management. It shows how containers provide lightweight and efficient application deployment.

-----

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
---

## PART 5: FUNCTIONAL TASK – SERVING CUSTOM HTML USING NGINX

### Step 1: Create Custom HTML File

```bash
mkdir html
echo "<h1>Hello from Docker NGINX</h1>" > html/index.html
## COMPARISON SUMMARY

### Image Comparison Table

| Feature | Official NGINX Image | Ubuntu-based Image | Alpine-based Image |
|---|---|---|---|
| Image Size | Medium | Large | Very Small |
| Startup Time | Fast | Slow | Very Fast |
| Security Surface | Medium | Large | Small |
| Debugging Tools | Limited | Excellent | Minimal |
| Ease of Use | Very Easy | Medium | Medium |
| Production Ready | Yes | Rarely | Yes |

---

## PART 6: WHEN TO USE WHICH IMAGE
### Official NGINX Image
Recommended for:
- Production deployments
- Standard web hosting
- Reverse proxy or load balancer setup

### Ubuntu-Based Image
Recommended for:
- Learning Linux + NGINX internals
- Debugging environments
- Custom system-level dependencies

### Alpine-Based Image
Recommended for:
- Microservices architectures
- Cloud-native applications
- CI/CD pipelines and Kubernetes workloads

---

## PART 7: OBSERVATIONS

- Alpine image showed the smallest size and fewer layers, resulting in faster image pull and startup time.
- Ubuntu-based image provided more utilities but increased size and attack surface.
- Official NGINX image offered a balanced approach between optimization and usability.
- Docker image layers help optimize build caching and storage reuse.

---

## RESULT

NGINX was successfully deployed using Official, Ubuntu-based, and Alpine-based Docker images. Image size and layer analysis demonstrated the impact of base image selection on performance, security, and resource utilization.

---

## CONCLUSION

The experiment demonstrated that base image selection plays a critical role in container performance, security, and portability. Alpine-based images are best suited for lightweight microservices, Ubuntu-based images are useful for debugging and learning, while official NGINX images are preferred for production-ready deployments.

---
# EXPERIMENT-4 Docker Essentials

# **Docker Essentials — Dockerfile, .dockerignore, Tagging and Publishing**

### **Aim / Objective**

To containerize a simple application using Dockerfile, optimize the build process using .dockerignore, build and tag Docker images, run and manage containers, and understand the basics of image versioning and publishing workflows.

## **THEORY / BACKGROUND**

### **Dockerfile**

A Dockerfile is a set of instructions used to automate the creation of Docker images. Each instruction creates a layer in the image, making builds reproducible and portable across environments.

---

### **Docker Image**

A Docker image is a lightweight, executable package containing application code, runtime, libraries, and dependencies required to run an application.

---

### **Docker Container**

A container is a running instance of a Docker image. Containers are isolated from the host system but share the host kernel, making them lightweight compared to virtual machines.

---

### **.dockerignore**

The .dockerignore file prevents unnecessary files from being copied into the Docker image during build. This improves:

- Build speed
- Image size
- Security
- Performance

---

### **Image Tagging**

Tagging assigns version labels to images, allowing better version control and deployment management.

Example:

- my-flask-app:latest
- my-flask-app:1.0

---

### **Container Lifecycle**

Containers usually follow this lifecycle:

Image → Run → Running → Stop → Remove

Understanding this is essential for container management in DevOps workflows.

---

## **Software & Hardware Requirements**

| **Component** | **Details** |
| --- | --- |
| Host OS | macOS (Apple Silicon) |
| Container Platform | Docker Desktop |
| Language | Python |
| Framework | Flask |
| Editor | VS Code / Terminal |
| Internet | Required |

---

# **PROCEDURE**

### **PART 1 — Creating a Simple Flask Application**

**Step 1: Create Project Folder**

```powershell
mkdir my-flask-app
cd my-flask-app
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image.png)

**Step 2: Create app.py**

```powershell
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Docker!"

@app.route('/health')
def health():
    return "OK"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

**Step 3: Create requirements.txt**

```powershell
Flask==2.3.3
```

## **PART 2 — Creating Dockerfile**

Create a file named **Dockerfile**:

```powershell
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

- Uses lightweight Python base image
- Sets working directory
- Installs dependencies
- Copies application code
- Exposes app port
- Defines startup command

## **PART 3 — Creating .dockerignore**

Create file:

```powershell
__pycache__/
*.pyc
*.pyo
.env
.venv
.vscode/
.idea/
.git/
.DS_Store
*.log
```

This prevents unnecessary files from entering the image, reducing size and improving security.

---

## **PART 4 — Building Docker Image**

Run:

```powershell
docker build -t my-flask-app .
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%201.png)

Then:

```powershell
docker images
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%202.png)

## **PART 5 — Running the Container**

Run:

```powershell
docker run -d -p 5000:5000 --name flask-container my-flask-app
```

```powershell
ananyakarn@Ananyas-MacBook-Air-2 my-flask-app % docker run -d -p 5001:5000 --name flask-container my-flask-app
34f2aef1e0c594d3c24fda88cc61ee855be01591ab49b0f0478e50de37fb9c20
ananyakarn@Ananyas-MacBook-Air-2 my-flask-app % 
```

Verifying:

```powershell
ananyakarn@Ananyas-MacBook-Air-2 my-flask-app % curl http://localhost:5001
Hello from Docker!%                                                                                                                                        
ananyakarn@Ananyas-MacBook-Air-2 my-flask-app % 
```

**Check running containers:**

```powershell
docker ps
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%203.png)

### **Check container logs**

```powershell
docker logs flask-container
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%204.png)

### **PART 6 — Container Management**

```powershell
docker stop flask-container
docker start flask-container
docker rm -f flask-container
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%205.png)

### **PART 7 — Image Tagging**

```powershell
docker build -t my-flask-app:1.0 .
docker tag my-flask-app:latest my-flask-app:v1.0
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%206.png)

Then:

```powershell
docker images
```

![image.png](EXPERIMENT-4%20Docker%20Essentials/image%207.png)

Tagging helps maintain versions for deployment and rollback.

# **Observations**

- Flask app runs successfully inside container.
- Dockerfile simplifies deployment.
- .dockerignore reduces unnecessary files.
- Tagging allows version management.
- Container logs confirm application execution.

# **Result**

> A Flask application was successfully containerized using Dockerfile. The container was executed, verified, and managed through Docker lifecycle commands. Image tagging and build optimization concepts were demonstrated.
> 

# **Conclusion**

> This experiment demonstrated essential Docker concepts including application containerization, image creation, .dockerignore optimization, image tagging, and container lifecycle management, forming the foundation for real-world DevOps workflows.
