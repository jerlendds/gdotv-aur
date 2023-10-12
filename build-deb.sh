#!/bin/sh
mkdir /tmp/pkg

# Make sure we can RW the copy
chown -R notroot /tmp/pkg
chmod -R u+rw /tmp/pkg
find /tmp/pkg -type d -exec chmod u+x {} \;

cd /tmp/pkg
curl -L -O https://download.gdotv.com/binaries/gdotv.deb 
# Generate a PKGBUILD - https://wiki.archlinux.org/title/PKGBUILD - https://wiki.archlinux.org/title/Creating_packages - https://github.com/helixarch/debtap
debtap -P /tmp/pkg/gdotv.deb && cd /tmp/pkg/gdotv
# sudo -u notroot makepkg --printsrcinfo > .SRCINFO

# TODO: Upload package to AUR...
# https://wiki.archlinux.org/title/Arch_User_Repository#Sharing_and_maintaining_packages
# https://wiki.archlinux.org/title/AUR_submission_guidelines
# https://wiki.archlinux.org/title/AUR_submission_guidelines#Publishing_new_package_content