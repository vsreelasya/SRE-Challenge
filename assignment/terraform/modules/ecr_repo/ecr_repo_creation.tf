resource "aws_ecr_repository" "docker_repo" {
  name                 = var.name
}