#! /bin/sh

if [ ! -f /boot/vmlinuz ]; then 
	{ echo "vmlinuz not found"; exit 1; } 
fi

if [ ! -f /boot/System.map ]; then 
	{ echo "System.map not found"; exit 1; } 
fi

mv /boot/vmlinuz-5.13.2 /boot/vmlinuz-5.13.2.old
mv /boot/vmlinuz /boot/vmlinuz-5.13.2
mv /boot/System.map-5.13.2  /boot/System.map-5.13.2.old
mv /boot/System.map /boot/System.map-5.13.2

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=kiss 
grub-mkconfig -o /boot/grub/grub.cfg

