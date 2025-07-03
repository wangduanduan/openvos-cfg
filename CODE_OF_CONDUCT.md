# 脚本规范

1. m4 宏必须是m4_ 开头

```sh
m4_include(<<src/modules.m4>>)m4_dnl
```

2. m4 宏使用引号 <<>>

```sh
m4_define(<<E_LOOPED_CODE>>,<<483>>)
```

3. 自定义环境变量需要 ENV_ 开头, 并且需要全部大写

```
m4_define(<<ENV_LISTEN_IP>>, m4_esyscmd(<<printf "${ENV_LISTEN_IP:-127.0.0.1}">>))
```

4. 日志打印用X_INFO, X_ERR, X_WARN, X_NOTICE 宏

> 注意宏调用时, 不要用 "" 引起来

```
# ok
X_INFO(heelo word $sdp);

# error
X_INFO("heelo word $sdp");
```

5. send_reply必须要使用在define_status中的宏

```
send_reply(E_LOOPED_CODE,"E_LOOPED_DESC");
```

6. 所有自定义路由必须以r_开头，并且必须小写, 且需要放到src的单独文件中

```sh
route[r_hello_world] {

}
```
