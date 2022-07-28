## 常用命令 

1. **'='** 用于不含正则表达式的url前，要求请求字符串与url严格匹配。如果匹配成功，就停止继续向下搜索，并立即处理该请求。

1. **'~'** 表示url中的正则表达式，区分大小写。
2. **'~*'** 表示url中的正则表达式，不区分大小写。
3. **'^~'** 用于不含正则表达式的url前，要求nginx服务器找到标识url和请求字符串匹配度最高的location后，立即使用此location处理请求，而不再使用location块中的正则url和请求字符串做匹配。

Events，影响nginx服务器与用户之间的网络连接
worker_connections，支持最大连接数

~~~shell
./nginx -v  # 查看nginx版本号
./nginx     # 启动nginx
./nginx -s stop    # 停止nginx
./nginx -s reload  # 重新启动nginx
ps -ef|grep nginx  # 查询nginx主进程
~~~



