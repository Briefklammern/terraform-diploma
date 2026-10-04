terraform {
backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region = "ru-central1"
    key    = "./terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # нужно для Terraform 1.6.1 и старше
    skip_s3_checksum            = true # нужно для Terraform 1.6.3 и старше
  }
}
