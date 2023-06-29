# HashiCorp Consul Add-on for AWS EKS

> Get started with this add-on by reviewing the following example.

## Table of Contents

- [HashiCorp Consul Add-on for AWS EKS](#hashicorp-consul-add-on-for-aws-eks)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Usage](#usage)
    - [Inputs](#inputs)
    - [Outputs](#outputs)

## Overview

The code in this directory showcases an easy way to get started with the HashiCorp Consul Add-on for AWS EKS.

* [main.tf](./main.tf) contains the AWS and Kubernetes resources needed to use this add-on.
* [outputs.tf](./outputs.tf) defines outputs that make interacting with `kubectl` easier
* [providers.tf](./providers.tf) defines the required Terraform (core) and Terraform provider versions
* [variables.tf](./variables.tf) defines the variables needed to use this add-on.

## Usage

Make sure to Export AWS access key and AWS secret access key to your CLI prior to getting started.

  ```sh
  export AWS_ACCESS_KEY_ID=... 
  export AWS_SECRET_ACCESS_KEY=...
  export AWS_SESSION_TOKEN=...
  ```

Initialize the root module and any associated configuration for providers, review the resources that will be created and finally create the resources and deploy HashiCorp Consul to an EKS Cluster. For more detailed information, see the documentation for the [Terraform Core workflow](https://www.terraform.io/intro/core-workflow).

  ```sh
  terraform init -upgrade
  terraform plan
  terraform apply -auto-approve
  ```

On successful completion, Terraform will display outputs containing URLs to the AWS Console as well as `kubectl`-specific commands. These commands may be used to configure a local `consul` agent and intialize the server.

As a test you can deploy the [HashiCups demo app](https://github.com/hashicorp-education/learn-consul-get-started-kubernetes/tree/main/self-managed/eks/hashicups) after deploying the mesh.

```sh
kubectl apply --filename ../hashicups/v1/
```

Open a separate terminal window and expose the HashiCups UI with `kubectl port-forward` using the `nginx` service name as the target.

```sh
kubectl port-forward svc/nginx --namespace default 8080:80
```

Open http://localhost:8080 in your browser. Notice that while you can reach the `nginx` instance because of the port forwarding, the `nginx` service is unable to access its upstreams and the connection is refused. This is expected behavior since you have not defined any intentions yet.

```sh
kubectl apply --filename ../hashicups/intentions/allow.yaml
```

Revisit the HashiCups UI at http://localhost:8080. Notice that the application is now fully functional.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_version | Kubernetes version to use for EKS Cluster | `string` | `"1.26"` | no |
| namespace | Kubernetes Namespace to deploy HashiCorp Consul in | `string` | `"consul"` | no |
| vpc_cidr | VPC CIDR | `string` | `"10.0.0.0/16"` | no |

### Outputs

| Name | Description |
|------|-------------|
| console_url_cluster_configuration | Console URL for Cluster Configuration |
| console_url_cluster_overview | Console URL for Cluster Overview |
| console_url_cluster_workloads | Console URL for Cluster Workloads |
| kubectl_command_configure | kubectl configuration command |
| kubectl_command_exposed_ui | kubectl command to visit the Consul UI |
<!-- END_TF_DOCS -->