# HashiCorp Consul Add-on for AWS EKS

> Get started with this add-on by reviewing the following example.

## Table of Contents

- [HashiCorp Consul Add-on for AWS EKS](#hashicorp-consul-add-on-for-aws-eks)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Usage](#usage)
  - [Variables and Outputs](#variables-and-outputs)
    - [Inputs](#inputs)
    - [Outputs](#outputs)

## Overview

The code in this directory showcases an easy way to get started with the HashiCorp Consul Add-on for AWS EKS.

* [main.tf](./main.tf) contains the AWS and Kubernetes resources needed to use this add-on.
* [outputs.tf](./outputs.tf) defines outputs that make interacting with `kubectl` easier
* [terraform.tf](./terraform.tf) defines the required Terraform (core) and Terraform provider versions
* [variables.tf](./variables.tf) defines the variables needed to use this add-on.

## Usage

Make sure to Export AWS access key and AWS secret access key to your CLI prior to getting started.

```sh
export AWS_ACCESS_KEY_ID=... 
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...
```

Initialize the root module and any associated configuration for providers and child modules by executing the `terraform init` command.

Once all dependencies have been installed, execute `terraform plan` and review the resources that will be created.

If you are satisfied with the proposed settings, execute `terraform apply` to create the resources and deploy HashiCorp Consul to an EKS Cluster.

For more detailed information, see the documentation for the [Terraform Core workflow](https://www.terraform.io/intro/core-workflow).

On successful completion, Terraform will display outputs containing URLs to the AWS Console as well as `kubectl`-specific commands.

After deploying the mesh, deploy HashiCups demo app.

Demo can be found here: https://github.com/hashicorp-education/learn-consul-get-started-kubernetes/tree/main/self-managed/eks/hashicups

After deploying the mesh, deploy HashiCups demo app.

Demo can be found here: https://github.com/hashicorp-education/learn-consul-get-started-kubernetes/tree/main/self-managed/eks/hashicups

```sh
kubectl apply --filename hashicups/v1/
```

These commands may be used to configure a local `consul` agent and intialize the server, as described in the next section.

Refer to the root-level [README.md](../../readme.md) for an overview of the next steps.

## Variables and Outputs

The `variables` and `outputs` used within this showcase are _not_ required to be set in this exact way. They are made available merely as an example.

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
| kubectl_command_describe_secrets | kubectl command to describe Kubernetes Secrets |
| kubectl_command_portforward | kubectl command to enable port-forwarding for port 8200 |
<!-- END_TF_DOCS -->