### Linux分类

~~~shell
一般来说，Linux系统分两大基本类：
RedHat系列：redhat、centos(适合做服务器)
Debian系列：debian、ubuntu(适合做可视化界面)

包管理工具为yum。
redhat系列的安装包格式为rpm，安装rpm包的命令为rpm -参数。

包管理工具为apt-get。
debian系列的安装包格式为deb，安装deb包的命令为dpkg -参数。
~~~

### 常用命令

~~~shell
#! /bin/sh
# '#!'之后的解释程序，需要写其绝对路径。
# coding:utf-8
# 说明文件编码方式
~~~



~~~shell
ps -ef | grep tomcat  # 查看当前系统运行的进程。f为format，显示全格式。
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

# 清空文件内容
vi file_name # 输入%d清除所有内容
~~~

#### 防火墙设置


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
rm *  # 删除当前目录下的所有文件
rm -r     # 删除目录及其子目录下的所有文件
rm -rf *  # r表示recurrence，f表示force，删除目录及其子目录下的所有文件，无需确定是否删除
# -r 表示递归删除子目录及文件
# -f 表示无需确定是否删除

kill number process_name  # 杀死进程。
# number为1(HUP)，重新加载进程；
# 2(KILL)，杀死一个进程；
# 3(TERM)，正常停止一个进程。

df -hl  # 查看磁盘分区上的磁盘空间。
# -a  包含全部的文件习题。
# -h  以可读性较高的方式来显示信息。
# -l  仅显示本地的文件系统。


curl,即(CommandLine Uniform Resource Locator)  # 利用URL语法在命令行下工作的文件传输工具
pwd(print working directory)   # 显示当前工作路径。

mkdir dir_name  # 在当前目录下创建文件夹
touch file_name  # 创建新文件

find *python*  # 查找当前目录下包含python关键字的文件
find / -name 'read*'   # 在/目录下查找read开头的文件或目录
# -name:文件名或目录名
# -type:查找类型，如-d表示查找目录
~~~



~~~shell
chown user_name:group_name file_name  # 更改当前文件的用户为user_name,组为group_name
chmod 777 filename  # 即change mode,对当前文件授权
chmod u+x hello.sh  # 给用户添加可执行权限
chmod +x hello.sh  # 给当前用户、同组用户、其他用户添加可执行权限
# 修改权限
# 三个数字分别表示u(拥有者)、g(同组用户)、o(其他用户)的权限;
# 4(可读)+2(可写)=6(读写)110
# r表示递归子目录

ls  # 查看当前目录下的所有文件及子目录。
ll  # 即ls -lt，查看当前目录下的文件及目录的权限等信息。
ll filename  # 查看当前文件权限

su root  # 切换到root用户
su passwd root  # 修改root用户密码

reboot  # 重启
~~~



~~~shell
yum(Yellow dog Updater Modified)  # 能够从指定的服务器中下载RPM（Redhat Package Manager）包并且安装。
wget(world wide web get)  # 是一个下载文件的工具。wget是在Linux下开发的开源软件。

rpm -qa | grep firefox  # 查看当前系统已经安装的rpm软件包
rpm -e firefox  # 卸载rpm软件包
rpm -ivh firefox-45.4.0-1.e17.centos.x86_64.rpm
# -i=install 安装
# -v=verbose 提示
# -h=hash 进度条

apt-get install package_name  # 安装软件包
apt-get remove package_name  # 删除软件包
~~~

#### shell脚本的执行方式

~~~shell
1、输入脚本的绝对路径或相对路径
例如,/root/hello.sh 或 ./hello.sh
注意：使用绝对或相对路径需要可执行权限
2、bash或sh+脚本
例如，sh hello.sh
3、在脚本前加source或'.'
例如，source hello.sh等价于 . hello.sh
~~~

#### 数组声明

~~~shell
sports=("篮球" "足球" "排球" "羽毛球")
echo ${sports[0]}  # 输出数组第一个值
echo ${sports[@]}  # 输出数组全部内容
echo ${#sports[@]}  # 输出数组长度
~~~

#### $符号

~~~shell
$#  # 参数个数
$0  # 文件名
$1  # 第一个参数
$2	# 第二个参数
$@  # 所有参数
$?  # 上一指令的返回值，成功返回True，失败返回False
~~~

