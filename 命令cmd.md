## 常用命令 

~~~shell
msconfig   # 查看系统启动项。
sysdm.cpl  # 打开系统属性，查看系统变量。
ipconfig   # 查看网卡配置。
regedit    # 打开注册表。
dir        # 显示当前目录结构。
cls        # 清屏。
echo       # 回显。
echo off   # 关闭回显。
mkdir dir_name  # 创建目录。
exit       # 退出cmd.exe程序。
~~~

~~~shell
del *  # 删除当前目录下的所有文件，不包括子目录，无需确定
del /s *  # 删除当前目录下的所有文件，包括子目录下的文件，但每次删除需要确认
del /s *.json  # 删除当前目录下的所有json文件，包括子目录下的json文件，但每次删除需要确认

rd dir  # 删除空目录dir
rd /s dir  # 删除空或非空目录dir
rd /s /q dir  # # 删除空或非空目录dir，且无需确定。/s表示删除当前目录及其子目录，/q表示删除时无需确认。
~~~

