resource "tls_private_key" "generated"{
    algorithm = "RSA"
}

resource "local_file" "private_key_pen" {
    content = tls_private_key.generated.private_key_pen
    filename = "MyAWSKey.pen"
}