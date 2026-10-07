output "alb_sg_id" {
  description = "alb security group id"
  value       = aws_security_group.alb.id
}

output "jenkins_sg_id" {
  description = "jenkins security group id"
  value       = "aws_security_group.jenkins.id"
}

output "k8s_sg_id" {
  description = "kubernetes security group id"
  value       = aws_security_group.k8s.id
}

output "rds_sg_id" {
  description = "rds seccurity group id"
  value       = aws_security_group.rds.id
}