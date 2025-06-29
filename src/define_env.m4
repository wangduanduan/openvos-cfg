m4_divert(-1)

m4_define(<<my_listen_ip>>, m4_esyscmd(<<printf "${my_listen_ip:-127.0.0.1}">>))

m4_define(<<my_udp_tcp_port>>, m4_esyscmd(<<printf "${my_udp_tcp_port:-5060}">>))

#-3 - Alert level
#-2 - Critical level
#-1 - Error level
#1 - Warning level
#2 (default) - Notice level
#3 - Info level
#4 - Debug level
m4_define(<<my_log_level>>, m4_esyscmd(<<printf "${my_log_level:-3}">>))
m4_define(<<my_xlog_level>>, m4_esyscmd(<<printf "${my_xlog_level:-3}">>))

m4_divert(0)m4_dnl
