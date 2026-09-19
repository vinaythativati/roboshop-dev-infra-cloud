output "vpc_id" {
    value = module.vpc.vpc_id
}

output "pubilc_subnet"{
    value = module.vpc.public_subnet
}

output "backend_subnet"{
    value = module.vpc.backend_subnet
}

output "database_subnet"{
    value = module.vpc.database_subnet
}