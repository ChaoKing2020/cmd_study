~~~shell
pro：总的项目文件夹
	-pro
		-init.py：声明当前的pro文件夹为一个模块 from pro import settings
		-settings.py：项目的配置文件
		-urls.py：总的路由声明
		-wsgi.py：wsgi服务器的配置文件，类似于apache、nginx
	-manage.py：创建好的项目进行交互的一个命令性管理工具

开启项目：
	进入到项目当前路径 python manage.py runserver 开启一个测试服务器。
	该服务器压力负载很小，并发量为500左右。

settings：
	DATABASES：
		-'ENGINE': 'django.db.backends.mysql'
		-'USER': 用户名
		-'PASSWORD': 密码
		-'HOST': 数据库主机地址
		-'PORT': 数据库访问端口

admin：
	Django项目提供给你的一个后台数据库管理界面

数据库生成命令：
	makemigrations: 执行检查数据库差异，生成迁移文件
	migrate: 根据迁移文件生成对应的SQL语句
	django：默认自带一些数据库内容
	python manage.py migrate

创建管理界面的超级用户：
	python manage.py createsuperuser

时区和语言设置：
	LANGUAGE_CODE = 'zh-Hans'
	TIME_ZONE = 'Asia/Shanghai'

创建APP:
	目录会多一个与app同名的目录
	-blog：APP文件名
		-_init_.py：声明当前文件夹可以是一个模块
		-admin.py 
		-models.py：使用到的数据库
		-test.py：实现某些测试驱动
		-views.py：实现对应功能的函数，访问试图函数

视图函数：
	HttpResponse: 该函数返回一个html字符串给用户
	配置路由
		-总路由找到APP
		-APP路由找到视图函数
	url:路由映射关系的函数，正则来表示你的路由链接

返回HTML页面给用户：
	1、创建一个templates文目录保存html页面。
	2、在settings中：
		TEMPLATES
		'DIRS': [os.path.join(BASE_DIR, 'templates')]
	3、通过render函数，返回一个html页面给用户。

HTML页面动态生成内容：
	HTML写模板变量，{{today}}。
	render函数返回一个模板变量的字典，key是变量名字，value是内容。

HTML：模板页面
图片、音频等静态资源

静态资源路径的配置：
	STATIC_PATH = os.path.join(os.path.join(BASE_DIR, 'static'))
	STATICFILES_DIRS = (
    	STATIC_PATH,
	)

HTML页面显示静态资源：
	在HTML页面使用静态资源前：
		{% load staticfiles %} 指明当前模板页面加载静态资源路径
		资源路径的写法：{% static path %}
~~~



