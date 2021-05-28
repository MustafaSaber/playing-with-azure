# Playing With Azure Portal

## Goal

1. CentOS image with airflow deployed on a subpath (localhost/airflow)
2. Azure container registery for images.
3. CI/CD for deploying image on container instance.

## Tools

* Terrspace
* Docker
* Azure CLI
* jq

## Deploy

To deploy full solution, you will need to have `.azure.env` comes from `.azure.env.sample`, to create cloud resources on azure via terraspace.

Then via CLI run:

``` bash
source .azure.env
cd azure && terraspace up dockerization
```

then run [SP Script](./service_principle.sh) to create a service account for github actions to automate pushing to ACR.