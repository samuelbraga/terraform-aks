output "ingress_name" {
    value = helm_release.ingress.name
}

output "ingress_version" {
    value = helm_release.ingress.version
}

output "ingress_status" {
    value = helm_release.ingress.status
}

output "prometheus_name" {
    value = helm_release.prometheus.name
}

output "prometheus_version" {
    value = helm_release.prometheus.version
}

output "prometheus_status" {
    value = helm_release.prometheus.status
}

