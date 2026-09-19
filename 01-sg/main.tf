module "sg" {
    count = length(var.sg_name)
    source = "git::https://github.com/vinaythativati/terraform-sg.git?ref=main"
    project_name = var.project_name
    env_name = var.env_name
    sg_name = var.sg_name[count.index]
    vpc_id = local.vpc_id
}