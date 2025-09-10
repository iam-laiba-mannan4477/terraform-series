output "public-ip-address" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
  
}