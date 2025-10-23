terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Variables

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
}

variable "image_name" {
  description = "Repository name"
  type        = string
  default     = "ci-cd-demo-app"
}

variable "image_tag" {
  description = "Image tag to deploy"
  type        = string
  default     = "latest"
}

# Resources

resource "docker_image" "app" {
  name         = "${var.docker_username}/${var.image_name}:${var.image_tag}"
  keep_locally = false
}

resource "docker_container" "app" {
  name  = "node-demo-container"
  image = docker_image.app.name

  ports {
    internal = 8080
    external = 8080
  }

  must_run = true
  restart  = "unless-stopped"
}

# Outputs

output "app_image" {
  value = docker_image.app.name
}

output "app_url" {
  value = "http://localhost:8080"
}

