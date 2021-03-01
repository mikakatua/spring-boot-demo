# Run a self-hosted agent in Docker
Follow these instructions to run your Azure Pipelines agent in Docker

## Create a Personal Access Token
In Azure DevOps go to your "User settings" and create a Personal Access Token to allow the agent access your account.

## Create a new Agent pool
This step is optional. In your "Project Settings" add a new Agent pool of type "Self-hosted" and name "Local Agent".

## Build the agent image
Run a command like this to create the container image. Change proxy settings to suit your environment.
```
docker build \ 
  --build-arg http_proxy=http://172.17.0.1:3128 \
  --build-arg https_proxy=http://172.17.0.1:3128 \
  --progress plain -t dockeragent .
```

## Launch the agent
Run a command like this to run the agent. Change proxy settings to suit your environment.
Replace the values for \<ORGANIZATION> and \<PERSONAL-ACCESS-TOKEN> with yours.
```
docker run -d --name dockeragent \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -e http_proxy=http://172.17.0.1:3128 \
  -e https_proxy=http://172.17.0.1:3128 \
  -e AZP_URL="https://dev.azure.com/<ORGANIZATION>" \
  -e AZP_TOKEN="<PERSONAL-ACCESS-TOKEN>" \
  -e AZP_AGENT_NAME=DockerAgent \
  -e AZP_POOL="Local Agent" \
  dockeragent
```
If everything goes well, the agent log will show `Listening for Jobs`
