## 通过xml装入spring容器中

**User类** 

```java
private String name;
private List<String> books;
public void setName(String name) {
    this.name = name;
}
public void setBooks(List<String> books){
    this.books = books;
}
```

**User.xml ** 

```xml
<!--id是bean的唯一标识，class是类路径-->
<bean id="myUser" class="User">
    <property name="name" value="Demo"/>
    <property name="books">
        <list>
            <value>西游记</value>
            <value>水浒传</value>
            <value>三国演义</value>
            <value>红楼梦</value>
        </list>
    </property>
</bean>
```

**获取User类** 

```java
// 首先，获取resources根目录下的User.xml，然后，再获取bean的唯一标识符myUser下的属性值
new ClassPathXmlApplicationContext("User.xml").getBean("myUser", User.class)
```

## 通过注解装入spring容器中

~~~java
@Bean
public User getUser() {
    User user = new User();
    user.setName("Demo");
    List<String> books = new LinkedList<>();
    books.add("西游记");
    books.add("水浒传");
    books.add("三国演义");
    books.add("红楼梦");
    user.setBooks(books);
    return user;
}
~~~

获取UserConfig中的属性

~~~java
// 获得当前MyTest类中bean注解下getUser方法，并返回一个User对象。
new AnnotationConfigApplicationContext(MyTest.class).getBean("getUser")
~~~

## Spring与mybatis结合

**mybatis.xml** 

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



