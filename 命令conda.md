# conda命令

~~~shell
conda create -n env_name python=3.8  # 创建环境
conda create -n env_name2 --clone env_name1  # 克隆环境
conda remove -n env_name --all  # 删除环境
conda activate env_name # 激活环境
conda deactivate  # 失活环境

conda env remove -n env_name  # 删除环境
conda env list  # 显示当前所有环境
~~~

~~~shell
conda config --show-sources  # 查看所有镜像源
conda config --get channels  # 查看所有镜像源，并显示优先级
conda config --show channels  # 查看所有镜像源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/  # 添加镜像源
conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/  # 删除镜像源
conda config --set show_channel_urls yes  # 安装whl包时，显示镜像源地址

conda install tensorflow=2.2 cudatoolkit=10.1 cudnn  # cudnn版本由前两个版本自动决定
conda install --file requirement.txt

conda info  # 查看conda配置信息
conda info -e  # 显示当前所有环境

conda list  # 查看当前环境下已安装的whl包
conda list -n yolov5-hat --export > requirements.txt  # 将当前环境下的依赖导入到requirements文件中
~~~

~~~shell
conda search numpy  # 查看可安装的包版本
~~~

~~~shell
pip install -i http://mirrors.aliyun.com/pypi/simple scipy==1.8 --trusted-host mirrors.aliyun.com
~~~

