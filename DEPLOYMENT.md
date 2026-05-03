# 🚢 AETHER-1 Deployment Guide

This document outlines the procedures for deploying the AETHER-1 framework across various environments.

## 🪟 Windows Deployment
To create a standalone Windows executable:
1. Build the project in **Release** mode using CMake.
2. Navigate to the `Release` folder.
3. Run `windeployqt AETHER-1.exe` to package all necessary Qt dependencies.
4. Distribute the folder containing the `.exe` and the `.dll` files.

## 🐧 Linux Deployment (AppImage)
1. Build the project on a Linux machine.
2. Use `linuxdeployqt` to package the binary.
3. Generate an `.AppImage` for universal Linux compatibility.

## 🚀 Automated CI/CD (GitHub Actions)
The repository includes a pre-configured GitHub Action (`.github/workflows/release.yml`) that:
1. Automatically builds the Windows binary on every push to a version tag (e.g., `v1.0.0`).
2. Creates a official **GitHub Release**.
3. Uploads the built artifacts to the release page.

## 📦 Containerization (Docker)
The `Dockerfile` provided in the root directory allows you to deploy a consistent build environment:
```bash
docker build -t aether1-build-env .
docker run -it aether1-build-env
```

---
*For mission-critical deployments, ensure all LoRa transceivers are calibrated to the correct frequency (e.g., 868MHz/915MHz).*
