group "default" {
  targets = ["conduit-nf-data"]
}

target "conduit-replay" {
  dockerfile = "./deploy/Dockerfile"
  platforms = ["linux/arm64"]
}
