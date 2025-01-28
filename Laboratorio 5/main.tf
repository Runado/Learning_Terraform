data "local_file" "docs" {
  filename = "documentation.txt"
}

data "http" "docs" {
  url = data.local_file.docs.content
}

resource "local_file" "output" {
  content   = data.http.docs.response_body
  filename = "${basename(data.local_file.docs.content)}.html"
}
output "documentation" {
  value = data.local_file.docs.content
}