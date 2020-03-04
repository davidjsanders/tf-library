# datadisk = [
#     {
#         block_size_bytes = 4096
#         disk-name        = "opt"
#         disk-size-in-gb  = 40
#         disk-type        = "pd-ssd"
#         mountpoint       = "/opt"
#         zone             = "us-east1-b"
#     },
#     {
#         block_size_bytes = 4096
#         disk-name        = "datadisk"
#         disk-size-in-gb  = 100
#         disk-type        = "pd-ssd"
#         mountpoint       = "/datadrive"
#         zone             = "us-east1-b"
#     }
# ]
datadisk = []
firewall-allow = {
    fw-name = "flask-firewall"
    ports   = [
        {
            port = 5000
            protocol = "tcp"
        }
    ]
}
firewall-deny = {
    fw-name = "flask-firewall"
    ports   = []
}
google-project = {
    project-id = "tf-library-samples"
    region     = "us-east1"
}
labels = {
    billing-code   = "ab12345"
    business-group = "technology"
    environment    = "dev"
    geography      = "us"
}
server = {
    admin-user   = "gcpadmin"
    delete-osd   = true
    keyfile      = "~/.ssh/gcp-admin"
    machine-type = "f1-micro"
    pub-keyfile  = "~/.ssh/gcp-admin.pub"
    public-ip    = true
    script       = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
    vm-hostname  = ""
    vm-prefix    = "ubuntu-vm"
    zone         = "us-east1-b"
}
    # vm-hostname  = "ubuvm.dgsd-consulting.com"
