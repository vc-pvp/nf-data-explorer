group "default" {
  targets = ["conduit-nf-data"]
}

target "conduit-nf-data" {
  dockerfile = "./deploy/Dockerfile"
  platforms = ["linux/arm64"]
}
