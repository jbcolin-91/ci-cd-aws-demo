terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0"
        }
    }
}

provider "docker" {}

resource "docker_image" "node_demo" {
    name = "node-demo-local:latest"

    build {
        context = "${path.module}/../app"
        dockerfile = "${path.module}/../app/Dockerfile"
    }
}

resource "docker_container" "node_demo" {
    name = "node-demo-container"
    image = docker_image.node_demo.name
    ports {
        internal = 8080
        external = 8080
    }
}

