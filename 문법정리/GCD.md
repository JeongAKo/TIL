- 직접적으로 쓰레드를 관리하지 않고 **Queue 큐(대기행렬)** 라는 개념을 이용해 작업을 분산처리
- GCD / Operation을 사용해 **시스템에서 알아서 쓰레드 숫자를 관리**
- (오래걸리는) 작업들이 **"비동기적으로 동작"** 하도록 만들어줌





##  GCD / Operation

<img width="1035" alt="스크린샷 2020-10-15 오후 6 05 55" src="https://user-images.githubusercontent.com/47776915/96102216-3a2fbd80-0f11-11eb-8d9b-969dceb1fe8e.png">



<img width="928" alt="스크린샷 2021-08-03 오전 11 20 55" src="https://user-images.githubusercontent.com/47776915/127947497-a68b4ec5-79a7-4029-b752-0fd158d79c18.png">

#### <Qeueu의 특성>

**Serial(직열)** - (보통 메인에서) 분산처리 시킨 작업을 "다른 **한개**의 쓰레드에서" 처리하는 큐

**Concurrent(동시)** - (보통 메인에서) 분산처리 시킨 작업을 "다른 **여러개**의 쓰레드에서" 처리하는 큐 



#### 큐의 종류

- ##### 메인큐

<img width="1060" alt="스크린샷 2021-08-03 오후 1 53 30" src="https://user-images.githubusercontent.com/47776915/127959800-5570cfd9-1e32-4d71-a640-bf807386b27e.png">

~~~swift
DispatchQueue.main.async {}
~~~





- ##### 글로벌큐

종류 여러개, 기본설정(Concurrent), QoS(6종류)

<img width="1045" alt="스크린샷 2021-08-03 오후 1 58 59" src="https://user-images.githubusercontent.com/47776915/127960219-91516130-6b7d-4e2c-9b5c-da7faaffeaa9.png">



<img width="1036" alt="스크린샷 2021-08-03 오후 2 01 09" src="https://user-images.githubusercontent.com/47776915/127960399-29893d80-3c48-4108-a50b-c3f06de07fd8.png">



- ##### 프라이빗(커스텀)

커스텀으로 만듦, 디폴트설정(Serial / Concurrent설정가능), Qos설정도 가능(OS가 추론)

<img width="1041" alt="스크린샷 2021-08-03 오후 2 09 45" src="https://user-images.githubusercontent.com/47776915/127961154-2cfcf798-1e71-470c-8aa8-58715ccba8e9.png">

~~~swift
let queue = DispatchQueue(label: "somthing.serial")
~~~





### 정리

<img width="978" alt="스크린샷 2021-08-03 오후 2 19 44" src="https://user-images.githubusercontent.com/47776915/127961951-7a9d9df4-8146-480e-8481-78467939a149.png"> 







 

   