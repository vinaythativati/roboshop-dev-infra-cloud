resource "aws_iam_role" "mysql" {
  name = "${var.project_name}-${var.env_name}-mysql"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
        local.common_tag,
        {
            Name ="${local.common_name}-mysql"
        }
    )
  
}

# terraform aws iam policy

resource "aws_iam_policy" "mysql" {
  name        = "${local.common_name}-mysql-policy"
  description = "policy to read mysql ssm parameter to attach to mysql instance"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("mysql-iam-policy.json")
}

# terraform aws policy attach
resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.mysql.arn
}

# terraform aws instance profile
resource "aws_iam_instance_profile" "mysql" {
  name = "${local.common_name}-mysql"
  role = aws_iam_role.mysql.name
}