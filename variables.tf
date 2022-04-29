variable "aws_region" {
  description = "aws_region"
  type        = string
  default     = "ap-south-1"
}
variable "aws_access_key" {
  description = "aws_access_key"
  type        = string
#  default     = "AKIAYVZRWGWOL2QOHP3N"
 # sensitive    = true
}
variable "aws_secret_key" {
  description = "aws_secret_key"
  type        = string
 # default     = "xT6Ymf+UzeaDo4b7AtDuBursg69CevaD9ZvPvLzM"
 # sensitive    =  true
}
variable "ec2_instance_type" {
 # description = "ec2_instance_type"
  type        = string
  default     = "t2.micro"
}
variable "ec2_ami" {
  description = "ec2_ami"
  type        = string
  default     = "ami-0a3277ffce9146b74"
}

variable "storage_size" {
  description = "storage_size"
  type        = string
  default     = "8"
}
variable "aws_sns_topic" {
  description = "sns_topic"
  type        = string
  default     = "arn:aws:sns:ap-south-1:596567799196:test"
}

variable "db_user" {
  description = "storage_size"
  type        = string
  default     = "adminuser"
}

variable "db_password" {
  description = "storage_size"
  type        = string
  default     = "dxq)36b#+QbCs.A)"
}

variable "server_key_name" {
  type = string
  default = "astrojudge"
}
