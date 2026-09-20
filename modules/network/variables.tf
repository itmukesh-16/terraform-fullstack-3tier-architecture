#vpc variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
  }

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = ""
  }

#availability zone declation 
 variable "availability_zone_1" {
    default = ""
  }
 variable "availability_zone_2" {
    default = ""
  }

  #public subnet=======================================
  variable "public_subnet_cidr_1" {
    default = ""
  }
 
  variable "public_subnet_cidr_2" {
    default = ""
  }
  #frontend subnet===============================
  variable "frontend_subnet_cidr_1" {
    default = ""
  }
   variable "frontend_subnet_cidr_2" {
    default = ""
  }

  #backend subnet==================================
  variable "backend_subnet_cidr_1" {
    default = ""
  }
  variable "backend_subnet_cidr_2" {
    default = ""
  }

  #database subnet ===================================
  variable "database_subnet_cidr_1" {
    default = ""
  }
  variable "database_subnet_cidr_2" {
    default = ""
  }
