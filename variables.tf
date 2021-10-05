variable "vpc-cidr" {
  description = "Value of the VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public-subnet-1-cidr" {
  description = "public subnet 1 CIDR block"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public-subnet-2-cidr" {
  description = "public subnet 2 CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public-subnet-3-cidr" {
  description = "public subnet 3 CIDR block"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private-subnet-1-cidr" {
  description = "private subnet 1 CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private-subnet-2-cidr" {
  description = "private subnet 2 CIDR block"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private-subnet-3-cidr" {
  description = "private subnet 3 CIDR block"
  type        = string
  default     = "10.0.5.0/24"
}
