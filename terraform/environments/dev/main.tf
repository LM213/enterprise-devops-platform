module "networking" {
  source = "../../modules/networking"

  environment              = var.environment
  vpc_cidr                 = var.vpc_cidr
  availability_zones       = var.availability_zones
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
}
module "eks" {
  source = "../../modules/eks"

  environment         = var.environment
  vpc_id              = module.networking.vpc_id
  private_subnet_ids  = module.networking.private_app_subnet_ids
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
}
module "ecr" {
  source = "../../modules/ecr"

  environment     = var.environment
  repository_name = var.ecr_repository_name
}