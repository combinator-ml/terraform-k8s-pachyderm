# Usage

<!--- BEGIN_TF_DOCS --->
# terraform-k8s-pachyderm

Pachyderm terraform module for combinator.ml

## Usage

```terraform
module "pachyderm" {
    source = "git::https://github.com/combinator-ml/terraform-k8s-pachyderm.git?ref=0.0.0"
}
```

See the full configuration options below.

### Stack Creation

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform apply
```

### Stack Deletion

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform destroy
```

## Known Issues

- Why do you have to explicitly export the Kubernetes config?

I found that hardcoding the kubeconfig led to [this terraform bug](https://github.com/terraform-aws-modules/terraform-aws-eks/issues/1234).

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

