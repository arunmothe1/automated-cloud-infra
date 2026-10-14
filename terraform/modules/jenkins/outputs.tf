output "jenkins_instance_id {
    descripetion = "jenkins ec2 instance id"
    value = aws_instance.jenkins.id
}

output "jenkins_public_ip" {
    descripetion = "jenkins public ip"
    value = aws_instance.jenkins.public_ip
}

output "jenkins_instance_dns" {
    descripetion = "jenkins public dns"
    value = aws_instance.jenkins.public.dns
}