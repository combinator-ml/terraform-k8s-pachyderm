# pachyderm
Pachyderm terraform module for combinator.ml

## Usage

```terraform
module "pachyderm" {
    source = "git::https://example.com/vpc.git?ref=v1.2.0"
}
```

### Stack Creation

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform apply
```

### Stack Deletion

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform apply 
```

## Known Issues

- Why do you have to explicitly export the Kubernetes config?

I found that hardcoding the kubeconfig led to [this terraform bug](https://github.com/terraform-aws-modules/terraform-aws-eks/issues/1234).