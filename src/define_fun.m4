m4_divert(-1)
m4_define(<<X_INFO>>,<<xlog("L_INFO", "X_LOG_PREFIX $*")>>)
m4_define(<<X_ERR>>,<<xlog("L_ERR", "X_LOG_PREFIX $*")>>)
m4_define(<<X_WARN>>,<<xlog("L_WARN", "X_LOG_PREFIX $*")>>)
m4_define(<<X_NOTICE>>,<<xlog("L_NOTICE", "X_LOG_PREFIX $*")>>)
m4_divert(0)m4_dnl
