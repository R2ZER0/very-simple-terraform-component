# Small and simple modules can just put all their resources in "main.tf".
#
# The name of files within a module have no meaning nor consequence whatsoever,
# a module *is* a directory of .tf files, but all .tf files in a directory can 
# be thought of as virtually being one big file.
# You can call this file anything.tf but common convention has chosen "main.tf".

# Pulls the image
resource "docker_image" "nginx" {
  name = "docker.io/library/nginx:latest"
}

# Create a container
# See: https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "demo" {
  image = docker_image.nginx.image_id
  name  = "terraform-demo-nginx"

  ports {
    internal = "80"
    external = "8080"
  }
}