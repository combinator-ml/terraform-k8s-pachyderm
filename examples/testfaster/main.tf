variable "namespace" {
  description = "(Optional) The namespace to install into. Defaults to feast."
  type        = string
  default     = "pachyderm"
}

locals {
  prefix = "testfaster"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

module "pachyderm" {
  source    = "combinator-ml/pachyderm/k8s"
  namespace = var.namespace
  depends_on = [
    kubernetes_namespace.namespace
  ]
}

module "jupyter" {
  source    = "combinator-ml/jupyter/k8s"
  namespace = var.namespace
  depends_on = [
    kubernetes_namespace.namespace
  ]
}

resource "kubernetes_service" "jupyter" {
  metadata {
    name      = "${local.prefix}-jupyter"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "combinator-jupyter"
    }
    port {
      name        = "http"
      port        = 8888
      target_port = 8888
      node_port   = 30600
    }
    type = "NodePort"
  }
  depends_on = [
    module.jupyter
  ]
}

resource "kubernetes_service" "pachyderm-dash" {
  metadata {
    name      = "${local.prefix}-pachyderm-dash"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "dash"
    }
    port {
      name        = "http"
      port        = 8080
      target_port = 8080
      node_port   = 30080
    }
    port {
      name        = "grpc"
      port        = 8081
      target_port = 8081
      node_port   = 30081
    }
    type = "NodePort"
  }
  depends_on = [
    module.pachyderm
  ]
}

resource "null_resource" "copy_notebook" {
  provisioner "local-exec" {
    command = "kubectl -n ${var.namespace} rollout status deployment/combinator-jupyter-deployment && kubectl -n ${var.namespace} cp demo.ipynb $(kubectl -n ${var.namespace} get po -l app=combinator-jupyter -o custom-columns=POD:.metadata.name --no-headers):/home/jovyan"
  }
  depends_on = [
    module.jupyter
  ]
}