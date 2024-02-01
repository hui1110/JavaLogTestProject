echo 'Start to test ACA Java Agent in Spring logback...'
export URL_PREFIX="https://"
export SPRING_LOGBACK_RESOURCE_GROUP="acaspringlogback"
export PROJECT_NAME="spring-logback"
export PROJECT_NAME_JAVA_8_ACA="spring-logback-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-logback-21-aca"
export PROJECT_NAME_JAVA_8_ACA_AI="spring-logback-8-aca-ai"
export PROJECT_NAME_JAVA_11_ACA_AI="spring-logback-11-aca-ai"
export PROJECT_NAME_JAVA_17_ACA_AI="spring-logback-17-aca-ai"
export PROJECT_NAME_JAVA_21_ACA_AI="spring-logback-21-aca-ai"
export PROJECT_NAME_JAVA_8_ACA_OTLP="spring-logback-8-aca-otlp"
export PROJECT_NAME_JAVA_11_ACA_OTLP="spring-logback-11-aca-otlp"
export PROJECT_NAME_JAVA_17_ACA_OTLP="spring-logback-17-aca-otlp"
export PROJECT_NAME_JAVA_21_ACA_OTLP="spring-logback-21-aca-otlp"
export ACA_DOCKERFILE_NAME="ACASpringDockerfile"
export ACA_AI_DOCKERFILE_NAME="ACAAISpringDockerfile"
export ACA_OTLP_DOCKERFILE_NAME="ACAOTLPSpringDockerfile"

cd ACA-Java-Agent-Log-Level/spring-logback

az group create -l eastus -n $SPRING_LOGBACK_RESOURCE_GROUP
echo '---Spring logback resource group created---'

# ------------------------Spring logback Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 8 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 11 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 17 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring logback Java 21 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 8 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring logback Java 8 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 8 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 8 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 8 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 8 ACA AI test done------------\\e[0m"

# ------------------------Spring logback Java 11 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring logback Java 11 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 11 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 11 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 11 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 11 ACA AI test done------------\\e[0m"

# ------------------------Spring logback Java 17 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring logback Java 17 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 17 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 17 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 17 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 17 ACA AI test done------------\\e[0m"

# ------------------------Spring logback Java 21 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring logback Java 21 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 21 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 21 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 21 ACA AI DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring logback Java 21 ACA AI test done------------\\e[0m"

# ------------------------Spring logback Java 8 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring logback Java 8 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 8 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 8 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 8 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 11 ACA OTLP test done------------\\e[0m"

# ------------------------Spring logback Java 11 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring logback Java 11 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 11 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 11 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 11 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 11 ACA OTLP test done------------\\e[0m"

# ------------------------Spring logback Java 17 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring logback Java 17 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 17 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 17 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 17 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 17 ACA OTLP test done------------\\e[0m"

# ------------------------Spring logback Java 21 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME  tagName=$PROJECT_NAME_JAVA_21_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring logback Java 21 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring logback Java 21 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 21 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 21 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 21 ACA OTLP test done------------\\e[0m"