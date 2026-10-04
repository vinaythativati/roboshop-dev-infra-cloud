resource "aws_route53_record" "cataloague" {
  zone_id = var.zone_id
  name    = "cataloague.backend_alb-${var.env_name}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.cataloague.private_ip]
}