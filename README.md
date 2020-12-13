## PGR301-Exam-Azure-Infrastructure

[![Build Status](https://travis-ci.com/Hannarong98/pgr301-exam-azure-infrastructure.svg?token=DqMpxq41VWvgzW8Fy3oq&branch=master)](https://travis-ci.com/Hannarong98/pgr301-exam-azure-infrastructure) <a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=5750663&Days=1&Design=3" /></a>


Prerequisite
---
#### You have to have the following requirements to begin
* Service principal account with enough permission
* Storage Account with container
   * This functions the same as gcp buckets

#### Optionally created resource group beforehand

Usage
---
### Set desired travis endpoint
* For _travis-ci.com_ user
    * `travis endpoint --pro --set-default`
    * Alternatively `travis endpoint --com --set-default`
* For _travis-ci.org_ user
    * `travis endpoint --org --set-default`
#### Encrypt following secrets
* `travis encrypt LOGZ_TOKEN="YOUR_LOGZ_IO_TOKEN"  --add`
* `travis encrypt LOGZ_URL="YOUR_LOGZ_IO_LISTENER_URL" --add`
* `travis encrypt STATUS_CAKE_USERNAME="YOUR_STATUS_CAKE_USERNAME" --add`
* `travis encrypt STATUS_CAKE_API_KEY="YOUR_STATUS_CAKE_API_KEY" --add`
* `travis encrypt AZ_SUB_ID="YOUR_AZURE_SUBSCRIPTION_ID" --add`
* `travis encrypt AZ_CLIENT_ID="YOUR_AZURE_APP_OR_SERVICE_PRINCIPAL_ID" --add`
* `travis encrypt AZ_CLIENT_SECRET="YOUR_AZURE_APP_OR_SERVICE_PRINCIPAL_SECRET" --add`
* `travis encrypt AZ_TENANT_ID="YOUR_AZURE_TENANT_ID" --add`
* `travis encrypt AZ_ACR_URL="YOUR_AZURE_CONTAINER_REGISTRY_URL" --add`


#### Configurations

* In `.travis.yml` add
    * If you had already created a resource group, you have to do this before first build.
        * Add after `terraform init` this `terraform import azurerm_resource_group.rg /subscriptions/"${AZ_SUB_ID}"/resourceGroups/<YOUR_RESOURCE_GROUP>`
        * Once the state have been imported and your build did passed you can safely remove the line mentioned above.
* In `variables.tf` change these default values
    * `az_rg_location`
    * `az_acr_img`
    * `az_app_web_srv_label`
    * `status_cake_website_name`
    * `status_cake_check_rate`
    * `status_cake_contact_group`
* In `provider.tf` change the following field value
    * `resource_group_name`
    * `storage_account_name`
    * (Optional) `container_name `
    * (Optional) `key`
* In `main.tf` you may change these to your liking
    * anything in `azurerm_app_service_plan`
    * site_config `azurerm_app_service`
* Non mentioned fields are configured and encrypted at the `Encrypt secrets` step

Deployment
---
* Once you have configured everything you will only need to change
    * `az_acr_img` in `variables.tf` for each new revision

Links
---

[Application(feature/azure-deployment)](https://github.com/Hannarong98/PGR301-Exam-application/tree/feature/azure-deployment)
