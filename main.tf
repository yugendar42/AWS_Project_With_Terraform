module "networking" {
  source             = "./modules/networking"
  cidr               = var.cidr
  subnet1_cidr       = var.subnet1_cidr
  subnet2_cidr       = var.subnet2_cidr
  availability_zones = var.availability_zones
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.networking.vpc_id
}

module "ec2_instances" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  vpc_id            = module.networking.vpc_id
  subnet1_id        = module.networking.subnet1_id
  subnet2_id        = module.networking.subnet2_id
  security_group_id = module.security_group.security_group_id
}

module "load_balancer" {
  source            = "./modules/load_balancer"
  vpc_id            = module.networking.vpc_id
  subnet1_id        = module.networking.subnet1_id
  subnet2_id        = module.networking.subnet2_id
  security_group_id = module.security_group.security_group_id
  ec2_instance_ids  = [module.ec2_instances.instance1_id, module.ec2_instances.instance2_id]
}

module "s3_bucket" {
  source      = "./modules/s3_bucket" 
  bucket_name = module.s3_bucket.s3_bucket_name
}


output "loadbalancer_dns" {
  value = module.load_balancer.lb_dns_name
}

