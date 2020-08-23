output "aks_id" {
    value = module.aks.id
}

output "ingress_name" {
    value = module.helm.ingress_name
}

output "ingress_version" {
    value = module.helm.ingress_version
}

output "ingress_status" {
    value = module.helm.ingress_status
}

output "prometheus_name" {
    value = module.helm.prometheus_name
}

output "prometheus_version" {
    value = module.helm.prometheus_version
}

output "prometheus_status" {
    value = module.helm.prometheus_status
}

output "login_server" {
    value = module.acr.login_server
}
