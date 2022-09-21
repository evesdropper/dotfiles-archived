#!/bin/sh

export LC_ALL=C
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
#HOME=/var/lib/libvirt/qemu/domain-5-archlinux
export XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-5-archlinux/.local/share
#export XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-5-archlinux/.cache
export XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-5-archlinux/.config

/usr/bin/qemu-system-x86_64 \
-name guest=archlinux,debug-threads=on \
-S \
-machine pc-q35-6.2,usb=off,vmport=off,dump-guest-core=off,memory-backend=pc.ram \
-accel kvm \
-cpu host,migratable=on \
-m 4096 \
-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":4294967296}' \
-overcommit mem-lock=off \
-smp 2,sockets=2,cores=1,threads=1 \
-uuid 9cbba661-c48b-4422-b4ec-53cad4776f59 \
-display sdl,gl=on,show-cursor=on \
-no-user-config \
-nodefaults \
-rtc base=utc,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-global ICH9-LPC.disable_s3=1 \
-global ICH9-LPC.disable_s4=1 \
-boot strict=on \
-device pcie-root-port,port=16,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x2 \
-device pcie-root-port,port=17,chassis=2,id=pci.2,bus=pcie.0,addr=0x2.0x1 \
-device pcie-root-port,port=18,chassis=3,id=pci.3,bus=pcie.0,addr=0x2.0x2 \
-device pcie-root-port,port=19,chassis=4,id=pci.4,bus=pcie.0,addr=0x2.0x3 \
-device pcie-root-port,port=20,chassis=5,id=pci.5,bus=pcie.0,addr=0x2.0x4 \
-device pcie-root-port,port=21,chassis=6,id=pci.6,bus=pcie.0,addr=0x2.0x5 \
-device pcie-root-port,port=22,chassis=7,id=pci.7,bus=pcie.0,addr=0x2.0x6 \
-device pcie-root-port,port=23,chassis=8,id=pci.8,bus=pcie.0,addr=0x2.0x7 \
-device pcie-root-port,port=24,chassis=9,id=pci.9,bus=pcie.0,multifunction=on,addr=0x3 \
-device pcie-root-port,port=25,chassis=10,id=pci.10,bus=pcie.0,addr=0x3.0x1 \
-device pcie-root-port,port=26,chassis=11,id=pci.11,bus=pcie.0,addr=0x3.0x2 \
-device pcie-root-port,port=27,chassis=12,id=pci.12,bus=pcie.0,addr=0x3.0x3 \
-device pcie-root-port,port=28,chassis=13,id=pci.13,bus=pcie.0,addr=0x3.0x4 \
-device pcie-root-port,port=29,chassis=14,id=pci.14,bus=pcie.0,addr=0x3.0x5 \
-device qemu-xhci,p2=15,p3=15,id=usb,bus=pci.2,addr=0x0 \
-device virtio-serial-pci,id=virtio-serial0,bus=pci.3,addr=0x0 \
-device virtio-vga-gl \
-device ide-cd,bus=ide.0,id=sata0-0-0 \
-audiodev '{"id":"audio1","driver":"spice"}' \
-device ich9-intel-hda,id=sound0,bus=pcie.0,addr=0x1b \
-device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0,audiodev=audio1 \
-device virtio-balloon-pci,id=balloon0,bus=pci.5,addr=0x0 \
-msg timestamp=on
