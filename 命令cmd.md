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
del /s *.png  # 删除当前目录及其子目录下的所有png文件。/s表示删除当前目录及其子目录所有指定的文件类型。
mkdir dir_name  # 创建目录。
exit       # 退出cmd.exe程序。
~~~

~~~shell
del /s *.json  # 删除当前目录下以json为后缀的所有文件。

rd /s /q Catalina  # rd，即remove directory，专门用于删除子目录及其文件的命令。删除当前目录下的Catalina及其子目录下的所有内容。/s表示删除当前目录及其子目录，/q表示删除时无需确认。无法删除文件。
~~~

