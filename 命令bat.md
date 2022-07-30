## 常用命令 

#### cmd文件与bat文件的区别

1、cmd文件运行在32位系统的命令窗口，是Windows NT的命令脚本；

2、bat是DOS命令，可在任何DOS环境下使用，是ms dos批处理文件。

~~~shell
msconfig   # 查看系统启动项
sysdm.cpl  # 打开系统属性，查看系统变量
ipconfig   # 查看网卡配置
regedit    # 打开注册表
~~~

~~~shell
del *  # 删除当前目录下的所有文件，不包括子目录，无需确定
del /s *  # 删除当前目录下的所有文件，包括子目录下的文件，但每次删除需要确认
del /s *.json  # 删除当前目录下的所有json文件，包括子目录下的json文件，但每次删除需要确认

rd dir  # 删除空目录dir
rd /s dir  # 删除空或非空目录dir
rd /s /q dir  # # 删除空或非空目录dir，且无需确定。/s表示删除当前目录及其子目录，/q表示删除时无需确认。
~~~



~~~bash
rem 'comment'  # 加上注解，内容不被执行，但能回显
:: 'comment'  # 加上注解，内容不被执行，不能回显

@echo off  # 关闭自身命令的回显

dir        # 显示当前目录结构。
mkdir dir_name  # 创建目录。

echo hello > test.txt  # 覆盖
echo hello >> test.txt  # 追加

echo hello & echo world  # '&'将两条命令放到一起执行
echo hello && dir e: && echo world  # '&&'将两条命令放到一起执行,如果某一条命令执行失败，则不会执行后面的命令

echo hello || echo world  # 当执行第一条命令失败后才会执行后面的命令，直到有一条命令执行成功才会退出

echo,hello <==> echo hello  # ',' 相当于空格
~~~

~~~bash
# 为var赋值
@echo off
set var=我是值
echo %var%
pause

# 可在cmd窗口输入var变量的值，var右边为提示语
@echo off
set /p var=请输入变量的值
echo %var%
pause
~~~

