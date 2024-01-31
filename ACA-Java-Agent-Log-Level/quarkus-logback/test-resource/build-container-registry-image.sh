#!/bin/bash

set -Eeuo pipefail

az acr login --name $ACR_NAME  --expose-token

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:$PROJECT_NAME --file QuarkusLogbackDockerfile  --build-arg PROJECT_NAME=$PROJECT_NAME ACA_COMMAND_LINE=$ACA_COMMAND_LINE https://github.com/hui1110/JavaLogTestProject.git
