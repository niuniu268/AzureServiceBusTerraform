# Terraform Template for Azure ServiceBus

- Get Subscription, CLIENT_SECRET and TENANT_ID

```
az account set --subscription 9365ab69-ca62-4339-9f92-cbda19d0c9c5
```

```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscription/9365ab69-ca62-4339-9f92-cbda19d0c9c5"
 
az account set --subscription="9365ab69-ca62-4339-9f92-cbda19d0c9c5"
```

```
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID
```

```
terraform init
terraform validate
terraform apply
```

## Check Azure ServiceBus message by Golang

`https://github.com/niuniu268/AzureServiceBus.git`