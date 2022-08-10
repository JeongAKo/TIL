GCD는 Multicore Process 를 위한 Thread Programming 의 방법

기존에 Thread Programming 을 하기 위해서는 

동기화도 관리를 해줘야 하고, deadlock 도 관리를 하는 등 스레드풀을 직접 관리해야하는 번거로움이 있지만

애플에서 따로 GCD를 통해 쓰레드를 OS에서 관리하고 분배하게 됩니다!!

따라서 Swift에서는 Thread 관련 작업은 Grand Central DIspatch API (우리는 이걸 줄여서 GCD 라고 합니다!) 를 통해 처리하게 됩니다.

어느 작업을 어느 Thread 가 할 것인지, Multi-Thread 로 할 것인지, 코어를 여러개 사용해서 처리할지, Async 로 처리할지 등등을 결정해주는 것이 바로 GCD 입니다 !







- 직접적으로 쓰레드를 관리하지 않고 **Queue 큐(대기행렬)** 라는 개념을 이용해 작업을 분산처리
- GCD / Operation을 사용해 **시스템에서 알아서 쓰레드 숫자를 관리**
- (오래걸리는) 작업들이 **"비동기적으로 동작"** 하도록 만들어줌

## GCD / Operation

<img width="1035" alt="스크린샷 2020-10-15 오후 6 05 55" src="https://user-images.githubusercontent.com/47776915/96102216-3a2fbd80-0f11-11eb-8d9b-969dceb1fe8e.png">

<img width="928" alt="스크린샷 2021-08-03 오전 11 20 55" src="https://user-images.githubusercontent.com/47776915/127947497-a68b4ec5-79a7-4029-b752-0fd158d79c18.png">

#### <Qeueu의 특성>

**Serial(직열)** - (보통 메인에서) 분산처리 시킨 작업을 "다른 **한개**의 쓰레드에서" 처리하는 큐

**Concurrent(동시)** - (보통 메인에서) 분산처리 시킨 작업을 "다른 **여러개**의 쓰레드에서" 처리하는 큐 

#### 큐의 종류

- ##### 메인큐

<img width="1060" alt="스크린샷 2021-08-03 오후 1 53 30" src="https://user-images.githubusercontent.com/47776915/127959800-5570cfd9-1e32-4d71-a640-bf807386b27e.png">

```swift
DispatchQueue.main.async {}
```

- ##### 글로벌큐

종류 여러개, 기본설정(Concurrent), QoS(6종류)

<img width="1045" alt="스크린샷 2021-08-03 오후 1 58 59" src="https://user-images.githubusercontent.com/47776915/127960219-91516130-6b7d-4e2c-9b5c-da7faaffeaa9.png">

<img width="1036" alt="스크린샷 2021-08-03 오후 2 01 09" src="https://user-images.githubusercontent.com/47776915/127960399-29893d80-3c48-4108-a50b-c3f06de07fd8.png">

- ##### 프라이빗(커스텀)

커스텀으로 만듦, 디폴트설정(Serial / Concurrent설정가능), Qos설정도 가능(OS가 추론)

<img width="1041" alt="스크린샷 2021-08-03 오후 2 09 45" src="https://user-images.githubusercontent.com/47776915/127961154-2cfcf798-1e71-470c-8aa8-58715ccba8e9.png">

```swift
let queue = DispatchQueue(label: "somthing.serial")
```

### 정리

<img width="978" alt="스크린샷 2021-08-03 오후 2 19 44" src="https://user-images.githubusercontent.com/47776915/127961951-7a9d9df4-8146-480e-8481-78467939a149.png"> 

# Operation

- ##### GCD와 Operation의 차이
  
  <img width="916" alt="스크린샷 2021-08-12 오전 11 05 13" src="https://user-images.githubusercontent.com/47776915/129127350-47ac9c7d-cd17-4b0f-9aa5-e574ed609e02.p ng">

프로젝트의 효율성, 사례적합성등을 고려해서 사용

<img width="1073" alt="스크린샷 2021-08-12 오후 3 45 39" src="https://user-images.githubusercontent.com/47776915/129150359-85fff940-3c47-4a14-821a-cd2d8a0189b4.png">

<img width="872" alt="스크린샷 2021-08-18 오후 3 21 56" src="https://user-images.githubusercontent.com/47776915/129847900-0b3f0857-cf5c-46a6-b23a-074b9f7e347b.png">

## Dispatch Group

```swift
let dispatchGroup = DispatchGroup()
let defaultQueue = DispatchQueue.global()

  DispatchQueue.global().async(group: self.group1) {
  // 동기적 함수
  }



  group1.notify(queue: DispatchQueue.main) { [weak self] in
    print("모든 작업이 완료되었습니다🍊")
  }



// 그룹 안에 비동기적인 작업 있다면 일이 끝나는 시점이 잘못 될 수 있다
// 그래서 아래같은 코드를 이용
dispatchGroup.enter()
dispatchGroup.leave()


gueue.async(group: dispatchGroup) {
    group1.enter()
    someAsyncMrthod {
      group1.leave()
    }
}

dispatchGroup.notify(queue: defaultQueue) { [weak self] in
   print("모든 작업이 완료되었습니다🍊")
}
```
