[![Chiliz](chiliz.png)](https://www.chiliz.com/careers/)

# Case Study: Deploying a Scalable Microservice with Kubernetes on AWS

## Introduction

This case study focuses on deploying a scalable microservice on AWS using Kubernetes, with infrastructure provisioned through Terraform and configuration managed by Ansible. The objective is to demonstrate your ability to create a scalable and secure deployment on AWS, following best practices for infrastructure as code, configuration management, and container orchestration.

## Scenario

Your task is to deploy a microservice (provided as a Docker container) on AWS, ensuring it's scalable, secure, and monitored. You will use Terraform to provision the required AWS resources, Ansible for configuring these resources, and Kubernetes for orchestrating the microservice deployment.

### Requirements

1. **Infrastructure Provisioning:**
   - Use Terraform to create the necessary AWS infrastructure, including but not limited to an EKS cluster, VPC, subnets, and any required IAM roles.

2. **Configuration Management:**
   - Utilize Ansible to configure the Kubernetes cluster nodes and to automate any repetitive setup tasks that the infrastructure might require.

3. **Microservice Deployment:**
   - Deploy the microservice on Kubernetes, ensuring it's scalable based on CPU or memory usage. The microservice should be exposed via an Elastic Load Balancer.

4. **Monitoring:**
   - Implement basic monitoring using AWS CloudWatch or any other preferred tool to monitor the microservice's health and performance.

## Deliverables

- A GitHub repository containing:
  - A Terraform module you built to solve one of the above needs (not all of them).
  - Kubernetes manifests for deploying the microservice, including deployment, service, and horizontal pod autoscaler objects.
- A README.md file detailing:
  - Your architectural choices and setup instructions.
  - How to deploy the infrastructure and microservice.
  - How to monitor the microservice's performance.
- Any material that you would find useful to illustrate your proposal, such as:
  - Diagrams
  - Pictures
  - ...

## Submission

Submit your proposal by creating a pull request to that repository. Ensure your pull request description clearly articulates your implementation choices and any assumptions made during the development process.

## Evaluation Criteria

- **Architecture:** Clear and logical architecture that takes advantage of Kubernetes for scalability.
- **Code Quality:** Well-structured code.
- **Documentation:** Comprehensive README.md that guides the reviewer through your architecture, setup, and monitoring strategy.
- **Scalability and Security:** Demonstrated understanding of scalable infrastructure and security best practices.

Happy coding!
