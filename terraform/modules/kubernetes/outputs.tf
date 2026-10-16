
output "control_plane_private_ip" {
  description = "Kubernetes control plane private IP"
  value       = aws_instance.control_plane.private_ip
}

output "worker_private_ip" {
  description = "Kubernetes worker private IP"
  value       = aws_instance.worker.private_ip
}

output "control_plane_instance_id" {
  description = "Control plane instance ID"
  value       = aws_instance.control_plane.id
}

output "worker_instance_id" {
  description = "Worker instance ID"
  value       = aws_instance.worker.id
}
