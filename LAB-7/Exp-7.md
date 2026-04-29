# Experiment 7: CI/CD Pipeline using Jenkins, GitHub & Docker Hub

## Aim
To design and implement a CI/CD pipeline using Jenkins, GitHub, and Docker Hub.

## Objectives
* Understand CI/CD workflow
* Automate build & deployment
* Use Jenkins pipeline
* Push Docker image to Docker Hub

## 🛠️ Tools Used
* Jenkins
* Docker & Docker Compose
* GitHub
* Docker Hub
* Flask (Python)

## 📁 Project Structure
```text
my-app/
│── app.py
│── requirements.txt
│── Dockerfile
│── Jenkinsfile
```

## ⚙️ Steps Performed

### 1. Created GitHub Repository
* Repository: `my-app`
* Added source code and pipeline files

*(📸 Screenshot: GitHub repository structure)*

### 2. Created Flask Application
* Simple web app returning message

*(📸 Screenshot: app.py)*

### 3. Dockerized Application
* Created Dockerfile
* Built image locally

*(📸 Screenshot: Docker build output)*

### 4. Setup Jenkins using Docker
* Used `docker-compose`
* Accessed Jenkins on port 8080

*(📸 Screenshot: Jenkins dashboard)*

### 5. Configured Jenkins
* Installed plugins
* Added Docker Hub credentials

*(📸 Screenshot: Credentials setup)*

### 6. Created Pipeline Job
* Used Jenkinsfile from GitHub

*(📸 Screenshot: Pipeline configuration)*

### 7. Configured Webhook
* GitHub triggers Jenkins automatically

*(📸 Screenshot: Webhook settings)*

### 8. Executed CI/CD Pipeline
Pipeline stages:
* Clone
* Build Docker image
* Login to Docker Hub
* Push image

*(📸 Screenshot: Successful pipeline execution)*

## Workflow
Developer → GitHub → Webhook → Jenkins → Docker Build → Docker Hub

## Observations
* Jenkins automates CI/CD process
* Docker ensures consistent builds
* Webhooks enable automation
* Credentials improve security

## Result
Successfully implemented CI/CD pipeline where:
* Code is fetched from GitHub
* Docker image is built
* Image is pushed to Docker Hub automatically

## Questions
**1. What is Jenkinsfile?**
→ Pipeline as code

**2. What is CI/CD?**
→ Automation of integration & deployment

**3. Why Docker?**
→ Consistency across environments

**4. What is webhook?**
→ Event trigger from GitHub

**5. Why credentials in Jenkins?**
→ Secure storage of secrets

## Conclusion
CI/CD pipeline was successfully implemented using Jenkins, GitHub, and Docker Hub with automated build and deployment.
