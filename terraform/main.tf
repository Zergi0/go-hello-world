
locals {
  manifests = provider::kubernetes::manifest_decode_multi(file("../k8s/hello_world.yaml"))
}

resource "kubernetes_manifest" "multi" {
  for_each = { for m in local.manifests : "${m["kind"]}-${m["metadata"]["name"]}" => m }

  manifest = each.value
}
