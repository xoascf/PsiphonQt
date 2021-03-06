gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port $$ORT$$

kwriteconfig --file kioslaverc --group 'Proxy Settings' --key ProxyType "1"
kwriteconfig --file kioslaverc --group 'Proxy Settings' --key httpProxy "http://127.0.0.1:$$PORT$$"
kwriteconfig --file kioslaverc --group 'Proxy Settings' --key Authmode 0

kwriteconfig5 --file kioslaverc --group 'Proxy Settings' --key ProxyType "1"
kwriteconfig5 --file kioslaverc --group 'Proxy Settings' --key httpProxy "http://127.0.0.1:$$PORT$$"
kwriteconfig5 --file kioslaverc --group 'Proxy Settings' --key Authmode 0

# When you modify kioslaverc, you need to tell KIO.
dbus-send --type=signal /KIO/Scheduler org.kde.KIO.Scheduler.reparseSlaveConfiguration string:''

