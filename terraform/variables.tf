# Input variables for the ECS project
variable "image_tag" {
  description = "Image tag (commit SHA) to deploy"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for yahyejama.win"
  type        = string
  default     = "16fe69fa5e8f26a8cd6dfff5c29f034e"
}

variable "github_repo" {
  description = "GitHub repo in immutable form, as owner@owner-id/repo@repo-id"
  type        = string
  default     = "yahyejama476-blip@299951063/ecs-project@1418143830"
}