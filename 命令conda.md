# conda命令

~~~shell
conda create -n env_name python=3.8  # 创建环境
conda create -n env_name2 --clone env_name1  # 克隆环境
conda activate env_name # 激活环境
conda deactivate  # 失活环境
conda remove -n env_name --all  # 删除环境
~~~

~~~shell
conda config --show-sources  # 查看所有镜像源
conda config --add channels url  # 添加镜像源
conda config --set show_channel_urls yes  # 安装whl包时，显示镜像源地址

conda install tensorflow=2.2 cudatoolkit=10.1 cudnn  # cudnn版本由前两个版本自动决定
conda install --file requirement.txt

conda info  # 查看conda配置信息
conda info -e  # 显示当前所有环境
~~~

~~~shell
conda search numpy  # 查看可安装的包版本
conda list  # 查看当前环境下已安装的whl包
~~~



