#!/bin/bash
#update system
apt -y update
apt -y dist-upgrade
apt-get -y install libnuma-dev
update-alternatives --config default.plymouth
echo  deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted >> /etc/apt/sources.list
apt-get -y update
apt-get -y build-dep linux-image-generic
apt-add-repository ppa:rodsmith/refind
apt-get -y update
apt-get -y -f install
apt-get -y -f upgrade
apt-get -y clean 
apt-get -y autoremove 
apt-get -y update
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT.*//g' /etc/default/grub
echo GRUB_CMDLINE_LINUX_DEFAULT=\"init=/lib/sysvinit/init\ selinux=0\ amdgpu.vm_fragment_size=9\ quiet\ nosplash\ amdgpu.hw_i2c=1\" >> /etc/default/grub
apt-get -y install openssh-server linux-image-lowlatency-hwe-16.04-edge linux-image-lowlatency-hwe-16.04-edge dkms linux-headers-4.13.0-32-lowlatency linux-headers-4.13.0-32 wicd-curses wireless-tools
ln -s  /usr/lib/grub/x86_64-efi /usr/lib/grub/i386-pc ; dpkg -a --configure
apt-get -y install refind
#remove systemd & install sysvinit
apt-get -y install upstart-sysv sysvinit-utils
rm /etc/modules-load.d/cups-filters.conf 
echo blacklist snd_hda_intel >> /etc/modprobe.d/blacklist.conf 
echo blacklist snd_hda_codec_hdmi >> /etc/modprobe.d/blacklist.conf 
echo blacklist lp >> /etc/modprobe.d/blacklist.conf 
echo blacklist parport_pc >> /etc/modprobe.d/blacklist.conf 
echo blacklist ppdev >> /etc/modprobe.d/blacklist.conf
apt-get -f install
update-initramfs -u
apt-get remove --purge --auto-remove systemd systemd:i386 -y
echo -e 'Package: systemd\nPin: release *\nPin-Priority: -1' > /etc/apt/preferences.d/systemd
echo -e '\n\nPackage: *systemd*\nPin: release *\nPin-Priority: -1' >> /etc/apt/preferences.d/systemd
echo -e '\nPackage: systemd:amd64\nPin: release *\nPin-Priority: -1' >> /etc/apt/preferences.d/systemd
echo -e '\nPackage: systemd:i386\nPin: release *\nPin-Priority: -1' >> /etc/apt/preferences
apt-get -f install
cd /root
wget -qO - http://repo.radeon.com/rocm/apt/debian/rocm.gpg.key | sudo apt-key add -
echo "deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main" > /etc/apt/sources.list.d/rocm.list
apt-get clean
apt-get autoremove
exit 0