# DevOps_ITI_Project

## Final Project

### Brief
Deploy backend application on kubernetes cluster using CI/CD jenkins
pipeline using the following steps and high-level diagram :
1. Implement secure kubernetes cluster
2. Deploy and configure jenkins on kubernetes using Ansinle
3. Deploy backend application on kuberetes using jenkins piepline

```bash
## We choosed AWS Cloud Plateform 
```
### First
Using Terraform {IAC} tool to build a pravite network with EC2 to Connect to the AWS in the private subnet with Nat Gateway
to aplly :> use these commands:
```bash
 terraform init
 terraform fmt
 terraform apply
```
We limit the Connection to AWS Using Master Authorized Network to Allow the Ec2 to connect to the eks cluster

### Second
Using ansible to  Automate the deployments ( jenkins master and agent ) and services ( loadbalancers and namespaces ) on AWS with roles and tasks

```bash
 ansible-playbook main.yaml 
```

### Third 
Create Dockerfile to be our deployed container 


### Forth 
Using Jenkins Pipeline to connect btw Our Repo to deployment in AWS



### Contributors:
|![Alber Karam](images/alber.jpeg)|![Amin Khalaf](images/amin.jpg)|![Mohamed Swelam](images/swelam.jpg)|
|:-----------------:|:-----------:|:-----------------:|
|[Albeer Karam](https://github.com/AlberKaram)|[Amin Khalaf](https://github.com/aminkhalaf)|[Mohamed Swelam](https://github.com/swelams)|
