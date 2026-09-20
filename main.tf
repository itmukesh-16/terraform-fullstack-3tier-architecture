module "infrastructure" {
  source   = "./modules/network"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "dev-vpc"

  #availability 
  availability_zone_1 = "us-east-1a"
  availability_zone_2 = "us-east-1b"

  #subnet value provision
  public_subnet_cidr_1 = "10.0.0.0/24"
  public_subnet_cidr_2 = "10.0.1.0/24"

  frontend_subnet_cidr_1 = "10.0.2.0/24"
  frontend_subnet_cidr_2 = "10.0.3.0/24"

  backend_subnet_cidr_1 = "10.0.4.0/24"
  backend_subnet_cidr_2 = "10.0.5.0/24"

  database_subnet_cidr_1 = "10.0.6.0/24"
  database_subnet_cidr_2 = "10.0.7.0/24"

}