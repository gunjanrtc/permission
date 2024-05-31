terraform {
  required_version = ">= 1.7.0"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = merge(
      var.additional_tags
    )
  }
}
locals {
  name = "${var.app_name}-${var.environment}-${var.region_id}-${var.domain}"
}
