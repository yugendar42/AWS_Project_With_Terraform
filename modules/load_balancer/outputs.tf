output "lb_dns_name" {
  description = "Load balancer DNS name"
  value       = aws_lb.myAlb.dns_name
}
