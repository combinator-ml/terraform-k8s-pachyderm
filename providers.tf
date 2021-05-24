terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.1.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
  }
}
