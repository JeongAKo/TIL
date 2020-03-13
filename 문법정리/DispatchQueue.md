## DispatchQueue



##### 동기(sync) VS 비동기(async)

 ~~~swift

// 큐로 보낼꺼야, 큐의 종류, 비동기적으로
  DispatchQueue.global().async {

   }


// 큐로 보낼꺼야, 큐의 종류, 동기적으로
   DispatchQueue.main.async {

   }

 ~~~

 

작업(Task)을 대기행렬(Queue)에 보내기만 하면된다



DispatchQueue에는 크게 Serial 과 Concurrent 두 종류가 있고, FIFO(First In First Out) 순서로 처리합니다.

Serial은 이전 작업이 끝나면 다음 작업을 순차적으로 실행하는 직렬형태의 Queue이고, Concurrent는 병렬형태로 실행되는 Queue 입니다.



그리고 이것은 동기(Sync), 비동기(Async) 방식 중 어떻게 실행하느냐에 따라 다음 처럼 4가지 조합이 나올 수 있습니다.

- Serial - Sync
- Serial - Async
- Concurrent - Sync
- Concurrent - Async



~~~swift
 DispatchQueue.main.async {
        self.tableView.reloadData()
 }
~~~



![스크린샷 2020-02-21 오후 8 25 39](https://user-images.githubusercontent.com/47776915/75030915-7fb5fb00-54e8-11ea-878a-6c87647e981a.png)



## GCD