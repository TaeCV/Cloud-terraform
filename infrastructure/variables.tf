variable "region" {
  default     = "ap-southeast-1"
  description = "AWS Region"
}

variable "availability_zone" {
  default     = "ap-southeast-1a"
  description = ""
}

variable "ami" {
  default = "ami-0d058fe428540cd89"
}

variable "bucket_name" {
  default = "safetydolphinwalrus010"
}

variable "database_name" {
  default = "wordpress"
}

variable "database_user" {
  default = "username"
}

variable "database_pass" {
  default = "password"
}

variable "admin_user" {
  default = "admin"
}

variable "admin_pass" {
  default = "admin"
}