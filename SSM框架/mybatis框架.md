## mybatis配置文件 

~~~xml
<settings>
    <!--显式开启全局缓存-->
    <setting name="cacheEnabled" value="true"/>
    <!--日志设置-->
    <!--<setting name="logImpl" value="STDOUT_LOGGING"/>-->
    <setting name="logImpl" value="LOG4J"/>
</settings>

<typeAliases>
    <typeAlias type="com.ck.entity.User" alias="user"/>
</typeAliases>

<environments default="development">
    <environment id="development">
        <!--mybatis默认事务管理器为JDBC，连接池为POOLED-->
        <transactionManager type="JDBC"/>
        <dataSource type="POOLED">
            <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
            <property name="url" value="jdbc:mysql://localhost:3306/mydb?useSSL=true&useUnicode=true&characterEncoding=UTF-8"/>
            <property name="username" value="root"/>
            <property name="password" value="123456"/>
        </dataSource>
    </environment>
</environments>

<mappers>
    <mapper resource="mapper/UserMapper.xml"/>
</mappers>
~~~

