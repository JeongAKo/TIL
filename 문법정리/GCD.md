##  GCD / Operation

##### 1) 왜 동시성(Concurrent) 프로그래밍이 필요할까?

GCD(Grand Central  Dispath)

- 간단한일(커뮤니케이션의 양)
- 함수를 사용하는 작업(메서드 위주)

Operation

- 복잡한일(커뮤니케이션의 양)
- 데이터와 기능을 캡슐화한 객체
- 취소, 순서지정, 일시중지(상태추적)



Serial(직열) - (보통 메인에서) 분산처리 시킨 작업을 "다른 한개의 쓰레드에서" 처리하는 큐

Concurrent(동시) - (보통 메인에사) 분산처리 시킨 작업을 "다른 여러개의 쓰레드에서" 처리하는 큐 

 <img width="1035" alt="스크린샷 2020-10-15 오후 6 05 55" src="https://user-images.githubusercontent.com/47776915/96102216-3a2fbd80-0f11-11eb-8d9b-969dceb1fe8e.png">