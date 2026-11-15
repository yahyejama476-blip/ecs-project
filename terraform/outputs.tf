output "alb_dns_name" {
  value = module.alb.dns_name
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}