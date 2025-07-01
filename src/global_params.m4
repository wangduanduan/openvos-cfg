#debug_mode=yes
log_level=my_log_level
xlog_level=my_xlog_level
stderror_enabled=yes
syslog_enabled=yes
syslog_facility=LOG_LOCAL0
syslog_name="openvos-init my_version"
log_prefix = "my_version"

m4_ifelse(my_domain_main,,,
alias=udp:my_domain_main
alias=tcp:my_domain_main
)

m4_ifelse(my_domain_backup,,,
alias=udp:my_domain_backup
alias=tcp:my_domain_backup
)


disable_stateless_fwd=yes

event_pkg_threshold=90
event_shm_threshold=90
exec_dns_threshold = 60000
exec_msg_threshold = 60000


tcp_keepalive = 1
tcp_keepcount = 5


udp_workers=4

user_agent_header="User-Agent: OpenVOS my_version"
server_header="Server: OpenVOS my_version"
server_signature=no

socket=udp:my_listen_ip:my_udp_tcp_port
socket=tcp:my_listen_ip:my_udp_tcp_port
