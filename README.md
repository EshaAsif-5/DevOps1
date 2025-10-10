#  DevOps Project – Automating CI/CD Pipeline

## 📘 Project Description
This project demonstrates a **Continuous Integration and Continuous Deployment (CI/CD)** pipeline for a **static HTML web application** using **GitHub Actions** and **Docker Hub**.

Whenever a developer pushes code to the `main` branch, GitHub Actions automatically:
1. Builds a Docker image using the project’s Dockerfile  
2. Logs in to Docker Hub using secure credentials (GitHub Secrets)  
3. Pushes the newly built image to Docker Hub automatically  

This automation ensures **consistency, faster delivery, and minimal manual work** — a key principle of modern DevOps practices.

## How to Run Locally

docker build -t rahatqadeer/devops . <br>
docker run -d -p 8080:80 rahatqadeer/devops

