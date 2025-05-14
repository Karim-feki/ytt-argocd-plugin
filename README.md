# 🚀 Deploying a ytt Plugin for ArgoCD using the Sidecar Method

This repository provides a guide to deploying a [`ytt`](https://carvel.dev/ytt/) plugin in [ArgoCD](https://argo-cd.readthedocs.io/) using the **sidecar** method.

## 📌 Background

ArgoCD previously supported two methods for plugin deployment:

1. **ConfigMap-based**
2. **Sidecar-based**

As of ArgoCD version `<VERSION>`, the ConfigMap-based method has been **deprecated**.  
However, the official `ytt` documentation still references the deprecated ConfigMap method, which makes it obsolete for newer versions.

This repository offers a streamlined, updated approach to deploying the `ytt` plugin using the sidecar method — including a one-click automation script.

## 📁 What's in this Repo?

- ✅ Step-by-step guide to configure the plugin
- 🐳 A custom Dockerfile for the `ytt` plugin image *(since no official maintained image exists)*
- 🛠️ Patch configuration for `argocd-repo-server`
- 🧩 Plugin definition as a ConfigMap (for reference)
- ⚙️ Automation script to deploy everything with a single command

## 📦 How It Works

The ArgoCD `repo-server` will execute the command defined in the plugin file *before* applying infrastructure changes.

Since there's no officially maintained Docker image for `ytt`, this repository includes a custom Dockerfile that builds an image capable of executing `ytt` commands.

> 🔧 You can find the Dockerfile in the root of this repository.

## 🪜 Steps to Deploy

1. **Create the plugin file as a ConfigMap**  
   *(This will define the command to run `ytt`)*

2. **Patch the `argocd-repo-server` Deployment**  
   - Add a sidecar container using the custom Docker image
   - Ensure proper volume mounts and command hooks

3. **(Optional) Run the automation script**  
   - Deploys all required components with a single command

## 📜 License

MIT License

---

Feel free to contribute or open issues if you encounter any problems or have suggestions!
