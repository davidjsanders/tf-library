locals {
    l-hostnames = [
        for i in range(0, var.linux-server.server.server-count) :
        lower(format(
                "%s-%02d%s",
                var.linux-server.os.hostname,
                i + 1,
                var.linux-server.randomizer
            ))
    ]
}