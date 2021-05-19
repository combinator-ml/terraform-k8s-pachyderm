provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "pachyderm" {
  source = "../"
}
