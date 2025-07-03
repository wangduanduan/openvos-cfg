#debug_mode=yes
log_level=ENV_LOG_LEVEL
xlog_level=ENV_XLOG_LEVEL
stderror_enabled=yes
syslog_enabled=yes
syslog_facility=LOG_LOCAL0
syslog_name="openvos-init ENV_VERSION"
log_prefix = "ENV_VERSION"

m4_ifelse(ENV_DOMAIN_MAIN,,,
alias=udp:ENV_DOMAIN_MAIN
alias=tcp:ENV_DOMAIN_MAIN
)

m4_ifelse(my_domain_backup,,,
alias=udp:ENV_DOMAIN_BACKUP
alias=tcp:ENV_DOMAIN_BACKUP
)


disable_stateless_fwd=yes

event_pkg_threshold=90
event_shm_threshold=90
exec_dns_threshold = 60000
exec_msg_threshold = 60000


tcp_keepalive = 1
tcp_keepcount = 5


udp_workers=4

user_agent_header="User-Agent: OpenVOS ENV_VERSION"
server_header="Server: OpenVOS ENV_VERSION"
server_signature=no

socket=udp:ENV_LISTEN_IP:ENV_UDP_TCP_PORT
socket=tcp:ENV_LISTEN_IP:ENV_UDP_TCP_PORT
