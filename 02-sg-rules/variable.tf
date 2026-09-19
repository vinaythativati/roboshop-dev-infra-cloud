variable sg_name{

  default = ["mongodb" ,"mysql" ,"redis","rabbitmq" ,
  "catloague", "shipping","cart","payments","users",
  "backend_alb" ,
  "frontend",
  "frontend_alb",
  "bastion"
  ]

}
variable  "env_name" {
    default = "dev"
}
variable "project_name" {
    default = "roboshop"
}
