output "public_key_data" {
    value = tls_private_key.private_key.public_key_openssh
}
