resource "random_id" "instance-id" {
    byte_length = 8
}

resource "random_integer" "host-id" {
    min = 0
    max = 9999
}