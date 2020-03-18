#! /bin/bash

LAST_KERNEL=$(awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg | cut  -c  22-51 |  head -1)
CURRENT_KERNEL=$(uname -r)
 if [[ $LAST_KERNEL != $CURRENT_KERNEL ]]; then
        echo "Reboot is required" > /tmp/reboot
        cat /tmp/reboot
 else
        echo "Kernel is same and not required." > /tmp/noreboot
        cat /tmp/noreboot
 fi

