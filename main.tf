terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  # Configuration options
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "ubuntu" {
  name = var.ubuntu_image
}

resource "docker_container" "ubuntu" {
  name     = var.container_name
  image    = docker_image.ubuntu.image_id
  must_run = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}
