resource "aws_ecs_service" "my_first_service" {
  name            = "my-first-service"                             
  cluster         = "${aws_ecs_cluster.afi.id}"        
  task_definition = "${aws_ecs_task_definition.afi.arn}" 
  launch_type     = "FARGATE"
  desired_count   = 1
  iam_role        = aws_iam_role.ecsTaskExecutionRole.arn

  network_configuration {
    subnets          = module.vpc.subnet_id
    assign_public_ip = true
 }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.target_group.arn}" 
    container_name   = "${aws_ecs_task_definition.afi.family}"
    container_port   = 80
  }
}