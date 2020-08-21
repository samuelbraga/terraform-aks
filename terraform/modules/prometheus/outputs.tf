output "name" {
    value = helm_release.prometheus.name
}

output "version" {
    value = helm_release.prometheus.version
}

output "status" {
    value = helm_release.prometheus.status
}
