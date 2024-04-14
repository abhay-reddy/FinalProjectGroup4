#Adding the output variable to display

output "lb_dns_name" {
  value = aws_lb.alb.dns_name
}

