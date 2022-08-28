### CSS(Cascading Study Sheets)，即层叠样式表。

有三种表现形式。

~~~css
1、内联CSS样式
<div style="color:red"></div>
2、行内CSS样式
<style>
	body{font-size:14px}
</style>
3、外部CSS样式
<link type="text/css" rel="stylesheet" href="css/main.css">
~~~

### JS函数表现形式

~~~javascript
1、一般形式(函数声明)
function fn(num){}
2、函数表达式(匿名函数)
var fn = function() {}
3、匿名函数
function() {}
~~~

举例

~~~javascript
var Rectangle= function(width, height) {    
    this.width = width
    this.height = height
    this.getArea = function() 
    {        
        return this.width * this.height   
    }
}
等价于
function Rectangle(width, height) 
{    
    this.width = width
    this.height = height
    this.getArea = function() {    
        return this.width * this.height 
    }
}
~~~

