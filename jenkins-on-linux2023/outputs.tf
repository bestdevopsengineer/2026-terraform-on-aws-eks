output "jenkins_url" {
  description = "URL to access Jenkins"
  value       = "http://${aws_instance.jenkins_server.public_ip}:8080"
}

