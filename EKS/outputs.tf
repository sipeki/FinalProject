output "endpoint" {
  value = aws_eks_cluster.cluster1.endpoint
}

output "kubeconfig-ca-data" {
  value = aws_eks_cluster.cluster1.certificate_authority[0].data
}