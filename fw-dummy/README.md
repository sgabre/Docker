# Embedded Software Docker Images

This repository contains **all the Dockerfiles and scripts required to build Docker images** used in the firmware CI/CD pipeline for building, testing, documenting, and releasing Embedded Software.  

These images are designed to be **multi-architecture**:
- **amd64** → for running jobs on GitHub Actions runners.
- **arm32v7 / arm64** → for running directly on a Raspberry Pi.

Each image is **specialized for a specific pipeline stage**, enabling easy reuse and maintenance.

---

## Repository Structure

```
root/
├── docker/
│ ├── static-analysis/ # Dockerfile for static code analysis
│ ├── quality-analysis/ # Dockerfile for code quality analysis
│ ├── security-analysis/ # Dockerfile for code security analysis
│ ├── doc/ # Dockerfile for documentation generation
│ ├── arm-build/ # Dockerfile for firmware compilation
│ ├── unit-test/ # Dockerfile for unit tests
│ ├── component-test/ # Dockerfile for component tests
│ ├── integration-test/ # Dockerfile for integration tests
│ ├── system-test/ # Dockerfile for system tests
│ ├── deploy-testbench/ # Dockerfile for deployment on testbench
│ ├── acceptance/ # Dockerfile for acceptance tests
│ ├── report/ # Dockerfile for metrics and reports generation
│ └── release/ # Dockerfile for packaging and release
│
├── ci/ # CI/CD scripts for building and pushing images
│ ├── setup-builder.sh # Create a multi-arch Docker Buildx builder
│ ├── build-images.sh # Build all images for multiple architectures
│ └── push-images.sh # Push images to Raspberry Pi Docker registry
│
├── .github/workflows/ # GitHub Actions workflow for building/pushing images
│ └── docker-build.yml
│
├── README.md
└── .gitignore
```

## Docker Image List

| Stage | Docker Image Name |
|-------|----------------|
| Static Analysis | `fw-static-analysis` |
| Code Quality Analysis | `fw-quality-analysis` |
| Code Security Analysis | `fw-security-analysis` |
| Firmware Detailed Design | `fw-doc` |
| Build | `fw-build` |
| Unit Testing | `fw-unit-test` |
| Component Testing | `fw-component-test` |
| Component Integration Testing | `fw-integration-test` |
| System Integration Testing | `fw-system-test` |
| Deployment (Testbench) | `fw-deploy-testbench` |
| System Testing | `fw-system-e2e` |
| Acceptance Testing | `fw-acceptance` |
| Documentation & Reporting | `fw-report` |
| Release & Distribution | `fw-release` |

---

## CI/CD Scripts

### `setup-builder.sh`
Creates a Docker Buildx builder capable of building multi-architecture images.

### `build-images.sh`
Builds all Docker images in this repository for multiple architectures (`amd64`, `arm32v7`, `arm64`).

### `push-images.sh`
Pushes all built images to the **private Docker registry** on the Raspberry Pi.

---

## Usage

1. Create the multi-arch builder:
```bash
./ci/setup-builder.sh
```

2. Build all images:

```bash
./ci/build-images.sh
```

3. Push images to the Raspberry Pi registry:
```bash
./ci/push-images.sh
```
*Notes*   
Images contain only the tools and dependencies required for each stage.  
Firmware and test source code resides in a separate repository.  
Each Dockerfile should be maintained to remain compatible with both amd64 and ARM architectures.  
