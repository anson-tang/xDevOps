#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@ THIS FILE IS MANAGED BY PUPPET  -- do not edit all changes will be lost !   @
#@ For more information see git repo 'puppetmaster'                            @
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# Set system wide proxy settings
http_proxy=http://127.0.1.1:3128/
ftp_proxy=http://127.0.1.1:3128/
https_proxy=http://127.0.1.1:3128/
no_proxy=localhost,127.0.0.1,10.,192.168.62.,.corp,.faurecia

export http_proxy ftp_proxy https_proxy no_proxy
