# intouch-task

Task goal is to deploy and image with following specs

1. Centos 8 as base image
2. Image shall include Airflow, nginx and Druid Analytics
3. Push image to Azure Container Registery
4. Make azure pipeline to build and push images to the container, and to deploy the image on a VM.
5. Give minimum requirements to a specific reviewer to review the code.

# What is done?

A simple terraspace project to manage cloud resources, docker image includes nginx, airflow both working and druid is broken.

The image is deployed on ACI not a VM, the pipelines used are github actions not azure pipeline (issue with latest azure pipelines that required sending mail to activate my free usage.)
