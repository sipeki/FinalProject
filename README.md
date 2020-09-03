# Final Project - Vet Practice


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

* Web/app server
 * Spring Framework. Programming and configuration model for Java applications. Developers are freed to develop business logic rather than developing code to manage the data.
 * Non specific to the deployment environment.
 * REST (REpresentational State Transfer)  API.  This means that all requests are stateless and there is no stored context on the server.
 
* Database server
 * MYSQL 
 * Database is not in a container as containers are for application and are thus transient by nature. Data has to be persistent.
 * Amazon RDS hosts the database repository.

* Client
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
	
	
**Containerisation of back and front end**
* The frontend and backend was packaged up and a docker image was created.
 * Improved pipeline for the application life cycle
 * No mutations
 * Scalability


# Risk Assessment

![Risk Assessment](https://imgur.com/vuXuczE)

# Estimate Cost
These are the estimated cost of running 3 on demand t3a.medium instances. Please note running EKS cluster is chargeable $0.10 per hour which is not included in the picture below, therefore cost likely to match deployment using docker swarm instead. Monthly cost to run the Kubernetes cluster would add an additional **$74.40** per month, **$892.80** per year to run.

![Estimate Cost](https://imgur.com/vuXuczE)



