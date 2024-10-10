################################################################################
# VPC Module
################################################################################

module "secondary-cidr" {
  source = "../../modules/secondary-cidr"
  
  vpc_id = "vpc-091ecfdf45020c78f"
  secondary_cidr_block = "10.0.0.0/16"
  name                 = "testing-tamil"
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]
}
