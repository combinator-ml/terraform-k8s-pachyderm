output "namespace" {
  description = "Namespace is the kubernetes namespace of the release."
  value       = helm_release.pachyderm.namespace
}
