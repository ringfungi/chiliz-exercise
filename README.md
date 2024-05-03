# chiliz-exercise - Microservice Deployment on AWS with Kubernetes

## Overview

This project deploys a dockerized Python microservice to an AWS EKS cluster that has been provisioned using Terraform and Ansible. Basic monitoring is implemented using an AWS CloudWatch addon.

## Architecture and Setup Instructions

### Prerequisites

- AWS CLI installed and configured with appropriate permissions
- Terraform
- Ansible
- kubectl installed for interacting with the Kubernetes cluster

### Deployment

Initialize Terraform, create and apply plan:

    ```
    terraform init

    terraform plan -out=tfplan    

    terraform apply "tfplan"
    ```

Before running the playbook, make sure your kubeconfig file is correctly configured with the newly created cluster executing:

    ```
    aws eks update-kubeconfig --region eu-west-1 --name chiliz-cluster
    ```

Run the Ansible playbook to configure the Kubernetes cluster:

    ```
    ansible-playbook deploy-to-cluster.yaml
    ```


### Monitoring

The microservice's performance can be monitored using AWS CloudWatch. You can set up alarms and dashboards in the AWS Management Console to track various metrics such as CPU and memory utilization.

## Explanation

Terraform Configuration: The VPC and the EKS clusters are defined in separat third-party modules, for simplicity's sake.
For the VPC, 2 availability zones are provided (to improve fault tolerance and high availability) and an even mix of 4 private and public subnets are created, to ensure separation of concerns. To better control and monitor outbound traffic, a single NAT Gateway is also created. 
The EKS Cluster is configured using an eks_managed_node_groups block that sets up a spot instance with a reasonable number of worker nodes (2) and a high ceiling (10), should the application need to scale up. The aws_eks_addon resource configures the AWS CloudWatch Observability add-on for the EKS cluster, which in turn installs a CloudWatch agent to send infrastructure metrics from the cluster, installs Fluent Bit to send container logs, and also enables CloudWatch Application Signals to send application performance telemetry.

Ansible Configuration: The playbook automates the deployment of the Python microservice and the configuration of the HPA using kubectl commands. It applies the Kubernetes manifests deploy_microservice.yaml, service.yaml and hpa.yaml to the Kubernetes cluster. The become_user specifies the user on the target machine, which can be an SSH user with appropriate permissions to execute kubectl commands.
The microservice, which is just a hello world Python app, has been previously packaged and pushed to my Docker repository. The deployment definition sets up a Kubernetes Deployment resource that specifies the number of replicas, container image, resource limits and requests.
The HPA definition configures a HorizontalPodAutoscaler resource to autoscale the microservice based on CPU utilization, for which the target is 50%.

These architectural choices ensure the seamless deployment and management of the microservice on AWS EKS, with scalable infrastructure, network isolation, and monitoring capabilities.
