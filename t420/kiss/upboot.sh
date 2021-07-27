#! /bin/sh

if [ ! -f /boot/vmlinuz ]; then 
	{ echo "vmlinuz not found"; exit 1; } 
fi

if [ ! -f /boot/System.map ]; then 
	{ echo "System.map not found"; exit 1; } 
fi

mv /boot/vmlinuz-$(uname -r) /boot/vmlinuz-$(uname -r).old
mv /boot/vmlinuz /boot/vmlinuz-$(uname -r)
mv /boot/System.map-$(uname -r)  /boot/System.map-$(uname -r).old
mv /boot/System.map /boot/System.map-$(uname -r)

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=kiss 
grub-mkconfig -o /boot/grub/grub.cfg
