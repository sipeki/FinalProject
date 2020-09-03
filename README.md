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

[Imgur](https://i.imgur.com/WYwkzpL.jpg)






