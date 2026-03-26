# GitHub Pages Deployment Workflow

This project is part of my DevOps roadmap learning. It demonstrates how to set up Continuous Integration and Continuous Deployment (CI/CD) using **GitHub Actions** to automatically deploy a static website to **GitHub Pages**.

## Requirements Met:
- [x] Repository created.
- [x] Simple `index.html` file included.
- [x] This `README.md` file explaining the project.
- [x] GitHub Actions workflow `deploy.yml` configured.
- [x] Workflow triggers **only** on pushes to `main` that modify `index.html`.
- [x] Website is accessible via GitHub Pages URL.

## How it works
Any changes made to the `gh-deployment/index.html` file and pushed to the `main` branch will automatically trigger the GitHub Actions workflow and deploy the new version of the site.
