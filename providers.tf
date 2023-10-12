# Including provider config definitions allows us to run `terraform apply` in this directory
# turning this from a re-usable module into a component.
# (reusable modules must not contain provider definitions)

# Docker Provider configuration
# See: https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs
provider "docker" {
    host = "unix:///var/run/docker.sock"
}

