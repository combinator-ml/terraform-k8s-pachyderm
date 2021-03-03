terraform {
  required_providers {
    provider = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

resource "helm_release" "pachyderm" {
  name             = "pachyderm"
  repository       = "https://pachyderm.github.io/helmchart/"
  chart            = "pachyderm"
  version          = ""
  namespace        = var.namespace
  wait             = false
  values           = var.values
  create_namespace = true
}