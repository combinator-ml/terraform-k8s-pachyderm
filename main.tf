/**
 * # Kubernetes - Pachyderm
 *
 * This module installs Pachyderm on Kubernetes, via Helm.
 */

resource "helm_release" "pachyderm" {
  name             = "pachyderm"
  repository       = "https://pachyderm.github.io/helmchart/"
  chart            = "pachyderm"
  version          = "0.4.1"
  namespace        = var.namespace
  wait             = true
  lint             = true
  values           = var.values
  create_namespace = true
}
