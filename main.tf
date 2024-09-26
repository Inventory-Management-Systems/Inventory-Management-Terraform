module "namespace" {
  source    = "./module/namespace"
  namespace = var.namespace
}

module "mysql" {
  source             = "./module/mysql"
  namespace          = var.namespace
  mysql_service_name = var.mysql_service_name
}

module "react" {
  source             = "./module/react"
  namespace          = var.namespace
  react_service_name = var.react_service_name
  frontend_image     = var.frontend_image
}

module "springboot" {
  source                  = "./module/springboot"
  namespace               = var.namespace
  springboot_service_name = var.springboot_service_name
  mysql_service_name      = var.mysql_service_name
  backend_image           = var.backend_image
}
