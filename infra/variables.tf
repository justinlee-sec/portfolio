variable "region" {
  type        = string
  description = "Primary AWS region"
  default     = "eu-west-1"
}

variable "domain_name" {
  type        = string
  description = "Apex domain for the site"
  default     = "justinleenelson.tech"
}