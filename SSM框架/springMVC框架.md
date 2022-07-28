## web.xml配置文件 

```xml
<servlet>
    <!--servlet名称-->
    <servlet-name>springmvc</servlet-name>
    <!--使用此servlet的限定类-->
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
        <!--初始化DispatcherServlet中的属性-->
        <param-name>contextConfigLocation</param-name>
        <!--spring配置xml文件-->
        <param-value>classpath:springmvc-servlet.xml</param-value>
    </init-param>
</servlet>

<servlet-mapping>
    <!--目录下的所有文件映射到当前的servlet-->
    <servlet-name>springmvc</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>

<!--前端传数据过滤给后端-->
<filter>
    <filter-name>characterEncodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
        <param-name>encoding</param-name>
        <param-value>utf-8</param-value>
    </init-param>
</filter>
<filter-mapping>
    <filter-name>characterEncodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

## springmvc-servlet.xml配置文件 

~~~xml
<!--注解驱动。HandlerMapping,将requestmapping注册到映射表中；
HandlerAdapter，处理请求的适配器，决定调用哪个controller方法。-->
<mvc:annotation-driven/>
    <!--过滤JSON乱码问题-->
    <mvc:message-converters>
        <bean class="org.springframework.http.converter.StringHttpMessageConverter">
            <!--为构造函数的第一个参数赋值-->
            <constructor-arg value="UTF-8"/>
        </bean>
        <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
            <property name="objectMapper">
                <bean class="org.springframework.http.converter.json.Jackson2ObjectMapperFactoryBean">
                    <property name="failOnEmptyBeans" value="false"/>
                </bean>
            </property>
        </bean>
    </mvc:message-converters>
</mvc:annotation-driven>

<!--自动扫描controller下的类-->
<context:component-scan base-package="com.ck.controller"/> 

<!--静态资源过滤-->
<mvc:default-servlet-handler/>

<!--视图解析器-->
<bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <!--页面存放目录-->
    <property name="prefix" value="/WEB-INF/jsp/"/>
    <!--匹配页面后缀-->
    <property name="suffix" value=".jsp"/>
</bean>

<!--id为URL访问地址：http://localhost:8080/hello-->
<bean id="/hello" class="com.ck.controller.HelloController"/>

<!--拦截器-->
<!--
‘/’：  web项目的根目录；
‘/*’： 所有文件夹且不含子文件夹；
‘/**’：所有文件夹且包括子文件夹。
-->
<mvc:interceptors>
    <mvc:interceptor>
        <!--拦截器的路径选择。-->
        <mvc:mapping path="/**"/>
        <!--拦截器的限定类-->
        <bean class="com.ck.config.LoginInterceptor"/>
    </mvc:interceptor>
</mvc:interceptors>

<!--文件上传-->
<bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    <!--上传编码-->
    <property name="defaultEncoding" value="UTF-8"/>
    <!--阈值，低于此值，只保留在内存里，反之，生成硬盘上的临时文件。-->
    <property name="maxInMemorySize" value="10485760"/>
    <!--允许上传最大文件大小-->
    <property name="maxUploadSize" value="40960"/>
</bean>
~~~

