provider "aws" {
  region                  = var.region
  shared_credentials_file = var.shared_credentials

}

# provider "kubernetes" {
#   host  = module.cluster1.endpoint
# }

module "VPC" {
  source = "./VPC"
}

module "SG" {
  source = "./SG"
  vpc_id = module.VPC.vpc_id
}

# module "cluster1" {
#   source          = "./EKS"
#   subnet_a        = module.VPC.subnet_a_id
#   subnet_b        = module.VPC.subnet_b_id
#   vpc_id          = module.VPC.vpc_id
# }

module "instances" {
  source                 = "./EC2"
  subnet_a               = module.VPC.subnet_a_id
  subnet_b               = module.VPC.subnet_b_id
  vpc_security_group_ids = module.SG.SG_id
}

