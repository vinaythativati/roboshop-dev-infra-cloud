module "vpc" {
    
    source = "git::https://github.com/vinaythativati/terraform-vpc.git?ref=main"
    #source ="../terraform-vpc"
    project = var.project_name
    env = var.env_name
}

