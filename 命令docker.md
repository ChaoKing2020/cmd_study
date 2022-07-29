## 一、docker的安装与卸载

~~~shell
# 1、需要的安装包
yum install -y yum-utils
# 2、配置国内镜像地址
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# 3、更新yum软件包索引
yum makecache fast
# 4、安装社区版docker
yum install docker-ce docker-ce-cli containerd.io
# 5、启动docker
systemctl start docker
# 6、查看docker版本
docker version
# 7、下载镜像
docker pull mysql
# 8、运行镜像
docker run mysql
~~~

~~~shell
# 1、卸载依赖
yum remove docker-ce docker-ce-cli containerd.io
# 2、删除资源
rm -rf /var/lib/docker  # /var/lib/docker为docker的默认工作路径
~~~

## 二、阿里云加速

~~~shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://j6yjzbk6.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
~~~

## 三、底层工作原理

**Docker是怎么工作的？**

Docker是一个Client-Server结构的系统，Docker的守护进程运行在主机上，并通过Socket从客户端访问。

DockerServer接收到Docker-Client的指令，就会执行该指令。

## 四、镜像命令

~~~shell
docker --version               # 显示docker的版本信息
docker info					 # 显示docker的系统信息，包括镜像和容器的数量
docker command --help		 # 帮助命令
~~~

~~~shell
[root@localhost /]# docker images
-a # all，列出所有镜像
-q # quiet，只显示镜像的id
~~~

**搜索镜像** 

~~~shell
[root@localhost /]# docker search mysql
NAME                             DESCRIPTION                                     STARS   
mysql/mysql-server               Optimized MySQL Server Docker images. Create…   907     
centos/mysql-57-centos7          MySQL 5.7 SQL database server                   92
mysql/mysql-cluster              Experimental MySQL Cluster Docker images. Cr…   92
bitnami/mysql                    Bitnami MySQL Docker Image                      64       

docker search mysql --filter=STARS=3000  # 过滤STARS大于3000的镜像
~~~

**拉取镜像** 

~~~shell
docker pull mysql  # 如果不加tag，则默认下载latest版
docker pull imageName[:tag]  # tag指定版本号
~~~

**删除镜像** 

~~~shell
docker rmi -f imageID # 通过镜像名或镜像id删除
docker rmi -f $(docker iamges -aq)
~~~

## 五、容器命令

~~~shell
docker ps  # 列出当前正在运行的所有容器
-a    # 列出当前正在运行的所有容器+历史运行过的容器
-n=?  # 显示最近创建的容器
-q    # 只显示容器的编号

docker rm 容器id  # 删除容器
~~~

**启动和停止容器** 

~~~shell
docker start 容器id	 # 启动容器
docker restart 容器id	 # 重启容器
docker stop 容器id	 # 停止当前正在运行的容器
docker kill 容器id	 # 强制停止当前的容器
~~~

**安装nginx** 

~~~shell
docker run -d -p 3344:80 nginx --name nginx01
# -d 后台运行
# --name 容器命名
# -p 宿主机端口：容器内端口
docker exec -it nginx01 /bin/bash
~~~

**安装tomcat**           

~~~shell
docker run -d -p 3345:8080 tomcat:9.0 --name tomcat01
docker exec -it tomcat01 /bin/bash
~~~

## 六、安装portainer

portainer是Docker的图形界面管理工具，并提供了一个后台面板供我们操作。

~~~shell
docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer
~~~

![](D:\学习天地\学习笔记\docker.assets\QQ截图20220303222240.png)

## 七、容器数据卷

这是一个容器之间的数据共享技术。在Docker容器中产生的数据同步到本地。（如果不这么做，那么我们把容器删除，数据就会丢失。）

~~~shell
docker run -it -v /home/ceshi:/home centos /bin/bash
docker inspect b4138bb71efe  # 查看容器的详细信息
~~~

![](D:\学习天地\学习笔记\docker.assets\QQ截图20220304104527.png)

**MySQL的数据持久化**

~~~shell
docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql
-d  # 后台运行
-p  # 端口映射
-v  # 卷挂载
-e  # 环境配置
--name  # 容器名字
~~~

