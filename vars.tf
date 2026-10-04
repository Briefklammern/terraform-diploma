variable "cloud_id" {
  type		= string
}

variable "folder_id" {
  type		= string
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-e"
}

variable "vpc_name" {
  type        = string
  default     = "diploma"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.10.100.0/24"]
}
