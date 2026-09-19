#mongodb-dev-styleloom.store
resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-${var.env_name}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.mongodb.private_ip]
}