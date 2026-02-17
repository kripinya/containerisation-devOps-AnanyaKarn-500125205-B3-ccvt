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
>