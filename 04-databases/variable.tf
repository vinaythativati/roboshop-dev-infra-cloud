variable "project_name" {
    default = "roboshop"
}

variable "env_name" {
    default = "dev"

}
variable "ec2_tag" {
    default = {}
}

variable "domain" {
    default = "styleloom.store"
}

variable "zone_id" {
    default = "Z0637601PVTJ5SL2XO7S"
}

variable "mysql_root_password" {
 type = string
}