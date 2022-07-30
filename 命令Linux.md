### LInux分类

~~~shell
一般来说，Linux系统分两大基本类：
RedHat系列：redhat、centos、fedora
Debian系列：debian、ubuntu

包管理工具为yum。
redhat系列的安装包格式为rpm，安装rpm包的命令为rpm -参数。

包管理工具为apt-get。
debian系列的安装包格式为deb，安装deb包的命令为dpkg -参数。
~~~

### 常用命令

~~~shell
ps -ef | grep tomcat  # 查看当前系统运行的进程。f为显示全格式。
ps -aux  # 查看当前所有进程
# ps(process status)显示当前进程信息。
# grep(global regular experssion print)全面正则表达式打印。它能够使用正则表达式搜索文本，并把匹配的行打印出来，是一种强大的文本搜索工具。

top  # 性能分析工具，能够实时的显示系统中各个进程资源的占用情况，类似于windows的任务管理器。
top -p 925  # 指定进程ID监控

lsof -i:8080  # (list open files)显示该端口进程。
netstat -tunple  # 用于显示各种网络相关信息。
netstat -tunl | grep 8080  # 查看端口号。
-t  # 显示TCP协议的进程
-u  # 显示UDP协议的进程
-n  # 显示监听的端口号
-p  # 显示程序ID和名称
-l  # 显示监听的进程

tar -zxvf filename.tar.gz  # 用于解压文件。gun zip
-z  # 解压具有gzip的属性。
-x  # 解压一个压缩文件的参数指令。
-v  # 显示压缩过程中的文件名。
-f  # 在f之后立即接档名。

nohup java -jar *.jar  # 用于将jar包永久挂在服务器上。
nohup python main.py  # 不挂断运行python脚本
# nohup(no hang up)用于在系统后台不挂断地运行命令，退出终端也不会影响程序的运行。

which name    # 查找系统PATH目录下的可执行文件。
whereis name  # 通过文件索引数据库而非PATH来查找，查找范围比which要广。
~~~




~~~shell
# 防火墙设置
systemctl start firewalld  # 启动firewalld服务进程。
systemctl restart firewalld
systemctl stop firewalld
# firewall是防火墙的名字，而firewalld是防火墙的服务进程名。d表示daemon的缩写，即幽灵进程，也叫守护进程。systemctl=>system control
firewall-cmd --state  # 查看防火墙状态。
firewall-cmd --reload  # 重新载入配置，比如添加规则之后，需要执行此命令。
firewall-cmd --get-zones  # 列出支持的zone。
firewall-cmd --zone=public --list-ports  # 查看已开放的端口。
firewall-cmd --add-port=80/tcp --permanent  # 永久添加80端口
firewall-cmd --remove-port=80/tcp --permanent  # 永久添加80端口
firewall-cmd --zone=public --list-ports  # 查看白名单列表
firewall-cmd --zone=public --add-port=80/tcp --permanent  # 添加白名单端口
firewall-cmd --zone=public --add-port=6000-7000/tcp --permanent
~~~



~~~shell
rm -r     # 只删除当前目录下的所有文件，且每次删除之前需确定。
rm -rf *  # r表示recurrence，f表示force，删除当前目录下的所有文件和子目录。

kill number process_name  # 杀死进程。
# number为1(HUP)，重新加载进程；
# 2(KILL)，杀死一个进程；
# 3(TERM)，正常停止一个进程。

df -hl  # 查看磁盘分区上的磁盘空间。
-a  # 包含全部的文件习题。
-h  # 以可读性较高的方式来显示信息。
-l  # 仅显示本地的文件系统。

wget(world wide web get)  # 是一个下载文件的工具。wget是在Linux下开发的开放源代码的软件。
yum(Yellow dog Updater Modified)  # 能够从指定的服务器中下载RPM（Redhat Package Manager）包并且安装。

curl,即(CommandLine Uniform Resource Locator)  # 利用URL语法在命令行下工作的文件传输工具
pwd(print working directory)   # 显示当前工作路径。
mkdir dir_name  # 在当前目录下创建文件夹
find *python*  # 查找当前目录下包含python关键字的文件
source ./etc/profile  # 使环境变量生效。

# 清空文件内容
vi file_name # 输入%d清除所有内容
~~~



~~~shell
chown user1:user1 filename  # 更改当前文件的用户为user1
chmod 777 filename  # 即change mode,对当前文件授权
# 修改权限
# 三个数字分别表示u(拥有者)、g(同组用户)、o(其他用户)的权限;
# 4(可读)+2(可写)=6(读写)110
# r表示递归子目录

ls  # 查看当前目录下的所有文件及子目录。
ll  # 即ls -lt，查看当前目录下的文件及目录的权限等信息。
ll filename  # 查看当前文件权限

su root  # 切换到root用户
sudo passwd root  # 修改root用户密码

reboot  # 重启
~~~



~~~shell
rpm -qa | grep firefox  # 查看当前系统已经安装的rpm软件包
rpm -e firefox  # 卸载rpm软件包
rpm -ivh firefox-45.4.0-1.e17.centos.x86_64.rpm
# -i=install 安装
# -v=verbose 提示
# -h=hash 进度条
~~~

