output "subnet-ids" {
  value = list(
    module.subnet-1.id,
    module.subnet-2.id,
    module.subnet-3.id
  )
}

output "subnet-names" {
  value = list(
    module.subnet-1.name,
    module.subnet-2.name,
    module.subnet-3.name
  )
}

output "subnet-address-prefixes" {
  value = list(
    module.subnet-1.address-prefix,
    module.subnet-2.address-prefix,
    module.subnet-3.address-prefix
  )
}