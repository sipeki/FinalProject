resource "aws_iam_role" "AWSEKSClusterRole" {
    name = "AWSEKSClusterRole"

    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
      "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.AWSEKSClusterRole.name

}

resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy"{
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role       = aws_iam_role.AWSEKSClusterRole.name

}

resource "aws_eks_cluster" "cluster1" {
  name     = "cluster1"
  role_arn = aws_iam_role.AWSEKSClusterRole.arn

  vpc_config {
    subnet_ids = [var.subnet_a, var.subnet_b]
  }
}

resource "aws_eks_node_group" "nodegroup1" {
  cluster_name    = aws_eks_cluster.cluster1.name
  node_group_name = "nodegroup1"
  node_role_arn   = aws_iam_role.AWSEKSNodeRole.arn

  subnet_ids      = [var.subnet_a, var.subnet_b]


  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }
}

resource "aws_iam_role" "AWSEKSNodeRole" {
    name = "AWSEKSNodeRole"
    
    assume_role_policy =  <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
      "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.AWSEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.AWSEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.AWSEKSNodeRole.name
}