module "eks" {
  source                                   = "terraform-aws-modules/eks/aws"
  version                                  = "~> 20.31"
  depends_on                               = [module.vpc]
  cluster_name                             = var.cluster_name
  cluster_version                          = var.cluster_version
  cluster_endpoint_public_access           = var.cluster_endpoint_public_access
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }
  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose", "system"]
  }
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets
  tags                     = var.tags
}

module "eks_managed_node_group" {
  source                            = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version                           = "20.37.1"
  count                             = var.create_managed_node_group ? 1 : 0
  depends_on                        = [module.eks]
  name                              = var.managed_node_group_name
  cluster_name                      = module.eks.cluster_name
  cluster_version                   = var.cluster_version
  subnet_ids                        = module.vpc.private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids            = [module.eks.node_security_group_id]
  ami_type                          = var.ami_type
  min_size                          = var.managed_ng_min_size
  max_size                          = var.managed_ng_max_size
  desired_size                      = var.managed_ng_desired_size
  cluster_service_cidr              = module.eks.cluster_service_cidr
  instance_types                    = var.instance_types
  capacity_type                     = "ON_DEMAND"
  labels = {
    Environment = "dev"
  }
  tags = var.tags
}
