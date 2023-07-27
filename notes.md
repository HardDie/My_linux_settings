* Good example C comments
/**
 * Copies the default config to startup.
 * Reads the default config file/partition,
 * stripping the headers and validating the md5sum,
 * and writes it to the startup config.
 * @param  msg  - destanation masage
 * @retval 0 if successful.
 * @retval 1 if the default config does not exist.
 * @retval other in case of error.
 */

* Sites for test regular expression
  https://www.debuggex.com/
  https://regexper.com/

* How remove attribute
** Install
   yaourt mat mutagen perl-image-exiftool
** Check
   mat -c <file>
** Show metadata
   mat -d <file>
** Delete metadata
   mat -b <file>

* How add fat and ntfs tools
  pacman -S dosfstools ntfsprogs

* How add file system for flash
  pacman -S f2fs-tools

* ASCIIFLOW
  http://nightly.ascii-flow.appspot.com/#Draw

* Service for found photo
  snradar.azurewebsites.net

* How setup WiFi card on promiscuous mode
** Find your phy
   iw phy
** Add new interface
   iw phy phyX interface add mon0 type monitor
   iw dev mon0 del
** With iw
   iw dev wlan0 set type monitor
   iw dev wlan0 set type managed
** Set channel for listen
   iw dev wlan0 set channel *channel*

* Unprivileged power management
  pacman -S polkit

* Objdump
** objdump -D file
** addr2line -e file -a 0x(addr)
** strip

** Crypt setup
*** Edit /etc/default/grub
    cryptdevice=/dev/sda2:name_crypt

* Draw gpaphs
  pacman -S graphviz

* Validator json
  https://jsonlint.com/

* How upgrade ssh id_rsa
  openssl pkcs8 -topk8 -v2 des3 -in id_rsa.old -out id_rsa

* Hex editor
  hexer

* Disable kerlen printk logs
  echo 0 > /proc/sys/kernel/printk

* i3 how find key name
** xev
** xmodmap -pke

* Count lines code
  tokei

* Disable installing default gw and dns from DHCP
** Open /etc/dhcpcd.conf and add to end
** interface iface_name
** nogateway
** nohook resolv.conf

* Setup fail2ban
** fail2ban/action.d/iptables-blocktype.local
*** [Init]
*** blocktype = DROP
** fail2ban/jail.d/sshd.local
*** [sshd]
*** enabled = true
*** maxretry = 5
*** ignoreip = 127.0.0.1/8
*** port = 22

* graphviz online
** http://dreampuf.github.io/GraphvizOnline/

* Show font symbols
** Print font family
   fc-query some.ttf or some.otf
** Print font symbols
   xfd -fa "SomeFontFamily"

* How unpack initramfs image
** zcat /boot/initramfs-linux.img > some.cpio
** cpio -vid < some.cpio

* How run another display server
** Run server
   Xephyr :1 -ac -screen 640x480x8
** Run app
   DISPLAY=:1 app

* Utils
** NCurses Disk Usage
   ncdu
** Convert djvu to pdf (djvulibre)
   ddjvu -format=pdf in.djvu out.pdf

* Wireshark
** How decrypt HTTPS session
*** Set environment var
    SSLKEYLOGFILE=/tmp/ssl.log
*** Setup wireshark
    Edit -> Preferences -> Protocols -> TLS -> (Pre)-Master-Secret log filename

* Markdown online editor
** https://stackedit.io/app#

* Validate server SSL/TLS
** https://www.geocerts.com/ssl-checker
** https://www.ssllabs.com/ssltest/analyze.html
