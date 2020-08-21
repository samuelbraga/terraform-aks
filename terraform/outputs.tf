output "aks_id" {
    value = module.aks.id
}

output "ingress_name" {
    value = module.ingress.name
}

output "ingress_version" {
    value = module.ingress.version
}

output "ingress_status" {
    value = module.ingress.status
}

output "prometheus_name" {
    value = module.prometheus.name
}

output "prometheus_version" {
    value = module.prometheus.version
}

output "prometheus_status" {
    value = module.prometheus.status
}

output "login_server" {
    value = module.acr.login_server
}
