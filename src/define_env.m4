m4_divert(-1)

m4_define(<<ENV_LISTEN_IP>>, m4_esyscmd(<<printf "${ENV_LISTEN_IP:-127.0.0.1}">>))

m4_define(<<ENV_UDP_TCP_PORT>>, m4_esyscmd(<<printf "${ENV_UDP_TCP_PORT:-5060}">>))

# 主域名
m4_define(<<ENV_DOMAIN_MAIN>>, m4_esyscmd(<<printf "${ENV_DOMAIN_MAIN}">>))
# 备域名
m4_define(<<ENV_DOMAIN_BACKUP>>, m4_esyscmd(<<printf "${ENV_DOMAIN_BACKUP}">>))

#-3 - alert level
#-2 - critical level
#-1 - error level
#1 - warning level
#2 (default) - notice level
#3 - info level
#4 - debug level
m4_define(<<ENV_LOG_LEVEL>>, m4_esyscmd(<<printf "${ENV_LOG_LEVEL:-3}">>))
m4_define(<<ENV_XLOG_LEVEL>>, m4_esyscmd(<<printf "${ENV_XLOG_LEVEL:-3}">>))

m4_divert(0)m4_dnl
