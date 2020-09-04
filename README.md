
![](https://i.imgur.com/r73BMV2.png)
# Final Project - Vet Practice

## Recources
###### GIT: https://github.com/willpearce101/FinalProject
###### TRELLO: https://trello.com/b/coTFUF53/final-project


| Contents |
| ------ |
| Plan | 
| The Team |
| Project Brief |
| Minimum Requirements |
| Tech Stack |
| Trello Board |
| MoSCow Analysis |
| Architecture |
| Application Overview |
| Deployment |
| Backend |
| Frontend |
| Risk Assessment |
| Estimate Cost |
| Infrastructure AWS Overview |
| Orchestration |
| Security |
| Retrospective |
| Future Improvements|
| Issues |
| Creators |

# The Team
> Paul Lagah, DevOps and Cloud Consultant, QA

> Scott Halliday, DevOps and Cloud Consultant, QA

> Simon Kindlen, DevOps and Cloud Consultant, QA

> Tadas Byautas, DevOps and Cloud Consultant, QA

> William Pearce, DevOps and Cloud Consultant, QA 

# Project Brief
The brief involved working within a team to implement all the technologies we had learned through our training to deploy an application we had no prior knowledge of.
The application consists of two different repositories making up the front and back end written in AngularJS and Java.

# Minimum Requirements
* Documentation of the source code, planning stage, risk assessment and project tracking.
* Full integration with a VCS (Version Control System).
* The repository automatically deploys into a live environment.
* Take into account a predefined budget.
* Use AWS to host the workflows, deployments and databases.

# Tech Stack 
* **Git and GitHub** for version control
* **AWS (Amazon Web Services)** for cloud hosting the resources needed to deploy the application.
* **GCP (Google Cloud Platform)** as a terraform development environment to save money from the given budget and time as we already had a VM running with it installed from previous projects. 
* **Terraform** was used to deploy the infrastructure as code that would be hosted on AWS. This included launching the main ‘Kube_Master’ instance and an RDS instance to host the persistent data. For full automation, we also configured Terraform to create a Virtual Private Cloud, Security Group's subnets, IAM roles, policies, and group scalability options.
* **NGINX** as a reverse proxy, for user access and load balancing.
* **Jenkins** for the CI Server to initialise the build after a GitHub change is detected.  
* **Docker** was utilized for containerisation purposes allowing the application to be deployed efficiently as we could integrate it’s functionally with Kubernetes.
* **Kubernetes** acted as the manager node in our EKS cluster allowing us to quickly deploy a configured scalable working environment in which to run the application.

# Trello Board

Day one Trello board allocations. At this point team was in discussions what exactly had to be done make the project working and what technologies should be used to make sure each project requirement is covered.

![trello](https://i.imgur.com/dNtqPeA.png)

Second image of Trello is almost at projects final moments. Overtime few ideas changed and different technologies were adapted. Application deployment cycle slightly shifted as well. Initial idea was to use docker swarm for orchestration however team knowledge allowed us to deploy more advanced tool such as kubernetes therefore idea to use docker swarm was scrapped pretty quickly. We met many issues and obstacles on deployment life cycle which are mostly documented on trello. With help of Google and our trainers Syed's enormous patience we manage overcome all of them. 

![trello](https://i.imgur.com/3mETnC1.png)

# MoSCow Analysis

As the application was developed for the project we took user stories to be that of priorities on how the app was to be deployed rather than features of the app that benefit the customer.

* Must 
  * As a user I wish to be able to view and modify veterinary practice records
* Should
  * As a user I want the application to be running container so the application system environment independent
* Could
  * As a user I wish to have all systems variables to be encrypted and access audit for improved security
* Will Not
  * As a user I wish the monolithic application to be deployed as microservice enable the app to better scalability  

# Architecture 

## Application Overview
Application for managing a veterinary practice.
The application is a monolithic application separated into a  Java backend and JSON front end.  
The architecture has three tiers.

![architecture has three tiers](https://i.imgur.com/WYwkzpL.jpg)

* **Web/app server**
 	* Spring Framework. Programming and configuration model for Java applications. Developers are freed to develop business logic rather than developing code to manage the data.
 	* Non specific to the deployment environment.
 	* REST (REpresentational State Transfer)  API.  This means that all requests are stateless and there is no stored context on the server.
 
* **Database server**
 	* MYSQL 
 	* Database is not in a container as containers are for application and are thus transient by nature. Data has to be persistent.
 	* Amazon RDS hosts the database repository.

* **Client**
 	* JSON 
 	* Angular application design framework and development platform for single-page apps.
 	* Node.js asynchronous event-driven JavaScript runtime.

## Deployment

* Backend
	* Maven build automation tool that packages the compiled JAR file.
	* Maven creates a Target directory and JAR file for the deployment is found here.
	* DOCKERFILE creates an image from a Java image and copies the JAR file into the docker image.
	
* Frontend
	* Prior to creating the new DOCKERFILE new angular build had to be initiated therefore to get this done full project dependencies had to be installed to compile the build. All dependencies are listed in package.json and installed using NPM. Frontend and Backend is handled by Nginx using reverse proxy which is then deployed using Kubernetes.
	
### Containerisation of back and front end

The frontend and backend was packaged up and a docker image was created.

* Benfits
	* Improved pipeline for the application life cycle
	* No mutations
	* Scalability


# Risk Assessment

![Risk Assessment](https://i.imgur.com/9REVzNh.png)

# Estimate Cost
These are the estimated cost of running 3 on demand t3a.medium instances. Please note running EKS cluster is chargeable $0.10 per hour which is not included in the picture below, therefore cost likely to match deployment using docker swarm instead. Monthly cost to run the Kubernetes cluster would add an additional **$74.40** per month, **$892.80** per year to run.

![Estimate Cost](https://i.imgur.com/BfFYgoI.png)

To keep up costs as low as possible few recommendation could be made. For one reserved instances could be used if application to be used for longer period, discount depends on upfront cost and can be found in more details here [AWS Reserved instance pricing](https://aws.amazon.com/ec2/pricing/reserved-instances/pricing/ "AWS Reserved instance pricing"). Cloud watch and other monitoring tools could be utilised to make sure application used all resources given to avoid overpaying for unused power. Also to make it even more complicated but cheaper in the long run autoscaling could be adapted which is AWS speak very highly of. Depening on the load transmitted to application it either shrinks or expands its power ending directly affecting costs.

# Infrastructure AWS Overview 

![network](https://i.imgur.com/ME500cp.jpg)

![infrastructure design](https://i.imgur.com/C694sh5.jpg)

![automation flow](https://i.imgur.com/fc3NFL1.jpg)

# Orchestration
## Terraform

Terraform is being used as our Infrastructure as Code(IaC) tool, through which we will be deploying:

* EC2 & RDS Instance
* VPC, Subnets & Internet Gateway
* Security Group
* EKS Cluster & Node Groups
* IAM Roles

## Jenkins
Jenkins is our CI/CD Server, through which the application will be deployed from. Jenkins will have a webhook set-up from our GitHub Repo that will notify Jenkins when there is an update to the “Kubernetes” branch - as that branch will be where the deployment files will be hosted.

![](https://i.imgur.com/gSdjv5H.png)

## AWS EKS
The AWS EKS Cluster is the Orchestration tool used for deploying and Load Balancing the application across Manager and Worker Nodes. The Front and Back end application will be talking to each other through the Proxy set-up within the NGINX Pod, while having their own respective Pods to deploy to.

# Security
Each team member was issued with AWS credentials with full administrator access. As each team member had multiple deliverables it was felt final granular control would create dependencies within the group to deliver.
EKS user was set up for deployment of the infrastructure instances with full administrative access. 
NG

# Retrospective 

## Future Improvements

* Presistent constant DNS record for the website by implementng route 53.
* Repackage the front end container rebuild the container with a NGINX image by rebuilding with NG Server

### Reducing overheads and improve ROI
To reduce costs and reduce the workload we identified a means of eliminating the management of instances for EKS cluster. 
Provision and managing the servers is a manual process that is based on our understanding what is required. EC2 instance has to be paid for evening if it is not being used. The server has to also be maintained and configured, which is a cost. Under provisioned deployment will deliver poor performance and reputational damage. Over provision will increase the cost with poor ROI. Servers are not fully utilised and require maintenance.
To eliminate these concerns and issues the next step was to implement AWS Fargate. A serverless compute engine for containers. Instead of deploying EC2 instances, containers are deployed. Removing the need for infrastructure management. Instead of paying for EC2 resource payment is for requested compute resources when used. 
Further benefit of AWS is security; the pods run in their own dedicated kernel runtime with no sharing of CPU, memory, storage or network resources. Each task is thus isolated.
Resources that would be taken up on infrastructure design and management are freed for application development.
Fargate's main benefit is saving on time and money on infrastructure management. If compute costs dwarf infrastructure management costs then Fargate would not be the best option.

### Improved security 
The database requires system variables to be set so that authentication can be accomplished without hard coding the details into the code and having the code exposed on Github to the public.  Any file holding these details needs to be included in .gitignore to prevent the file being pushed to the Github repository 
This is an  unreliable method and is not a secure method for holding such details. Human error could mean that the file is not included in gitignore. The file is not encrypted and stored on a VM on the public cloud which is poetional risk of the VM not being secure. No access control and audit. The file needs to be created every time the repository is cloned. In other words this method is crude.

A better method  would be a system that separates from the code for holding system variables. This is what **AWS Systems Manager Parameter Store** provides. The main benefits for this project:
* Secure and scalable
* Access control and audit, to a granular level
* Security posture ameliorated with code and data separated compared to having access data stored in the actual code.

The next deployment of the application environment will include AWS Systems Manager Parameter Store.

### Monitoring
The next setup after deploying the application was to implement monitoring and auditing. That is to monitor the cloud services and the applications being run. Actions taken by users, cloud service and roles would be monitored and recorded.
AWS provides CloudTrail, CloudWatch, AWS Config  for this purpose. 
Another option is to use a cross platform solution such as New Relic for application monitoring and performance . New Relic is SaaS Application Performance Management for Ruby, PHP, .Net, Java, Python, and Node.js Apps. New Relic is the all-in-one web application performance tool that lets you see performance from the end user experience, through servers, and down to the line of application code.
The main difference between Cloud Trail and New Relic is that Cloud Trail is **Log Management** and New Relic can be seen as more of a  **Performance Monitoring Tool**. DevOps practitioners report that New Relic is easy to set up with a margin of 68 to 1 compared to AWS. There is a larger community to call on when it comes to New Relic. Four main points in New Relic is:

* Not a AWS service
* Performance Data Retention
* Real-User Response Time, Throughput, & Breakdown by Layer
* App Response Time, Throughput, & Breakdown by Component

Given time the plan was to sign up for New Relic One Perpetually free access plan to test the viability of the product and compare against AWS offering.

> Perpetually free access: 100 GB/month of free data ingest. 1 free full access user. Unlimited free basic users.

# Micro Services

The architecture is containerized but still monolithic because each container has all the same features of the rest of the containers. The next step is to convert the monolith into microservices. 

The benefits of converting the applications to microservices:
* Flexible scaling: Infrastructure and number of instances 
* Security sandboxed: A compromised service means no horizontal access to other resources.
* Crashes isolated: Only the microservice goes down the rest of application continue
* Agile Development: New features on the service do not affect the other services.

The method to convert to microservices is to identify the API for the application and system services. 
Issues  

# Creators 
> Paul Lagah:  https://github.com/paullagah

> Scott Halliday: https://github.com/sdhalliday92

> Simon Kindlen: https://github.com/sipeki

> Tadas Byautas: https://github.com/tadasbytautas

> William Pearce: https://github.com/coolwill92





