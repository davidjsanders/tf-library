locals {
  l-random     = substr(lower(var.tags.environment), 0, 3) == "dev" ? format("-%s", random_integer.unique-sa-id.result) : ""
  l-random-int = <<-EOF
    substr(lower(var.tags.environment), 0, 3) == "dev"
    ? format("%s", random_integer.unique-sa-id.result) 
    : ""
  EOF
}
