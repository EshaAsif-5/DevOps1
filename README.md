# DevOps Project – CI/CD Pipeline for HTML Website

## Description
This project demonstrates an automated CI/CD pipeline using **GitHub Actions**, **Docker**, and **Docker Hub**.
The pipeline builds a Docker image for a static HTML website and pushes it automatically to Docker Hub whenever code is pushed to the main branch.

## How to Run Locally

docker build -t rahatqadeer/devops .
docker run -d -p 8080:80 rahatqadeer/devops
