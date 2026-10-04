/*resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-alb-styleloom.store
  type    = "A"
 
  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_elb.backend_alb.zone_id
    evaluate_target_health = true
  }
  overwrite = true
}
*/