# Experiment-1: Setup of Ubuntu Virtual Machine using Vagrant and VMware Fusion and Deployment of Nginx & Docker

Date: January 21, 2026

## Experiment No. - 1

### Course Name- Containerisation and DevOps

### Student Name- Ananya Karn

### Sap_ID - 500125205

### Roll No. - R2142231061

### Semester - 6th

### Instructor - Prateek Gautam

---

## Aim/ Objective

<aside>
<img src="https://www.notion.so/icons/code_blue.svg" alt="https://www.notion.so/icons/code_blue.svg" width="40px" />

The aim of this experiment is to provision an Ubuntu 22.04 virtual machine using Vagrant with VMware Fusion on Apple Silicon architecture, install and configure the Nginx web server, and deploy Docker Engine to validate containerized application execution.

</aside>

## Software and hardware requirements:

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

## Theory/BackGround

### Virtualization

Virtualization is a technology that allows multiple operating systems to run on a single physical machine by abstracting the underlying hardware resources. Instead of dedicating one physical system to one operating system, virtualization enables efficient utilization of CPU, memory, and storage by creating isolated virtual environments known as virtual machines. Each virtual machine behaves like a real computer with its own operating system and applications, while sharing the same physical hardware.

### Vagrant

Vagrant is an open-source tool used for automating the creation and management of virtual machines. It provides a simple and reproducible workflow for setting up development environments using configuration files known as *Vagrantfiles*. With Vagrant, virtual machines can be created, configured, started, stopped, and destroyed using simple command-line instructions. This eliminates manual setup and ensures consistency across different systems, making it highly useful in DevOps and cloud-based environments.

### VMware Fusion

VMware Fusion is a virtualization platform used on macOS to run virtual machines efficiently. On Apple Silicon (ARM64) architecture, VMware Fusion is preferred because it provides native support for ARM-based processors. Other virtualization tools such as VirtualBox have limited or unstable support on Apple Silicon, whereas VMware Fusion is optimized for performance and compatibility. Therefore, VMware Fusion is an ideal provider for running Ubuntu virtual machines on macOS systems with Apple Silicon.

### Nginx

Nginx is a high-performance web server widely used for serving static and dynamic web content. It is known for its lightweight architecture, high concurrency handling, and low memory usage. Nginx is commonly used as a web server, reverse proxy, and load balancer in modern web applications. In this experiment, Nginx is installed inside the Ubuntu virtual machine to demonstrate the deployment and management of a web service.

### Docker

Docker is an open-source containerization platform that allows applications to be packaged along with their dependencies into lightweight containers. Containers ensure that applications run consistently across different environments by isolating them from the underlying system. Docker is widely used in DevOps practices because it simplifies application deployment, improves scalability, and reduces configuration issues. In this experiment, Docker Engine is installed inside the Ubuntu virtual machine to validate container execution using a sample container.

### Virtual Machines vs Containers

The main difference between virtual machines and containers lies in their architecture and resource usage. Virtual machines include a full operating system along with the application, making them heavier and slower to start. Containers, on the other hand, share the host operating system kernel and only include the application and its dependencies, making them lightweight and faster. While virtual machines provide strong isolation at the hardware level, containers offer efficient and scalable application deployment. Both technologies are essential in modern infrastructure, and this experiment demonstrates their combined usage.

---

## System Architecture/Setup Description

In this experiment, macOS acts as the host operating system. VMware Fusion is used as the virtualization provider, while Vagrant automates the creation and management of the Ubuntu 22.04 ARM virtual machine. Inside the virtual machine, Nginx is deployed as a web server and Docker Engine is installed to run containerized applications.

---

## Procedure-

### Step 1 : Installation and verification of Vagrant:

Vagrant is used to automate the creation and management of virtual machines.

To install Vagrant, run these command in the local terminal of the host system:

```java
brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image.png)

First, the installation of Vagrant is verified on the host system using the terminal.

```java
vagrant --version
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%201.png)

**Explanation:**

This command checks whether Vagrant is correctly installed on the macOS system and displays the installed version.

---

### **Step 2: Installation and Setup of VMware Fusion**

VMware Fusion is used as the virtualization provider for Apple Silicon (ARM64) architecture.

1. VMware Fusion is downloaded from the official VMware website.
2. The application is installed by dragging it into the Applications folder.
3. VMware Fusion is opened once to allow system permissions.
4. Required permissions such as system extensions and network access are granted.

**Explanation:**

VMware Fusion provides native ARM support on Apple Silicon, making it suitable for running Ubuntu virtual machines efficiently.

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%202.png)

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%203.png)

---

### **Step 3: Creation of Project Directory**

A dedicated directory is created to store Vagrant configuration files.

```powershell
mkdir ubuntu-vagrant
cd ubuntu-vagrant
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%204.png)

**Explanation:**

This directory contains the Vagrantfile, which defines the virtual machine configuration.

---

### **Step 4: Configuration of Vagrantfile**

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

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%205.png)

**Explanation:**

This configuration specifies the Ubuntu 22.04 box compatible with ARM architecture and assigns CPU and memory resources using VMware Fusion as the provider.

---

### **Step 5: Starting the Virtual Machine**

The Ubuntu virtual machine is started using the following command:

```powershell
vagrant up --provider=vmware_desktop
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%206.png)

**Explanation:**

This command downloads the required Ubuntu box and boots the virtual machine using VMware Fusion.

---

### **Step 6: Accessing the Virtual Machine**

Secure shell access to the virtual machine is established using:

```powershell
vagrant ssh
```

![Screenshot 2026-01-21 at 12.22.12 PM.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/c1cc5658-9d03-4015-8405-d01744ed4c3a.png)

**Explanation:**

This command allows the user to interact with the Ubuntu virtual machine through the terminal.

---

### **Step 7: Installation of Nginx Web Server**

The Nginx web server is installed inside the Ubuntu virtual machine.

```powershell
sudo apt update
sudo apt install -y nginx
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/5198099b-8eb4-4485-84e9-61954600fd0e.png)

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%207.png)

The Nginx service is started and enabled:

```powershell
sudo systemctl start nginx
sudo systemctl enable nginx
```

The status of the service is checked using:

```powershell
systemctl status nginx
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/2d132b8a-9291-4dcb-a763-423db1af30c2.png)

**Explanation:**

These commands install and configure Nginx to run as a web server inside the virtual machine.

---

### **Step 8: Installation of Docker Engine**

Docker Engine is installed inside the Ubuntu virtual machine to enable containerization.

```powershell
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo apt install -y docker.io
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%208.png)

Docker repository is added and Docker Engine is installed.

After installation, the Docker service is verified by running:

```powershell
docker --version
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%209.png)

---

### **Step 9: Verification of Docker Installation**

A test container is executed to verify successful installation of Docker.

```powershell
docker run hello-world
```

![image.png](Experiment-1%20Setup%20of%20Ubuntu%20Virtual%20Machine%20using/image%2010.png)

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

## **Observations**

- ARM64 architecture requires compatible virtualization support
- Vagrant simplifies VM provisioning
- Docker runs inside the virtual machine
- Nginx service runs successfully on Ubuntu

---

## Conclusion

The experiment successfully demonstrated the creation of a DevOps-ready environment using Vagrant and VMware Fusion. The installation of Nginx and Docker validated service deployment and container execution within the virtual machine.

---
