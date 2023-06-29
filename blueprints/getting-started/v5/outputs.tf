# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: Apache-2.0

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
  value       = "aws eks --region ${local.region} update-kubeconfig --name ${local.name}"
}

output "kubectl_command_consul_ui" {
  description = "kubectl command to visit the Consul UI"
  value       = "echo https://$(kubectl get services/consul-ui --namespace ${var.namespace} -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
}

output "export_consul_address" {
  description = "export command for Consul address; required for running consul cli commands"
  value       = "export CONSUL_HTTP_ADDR=https://$(kubectl get services/consul-ui --namespace ${var.namespace} -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
}

output "export_consul_token" {
  description = "export command for Consul token; required for running consul cli commands"
  value       = "export CONSUL_HTTP_TOKEN=$(kubectl get --namespace ${var.namespace} secrets/consul-bootstrap-acl-token --template={{.data.token}} | base64 -d)"
}

output "export_consul_ssl_verify" {
  description = "export command to turn off Consul SSL verify; required for running consul cli commands"
  value       = "export CONSUL_HTTP_SSL_VERIFY=false"
}
