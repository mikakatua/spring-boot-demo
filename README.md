# Spring Boot demo

Before you start, make sure you have the following required software installed:
* Docker
* Kubernetes

Apart from that, you will also need an [Azure DevOps](https://dev.azure.com) account. 

This demo application is based on the sample Spring Boot repository (https://github.com/spring-guides/gs-spring-boot-docker). The original repository contains the following instructions on how to build the application and containerize it.

Steps to build the app using Maven
```
./mvnw package
```
Steps to build the Docker image
```
mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
docker build -t springio/gs-spring-boot-docker .
```

## Azure DevOps setup
This demo implements an hybrid solution using Cloud and On-premises services. The goal is to deploy to a local development environment using the Azure DevOps services. The following table summarizes the components used in the demo:

| Component | Used here | Alternatives |
| --- | --- | --- |
| Code repository | Azure Repos | GitHub |
| CI/CD Pipeline | Azure Pipelines | |
| Artifact repository | Azure Artifacts | |
| Docker registry | Local installation | Azure Container Registry |
| Kubernetes | Local installation | Azure Kubernets Service |

### Azure Pipelines agent
To be able to run pipeline jobs in our local machine we will run self-hosted agent. The agent is deployed in a container following the instructions in the [dockeragent](dockeragent) folder.

For more information about how to setup an agent, see [Azure Pipelines agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/agents?view=azure-devops&tabs=browser)

### Docker registry

### Service connections
