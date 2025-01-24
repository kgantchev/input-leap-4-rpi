Certainly! Here’s the README.md file in markdown format:

# **Input Leap for Raspberry Pi - Cross-Compilation via GitHub Actions**

This repository provides a workflow to **cross-compile** and **build** **Input Leap** for the **Raspberry Pi** using **GitHub Actions**. The goal of this project is to simplify the process of building Input Leap for ARM-based systems, like the Raspberry Pi, by using a CI/CD pipeline to automate the build on GitHub's x86-based runners.

### **Features**

- **Cross-compilation**: Build Input Leap for Raspberry Pi (ARM architecture) using GitHub's x86-based runners.
- **Manual Trigger**: The build can be triggered manually through the GitHub Actions interface.
- **Minimal Setup**: This project comes with all necessary configurations to get started quickly.

---

## **Getting Started**

These instructions will help you set up the project, trigger the workflow, and customize it for your specific use case.

### **Prerequisites**

Before you can build Input Leap for Raspberry Pi, ensure you have the following:

1. A **GitHub account** and access to this repository.
2. **Basic understanding of GitHub Actions**.
3. **GitHub token** (for triggering builds via API if desired).

---

### **Setup Instructions**

#### **1. Clone the Repository**

First, clone the repository to your local machine:

git clone https://github.com/your-username/your-repository.git
cd your-repository

2. Review the toolchain-arm64.cmake File

Ensure the toolchain-arm64.cmake file is correctly placed in the root directory (or in a directory of your choice). This file configures the cross-compilation toolchain for Raspberry Pi. The default toolchain-arm64.cmake file is set up for ARM-based Raspberry Pi builds.

If you decide to move this file, make sure to update the path in the CMake command within .github/workflows/build.yml accordingly.

3. Configure GitHub Actions

The GitHub Actions workflow is defined in the .github/workflows/build.yml file. This file contains the following key parts:
* Triggering Events: The workflow is manually triggered using workflow_dispatch.
* Cross-compilation Setup: Installs ARM cross-compilation tools (gcc-arm-linux-gnueabihf, g++-arm-linux-gnueabihf).
* Build Process: Uses CMake and make to compile the Input Leap project for the Raspberry Pi.

Ensure the workflow file is present and properly configured for your needs.

How to Trigger the Build

You can manually trigger the build using the GitHub Actions interface.

1. Manual Trigger from GitHub UI

* Go to the Actions Tab: In your GitHub repository, go to the Actions tab.
* Select Workflow: Select the workflow you want to trigger (e.g., “Build Input Leap for Raspberry Pi”).
* Click “Run workflow”: On the right side of the screen, you’ll see a “Run workflow” button. Click it.
* Fill Out Inputs (optional): If you have defined any inputs in the workflow_dispatch section of your workflow file, you will be prompted to enter them (e.g., version, architecture).
* Click “Run workflow” again: Once everything is set, click the button to start the build.

The workflow will then run and you can monitor its progress in the Actions tab.

2. Trigger the Build via API (Optional)

You can also trigger the workflow programmatically using GitHub’s REST API. Use the following curl command to trigger the workflow:

curl -X POST \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -d '{"ref":"main", "inputs":{"version":"latest", "architecture":"arm64"}}' \
  https://api.github.com/repos/your-username/your-repository/dispatches

Replace YOUR_GITHUB_TOKEN with your personal GitHub token, and replace your-username/your-repository with your repository’s username and name.

Directory Structure

The directory structure of this project is as follows:
```
/your-repository
├── .github/
│   └── workflows/
│       └── build.yml              # GitHub Actions workflow file
├── CMakeLists.txt                 # CMake configuration file
├── toolchain-arm64.cmake          # Cross-compilation toolchain
├── src/                           # Source code for Input Leap
└── README.md                      # This README file
```

Known Issues and Limitations

* The x86-based runners on GitHub Actions are used for cross-compiling, which may introduce some inconsistencies in the build process for specific hardware configurations.
* As of now, only minimal builds are included (without examples or documentation).
* The Qt WebEngine and Qt Location modules are not included in the builds due to memory constraints on the Raspberry Pi.
