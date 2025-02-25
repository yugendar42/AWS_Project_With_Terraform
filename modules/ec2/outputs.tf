output "instance1_id" {
  description = "EC2 instance 1 ID"
  value       = aws_instance.webserver1.id
}

output "instance2_id" {
  description = "EC2 instance 2 ID"
  value       = aws_instance.webserver2.id
}
