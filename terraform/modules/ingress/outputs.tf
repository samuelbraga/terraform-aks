output "name" {
    value = helm_release.ingress.name
}

output "version" {
    value = helm_release.ingress.version
}

output "status" {
    value = helm_release.ingress.status
}
