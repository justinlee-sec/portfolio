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

variable "github_repo" {
  type        = string
  description = "GitHub repository allowed to assume the CI roles, as owner/name"
  default     = "justinlee-sec/portfolio"
}variable   "x"   {}
