~~~javascript
function fn(state) {
    return new Promise((reslove, reject) => {
        console.log('我从异步函数中收到的参数为：', state)
        if (state == 'success')
            reslove('状态码为：' + state)
        else
            reject('状态码为：' + state)
    })
}

// 等价于fn = () => {}
(async () => {
    let state = 'fail'
    await fn(state).then(res => {
        console.log('我收到来自reslove函数中的参数为', res)
    }, err => {
        console.log('我收到来自reject函数中的参数为', err)
    })
})();


(() => {console.log('hello world!')})()


let fn2 = () => {console.log('hello world!')}
let fn3 = () => {console.log('hello world!')}
fn2()
fn3()
~~~

