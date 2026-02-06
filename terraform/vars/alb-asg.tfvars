#Network
region  = "us-east-1"
vpc_id  = "vpc-08a3acf5e98c69107"
subnets = ["subnet-0579bc2985a646fd1", "subnet-0a2a383662b07f86d", "subnet-0635803b095ff727a"]

#alb_sg
ingress_alb_from_port   = 80
ingress_alb_to_port     = 80
ingress_alb_protocol    = "tcp"
ingress_alb_cidr_blocks = ["0.0.0.0/0"]
egress_alb_from_port    = 0
egress_alb_to_port      = 0
egress_alb_protocol     = "-1"
egress_alb_cidr_blocks  = ["0.0.0.0/0"]

#alb
internal          = false
loadbalancer_type = "application"

#target_group
target_group_port                = 8080
target_group_protocol            = "HTTP"
target_type                      = "instance"
load_balancing_algorithm         = "round_robin"
health_check_path                = "/"
health_check_port                = 8080
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#instance_sg
ingress_asg_cidr_from_port = 22
ingress_asg_cidr_to_port   = 22
ingress_asg_cidr_protocol  = "tcp"
ingress_asg_cidr_blocks    = ["0.0.0.0/0"]
ingress_asg_sg_from_port   = 8080
ingress_asg_sg_to_port     = 8080
ingress_asg_sg_protocol    = "tcp"
egress_asg_from_port       = 0
egress_asg_to_port         = 0
egress_asg_protocol        = "-1"
egress_asg_cidr_blocks     = ["0.0.0.0/0"]

#asg
max_size         = 3
min_size         = 1
desired_capacity = 2

#listener
listener_port     = 80
listener_protocol = "HTTP"
listener_type     = "forward"

#launch_template
ami_id               = "ami-0f7a74cccd5a223bc"
instance_type        = "t2.medium"
key_name             = "vignesh"
user_data            = <<-EOF
#!/bin/bash
bash /home/ubuntu/start.sh
EOF
public_access        = true
instance_warmup_time = 30
target_value         = 50

owner       = "vignesh"
environment = "dev"
cost_center = "devops"
application = "pet-clinic"