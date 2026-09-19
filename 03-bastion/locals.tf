locals {
   common_name = "${var.project_name}-${var.env_name}"
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    public_subnet_sg_id = split(",", data.aws_ssm_parameter.public_subnet.value)[0]
     ami = data.aws_ami.ami_data.id
     common_tag = {
        project_name = "${var.project_name}"
        env_name = "${var.env_name}"
        terraform = true
     }
}

