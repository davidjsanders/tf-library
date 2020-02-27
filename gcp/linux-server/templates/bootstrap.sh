#!/usr/bin/env bash
%{ for d in disks ~}
echo "[Question] Is device ${d["device"]} formatted?"
diskExist=$(blkid | grep ${d["device"]})
if [ "$diskExist" == "" ];
then
    echo "[Activity] Formatting device ${d["device"]}"
    mkfs.ext4 \
        -q \
        -m 0 \
        -E lazy_itable_init=0,lazy_journal_init=0,discard \
        ${d["device"]}
    echo "[Complete] Disk formatted"
else
    echo "[Ignored ] Disk already formatted"
fi
uuid=$(sudo blkid -s UUID -o value ${d["device"]})

echo "[Question] Is device ${d["device"]} mounted?"
diskMounted=$(df -h | grep "${d["device"]}")
if [ "$diskMounted" == "" ];
then
    echo "[Activity] Mounting device ${d["device"]}"
    mkdir -p ${d["mountpoint"]}
    mount -o discard,defaults ${d["device"]} ${d["mountpoint"]}
    chmod a+w ${d["device"]}
    echo "[Complete] Disk mounted and set to a+w"
else
    echo "[Ignored ] Disk already mounted"
fi

echo "[Question] Is device ${d["mountpoint"]} in /etc/fstab?"
diskInFstab=$(grep $uuid /etc/fstab)
if [ "$diskInFstab" == "" ];
then
    echo "[Activity] Writing mount ${d["mountpoint"]} to /etc/fstab"
    echo UUID=$uuid ${d["mountpoint"]} ext4 discard,defaults,nofail 0 2 >> /etc/fstab
    echo "[Complete] Mount ${d["mountpoint"]} written to /etc/fstab"
else
    echo "[Ignored ] Disk already exists in /etc/fstab"
fi

%{ endfor ~}