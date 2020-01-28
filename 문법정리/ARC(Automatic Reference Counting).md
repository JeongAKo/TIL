### ARC(Automatic Reference Counting)

RC 자동 관리 방식 (WWDC 2011 발표)
컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입
GC 처럼 런타임이 아닌 컴파일 단에서 처리 (Heap에 대한 스캔 불필요/ 앱 일시 정지 현상 없음)메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함

ARC 는 클래스의 인스턴스에만 적용 (Class - Reference 타입 , Struct / Enum - Value 타입) 활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않음 참조 타입

 -강한 참조 (Strong) : 기본값 참조될 때마다 참조 카운트 1 증가 

 -약한 참조 (Weak), 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않음 

강한 순환 참조 (Strong Reference Cycles)에 대한 주의 필요

