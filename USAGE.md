# Usage

<!--- BEGIN_TF_DOCS --->
# Kubernetes - Pachyderm

This module installs Pachyderm on Kubernetes, via Helm.

## Requirements

| Name | Version |
|------|---------|
| provider | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| namespace | (Optional) The namespace to install the release into. | `string` | `"default"` | no |
| values | (Optional) List of values in raw yaml to pass to helm. See https://github.com/pachyderm/helmchart/blob/master/pachyderm/values.yaml. | `list(string)` | <pre>[<br>  "tls:\n  certName: null # Disable TLS\n  create: null # Disable TLS\npachd:\n  logLevel: debug\n  storage:\n    backend: LOCAL\n"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace | Namespace is the kubernetes namespace of the release. |

<!--- END_TF_DOCS --->

