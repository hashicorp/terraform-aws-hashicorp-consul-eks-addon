# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: Apache-2.0

locals {
  console_url_base = "https://${local.region}.console.aws.amazon.com/eks/home?region=${local.region}#/clusters/${module.eks_blueprints.eks_cluster_id}"
}

output "console_url_cluster_overview" {
  description = "Console URL for Cluster Overview"
  value       = "${local.console_url_base}?selectedTab=cluster-overview-tab"
}

output "console_url_cluster_workloads" {
  description = "Console URL for Cluster Workloads"
  value       = "${local.console_url_base}?selectedTab=cluster-workloads-tab"
}

output "console_url_cluster_configuration" {
  description = "Console URL for Cluster Configuration"
  value       = "${local.console_url_base}?selectedTab=cluster-configuration-tab"
}

output "kubectl_command_configure" {
  description = "kubectl configuration command"
  value       = module.eks_blueprints.configure_kubectl
}

output "kubectl_command_exposed_ui" {
  description = "kubectl command to visit the Consul UI, add http:// to the url"
  value       = "kubectl get service consul-ui --namespace=${var.namespace} -o json | jq -r .status.loadBalancer.ingress'[0]'.hostname"
}