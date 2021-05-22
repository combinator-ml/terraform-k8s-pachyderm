variable "namespace" {
  description = "(Optional) The namespace to install into. Defaults to feast."
  type        = string
  default     = "pachyderm"
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

resource "kubernetes_service" "pachyderm-dash" {
  metadata {
    name      = "testfaster-pachyderm-dash"
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
