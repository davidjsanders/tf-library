# tf-library
A terraform library to provide common modules for key functions, such as jumpboxes, servers, 3 tier networks and more.

At the current release, modules are supported for:

* 3 tier network (jumpbox, master and worker subnets)
* A linux server acting as a jumpbox with a network interface, public IP and ssh rule
* A linux server with a network interface and randomly assigned password

## Cloud Provider Support
As of the current release:

| Module   | Azure | GCP | AWS |
| -------- | ----- | --- | --- |
| 3 tier network | yes | no | no |
| linux jumpbox | yes | no | no |
| linux server | yes | no | no |