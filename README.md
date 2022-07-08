# Practical Job CICD
In this case, the company ACME wants to start testing the cloud, so we are going to create fully automated cloud storage units. 
The ACME gave the following requierments:

- They want two storage units, as they have two environments: dev and prod. Therefore these units will be called respectively acme-storage-dev and acme-storage-prod.
![161442120-530fae4e-6e09-48c6-8478-a86b57bbebbe](https://user-images.githubusercontent.com/95095337/178016924-e7b52afe-a16f-400d-a5af-2cdfdb051be0.png)

- They want the deployment flow for the dev environment to be fully automatic, with no manual intervention.
- However, the deployment flow for prod will require an administrator to approve the deployment.
![161441846-17c5f2a3-7730-472a-9111-25981c2d7808](https://user-images.githubusercontent.com/95095337/178017093-df737944-d30d-45ef-afec-c650dccd826e.png)
![161441814-63fbb71c-1048-4275-a038-cc20fa6852ab](https://user-images.githubusercontent.com/95095337/178017208-3ca87a9e-04f0-4bdc-88d3-c7ead35dba80.png)

- ACME developers must be able to deploy from their machines for the dev environment.
- They want the credentials to deploy to never be stored in the code.
- In addition ACME also wants to check every 10 minutes that the content on each of the storage units does not exceed 20MiB. If this happens, the storage units will be emptied.
- ACME has been using Jenkins for a long time but is currently opening up to try new technologies with lower management costs such as Github Actions. This is why a github actions pipeline is also required for the storage unit deployment, so that ACME can compare both technologies.

In this case we have decided to make use of [Google Cloud](https://cloud.google.com/) for the creation of the storage buckets. 
## Assets of the project
* [Infrastructure project as code](./infra) using [terraform](https://www.terraform.io/) for the deployment of cloud storage drives
 * [Dockerfiles](./agents) corresponding to the required Jenkins agents
 * [Jenkinsfile](./Jenkinsfile) to run the deployment with terraform using [Jenkins](https://www.jenkins.io/)
 * [Github Actions YAML](./actions_pipeline.yml) to run the terraform deployment using Github Actions
 * [Jenkinsfile](./Jenkinsfile-Storage-Check) to run periodic memory check of memory used by storage units
 * [DSLs](./DSLs) needed to create both Jenkins jobs
 * [Makefile](./Makefile) for developers
 * [Script](./test_gcloudstorage.py) for bucket size check coded in python
 ## Instructions:
 
 * At first, for safety reasons we need to create a service account with only the necessary roles for performing the task, then we create a json key and export it.
  

