variable "namespace" {
  description = "(Optional) The namespace to install the release into."
  type        = string
  default     = "default"
}

variable "values" {
  description = "(Optional) List of values in raw yaml to pass to helm. See https://github.com/pachyderm/helmchart/blob/master/pachyderm/values.yaml."
  type        = list(string)
  default = [<<EOT
tls:
  certName: null # Disable TLS
  create: null # Disable TLS
pachd:
  logLevel: debug
  storage:
    backend: LOCAL
EOT 
  ]
}
