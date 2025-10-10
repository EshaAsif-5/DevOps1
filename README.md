# DevOps Project – CI/CD Pipeline for HTML Website

## Description
This project demonstrates an automated CI/CD pipeline using **GitHub Actions**, **Docker**, and **Docker Hub**.
The pipeline builds a Docker image for a static HTML website and pushes it automatically to Docker Hub whenever code is pushed to the main branch.

## How to Run Locally

docker build -t rahatqadeer/devops .
docker run -d -p 8080:80 rahatqadeer/devops

## Tools and Technologies  
- HTML, CSS – Frontend structure and styling  
- Docker – Containerization of the application  
- GitHub Actions – CI/CD automation  
- AWS EC2 (Ubuntu 24.04) – Deployment server  
- SSH Action (appleboy/ssh-action) – Secure remote deployment 

## 🚀 CI/CD Workflow Explanation  
1. Developer pushes code to the `main` branch.  
2. GitHub Actions automatically triggers the workflow.  
3. The pipeline connects to the EC2 instance via SSH.  
4. The EC2 server pulls the latest Docker image from Docker Hub.  
5. Any old running container is stopped and replaced with the latest version.  
6. The new version is launched and served . 

## GitHub Secrets Used  
| Secret Name | Description |
|--------------|-------------|
| EC2_HOST | Public IP address of EC2 instance |
| EC2_SSH_KEY | Private PEM key content for SSH access |
| DOCKERHUB_USERNAME | Docker Hub username |
| DOCKERHUB_TOKEN | Docker Hub access token |
<br>

## GitHub Secrets Used  
| Version | Description |
|--------------|-------------|
| 1.0 |  Initial project setup |
| 1.1 | Updated README.md with CI/CD details |
| 1.2 | AWS EC2 Deployment server |


