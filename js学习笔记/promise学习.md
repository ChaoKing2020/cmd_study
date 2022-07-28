~~~javascript
// new Promise((resolve, reject) => {
//     let a = 1, b = 2
//     return resolve(a + b)//没有定义a的值，会直接调用catch，输出err
// }).then(data => {
//     console.log("promise a + b = ", data)
// }).catch(err => {
//     console.log("promise err value :", err)
// })

function promiseClick() {
    return new Promise((resolve, reject) => {
        let num = Math.random()
        if (num <= 0.5) {
            resolve(num)
        }
        else {
            reject('数字大于0.5，即将执行失败回调')
        }
    })
}

promiseClick().then(
    data => {
        console.log('resolve回调成功！返回结果为：', data)
    },
    reason => {
        console.log('reject回调失败！返回失败原因：', reason)
    }
)
~~~

~~~tex
Promise构造函数只有一个参数，它是一个函数。这个函数在构造之后会直接被异步执行，所以，我们称之为起始函数。起始函数包含两个参数，分别是resolve和reject。Promise对象有三种状态，分别是等待(pending)、已完成(fulfilled)、已拒绝(rejected)。一个Promise对象的状态只可能从“等待”到“完成”或从“等待”到“拒绝”，不能逆向转换。一个Promise对象只能改变一次，且只能接受一个参数，并且是一个函数。
~~~

