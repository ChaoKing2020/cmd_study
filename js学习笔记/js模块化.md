~~~javascript
test1.js

function fn1() {
    console.log('i am fn1')
    fn2()
}

export function fn2() {
    console.log('i am fn2')
}

export default fn1
~~~

~~~javascript
test2.js

import fn1 from './test1.js'
import {fn2} from './test1.js'

fn1()
fn2()
~~~

~~~tex
 export 与 export default 直接的区别
 1、在一个文件中，export可以有多个，export default仅有一个；
 2、export 导出的文件，在导入时，必须加上{}；export default 则不需要；
 3、export default导出时，导入的函数或变量可以另取别名；export 则不行。
~~~

