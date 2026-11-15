variable "image_tag" {
  description = "Image tag (commit SHA) to deploy"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for yahyejama.win"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo allowed to assume the role, as owner/name"
  type        = string
  default     = "yahyejama476-blip/ecs-project"
}