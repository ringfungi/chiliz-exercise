locals {
  cluster_name = "chiliz-cluster"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    spot = {
      desired_size = 2
      min_size     = 2
      max_size     = 10

      labels = {
        role = "spot"
      }

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }
}

resource "aws_eks_addon" "eks_cloudwatch" {
  addon_name   = "amazon-cloudwatch-observability"
  cluster_name = local.cluster_name
}