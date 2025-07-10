
provider "kind" {}

resource "kind_cluster" "t2s" {
  name       = "t2s-dev"
  config_path = "${path.module}/kind-config.yaml"
}
