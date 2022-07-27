# conda命令

~~~shell
conda config --show-sources  # 查看所有镜像源
conda config --add channels url  # 添加镜像源
conda config --set show_channel_urls yes  # 安装whl包时，显示镜像源地址
~~~



~~~shell
conda create -n env_name python=3.8  # 创建环境
conda create -n env_name2 --clone env_name1  # 克隆环境
~~~

~~~shell
conda env list  # 显示当前所有环境
conda env remove -n env_name  # 删除环境
~~~

~~~shell
conda activate env_name # 激活环境
conda deactivate  # 失活环境
~~~

~~~shell
conda list  # 查看当前环境已安装的whl包
conda info  # 查看conda配置信息
~~~



