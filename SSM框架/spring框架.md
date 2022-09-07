## 注入spring容器的两种方法

#### 法一：xml方法

**User.java**

```java
public class User {
    private String name;
    private List<String> books;

    public User() {
    }

    public User(String name, List<String> books) {
        this.name = name;
        this.books = books;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", books=" + books +
                '}';
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBooks(List<String> books) {
        this.books = books;
    }

}
```

bean标签的id为唯一标识符，class为注入的实体类。通过实体类中的setName方法进行属性注入。

**User.xml ** 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       https://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="user" class="com.ck.entity.User">
        <property name="name" value="Demo"/>
        <property name="books">
            <list>
                <value>红楼梦</value>
                <value>三国演义</value>
            </list>
        </property>
    </bean>

</beans>
```

Application.java，首先通过ClassPathXmlApplicationContext对象获取resouces根目录下实体类user的xml文件，然后调用该对象的getBean方法，其中第一个参数为xml文件中bean标签所指定的id，第二个参数为实体类的类路径。

```java
public static void main(String[] args) {
    ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
    System.out.println(context.getBean("user", User.class));
}
```

#### 法二：注解

Database.java

~~~java
public class Database {
    private String driver;
    private String url;
    private String username;
    private String password;

    public Database() {
    }

    public Database(String driver, String url, String username, String password) {
        this.driver = driver;
        this.url = url;
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return "MyDatabase{" +
                "driver='" + driver + '\'' +
                ", url='" + url + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

}
~~~

Config.java，通过bean注解将该方法托管给spring。

~~~java
public class Config {
    @Bean
    public Database getDatabase() {
        String drive = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/my_db";
        String userName = "root";
        String pwd = "123456";
        return new Database(drive, url, userName, pwd);
    }
}
~~~

Application.java，通过AnnotationConfig上下文获取由spring管理的方法，并得到其返回值。

~~~java
public static void main(String[] args) {
    AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
    System.out.println(context.getBean("getDatabase", Database.class));
}
~~~

## Spring与mybatis结合

mybatis.xml

~~~xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

<!--第一步，连接数据库-->
<bean id="dataSource" class="com.mysql.cj.jdbc.MysqlDataSource">
    <property name="url" value="jdbc:mysql://localhost:3306/ssm"/>
    <property name="user" value="root"/>
    <property name="password" value="123456"/>
</bean>
<!--第二步，生成sqlSessionFactory工厂类-->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"/>
    <property name="mapperLocations" value="classpath:mapper/book.xml"/>
</bean>
<!--第三步，生成sqlSessionTemplate模板-->
<bean id="selSession" class="org.mybatis.spring.SqlSessionTemplate">
    <constructor-arg index="0" ref="sqlSessionFactory"/>
</bean>

</beans>
~~~



