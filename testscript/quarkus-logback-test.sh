echo 'Start to test ACA Java Agent in Quarkus logback...'
export URL_PREFIX="https://"
export QUARKUS_LOGBACK_RESOURCE_GROUP="quarkuslogback"
export PROJECT_NAME_JAVA_11_ACA="quarkus-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-logback-21-aca"
export PROJECT_NAME_JAVA_11_ACA_AI="quarkus-logback-11-aca-ai"
export PROJECT_NAME_JAVA_17_ACA_AI="quarkus-logback-17-aca-ai"
export PROJECT_NAME_JAVA_21_ACA_AI="quarkus-logback-21-aca-ai"
export PROJECT_NAME_JAVA_11_ACA_OTLP="quarkus-logback-11-aca-otlp"
export PROJECT_NAME_JAVA_17_ACA_OTLP="quarkus-logback-17-aca-otlp"
export PROJECT_NAME_JAVA_21_ACA_OTLP="quarkus-logback-21-aca-otlp"
export ACA_DOCKERFILE_NAME="ACAQuarkusLogbackDockerfile"
export ACA_AI_DOCKERFILE_NAME="ACAAIQuarkusLogbackDockerfile"
export ACA_OTLP_DOCKERFILE_NAME="ACAOTLPQuarkusLogbackDockerfile"

cd ../ACA-Java-Agent-Log-Level/quarkus-logback

az group create -l eastus -n $QUARKUS_LOGBACK_RESOURCE_GROUP
echo '---Quarkus logback resource group created---'

# ------------------------Quarkus logback Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 11 ACA image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 11 ACA test done------------\\e[0m"

# ------------------------Quarkus logback Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 17 ACA image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 17 ACA test done------------\\e[0m"

# ------------------------Quarkus logback Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 21 ACA image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus logback Java 21 ACA test done------------\\e[0m"

# ------------------------Quarkus logback Java 11 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_11_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Quarkus logback Java 11 ACA AI image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 11 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 11 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 11 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 11 ACA AI test done------------\\e[0m"

# ------------------------Quarkus logback Java 17 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_17_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Quarkus logback Java 17 ACA AI image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 17 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 17 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 17 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 17 ACA AI test done------------\\e[0m"

# ------------------------Quarkus logback Java 21 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_21_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Quarkus logback Java 21 ACA AI image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 21 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 21 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 21 ACA AI DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus logback Java 21 ACA AI test done------------\\e[0m"

# ------------------------Quarkus logback Java 11 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_11_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Quarkus logback Java 11 ACA OTLP image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 11 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 11 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 11 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 11 ACA OTLP test done------------\\e[0m"

# ------------------------Quarkus logback Java 17 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_17_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Quarkus logback Java 17 ACA OTLP image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 17 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 17 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 17 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 17 ACA OTLP test done------------\\e[0m"

# ------------------------Quarkus logback Java 21 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_21_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Quarkus logback Java 21 ACA OTLP image created---'

sleep 20
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 21 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 21 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 21 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 21 ACA OTLP test done------------\\e[0m"