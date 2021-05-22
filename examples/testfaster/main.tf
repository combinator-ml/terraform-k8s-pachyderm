variable "namespace" {
  description = "(Optional) The namespace to install into. Defaults to feast."
  type        = string
  default     = "pachyderm"
}

module "pachyderm" {
  source    = "combinator-ml/pachyderm/k8s"
  namespace = var.namespace
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
      port        = 8080
      target_port = 8080
      node_port   = 30600
    }
    type = "NodePort"
  }
}
