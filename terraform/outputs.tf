output "aks_id" {
    value = module.aks.id
}

output "name" {
    value = module.ingress.name
}

output "version" {
    value = module.ingress.version
}

output "status" {
    value = module.ingress.status
}
