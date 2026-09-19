locals {
    vpc_id = module.vpc.vpc_id
    public_subnet_id = join("," , module.vpc.public_subnet)
    backend_subnet_id = join("," , module.vpc.backend_subnet)
    database_subnet_id = join("," , module.vpc.database_subnet)
}