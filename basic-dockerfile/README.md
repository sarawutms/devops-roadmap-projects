cat << 'EOF' > README.md
# Basic Dockerfile

This repository contains a solution for the **Basic Dockerfile** project from [roadmap.sh](https://roadmap.sh/projects/basic-dockerfile). 

The goal of this project is to create a simple Docker image that outputs a specific message to the console and then exits. It serves as a foundational exercise for understanding Docker configurations and container lifecycles.

## 🚀 Requirements Achieved
- [x] The Dockerfile is named `Dockerfile`.
- [x] Placed in the root directory of the project.
- [x] Uses `alpine:latest` as the base image.
- [x] Contains a single instruction to print `"Hello, Captain!"` before exiting.

## 🛠️ How to Build and Run

**1. Clone the repository:**
```bash
git clone [https://github.com/YOUR_GITHUB_USERNAME/basic-dockerfile.git](https://github.com/YOUR_GITHUB_USERNAME/basic-dockerfile.git)
cd basic-dockerfile
```
**2. Build the Docker image:**
```bash
docker build -t my-hello-app .
```
**3. Run the Docker container:**
```bash
docker run my-hello-app
```
## ✨Expected Output:
Plaintext
```bash
Hello, Captain!
```
