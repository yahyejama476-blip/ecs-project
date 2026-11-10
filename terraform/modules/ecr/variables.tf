variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "max_image_count" {
  description = "Number of images to keep before older ones expire"
  type        = number
  default     = 10
}