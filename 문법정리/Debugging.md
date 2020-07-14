# Debugging



##### Logger

~~~swift
import Foundation

public func logger(
    _ contents: Any..., // ... 뒤에 몇개가 들어와도 상관없다는 키워드
    header: String = "", // Any... 뒤 파라미터가 외부 파라미터가 하나 와서 ... 과 구별해주어야 한다.
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
    ) {
    
    let emoji = "👨‍💻"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    
    
    
    
    let fileUrl = URL(fileURLWithPath: file)
    
    // deletingPathExtension 확장자 지우기
    // lastPathComponent 경로의 마지막 파일 이름
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    
    let header = header.isEmpty ? "" : "[ \(header) ] - "
    let contents = contents.reduce("") { $0 + " " + String(describing: $1) }
    
    let str = """
    \(emoji) \(timestamp) \
    \(fileName) / \(function) / (\(line)) \
    \(emoji) \(header)\(contents)
    """
    
    //print("\(file) / \(function) / (\(line)) \(header)\(contents)")
    print(str)
}

~~~





#### 디버깅 명령어

1. Explore variables values: `expression`, `e`, `print`, `po`, `p`
2. Get overall app’s state + language specific commands: `bugreport`, `frame`, `language`
3. Control app’s execution flow: `process`, `breakpoint`, `thread`, `watchpoint`
4. Honorable mentions: `command`, `platform`, `gui`





LLDB는 소프트웨어 디버깅 도구이다. LLDB(Low Level Debugger) 디버깅 명령어를 사용해 변수값을 보거나, 프로그램을 수정할 수도 있다.

**po(p): print object**, 현재 메모리 상태에 있는 것을 프린트 해준다. p로 사용해도 된다.

~~~swift
 po가 출력하는 description은 NSObject의 debugDescription입니다.

 따라서, 아래와 같이 debugDescription를 override 한다면,

  override var debugDescription: String {
    return "이 객체의 debugDescription은 \(super.debugDescription) 입니다."
  }
~~~



**help** 해당 문법으로 사용가능한 Subcommand, Option 리스트나 사용법을 보여주는 유용한 명령어입니다.

~~~lldb
LLDB 명령어는 다음과 같은 문법으로 이루어져있습니다.

(lldb) command [subcommand] -option "this is argument"
~~~



Objective-C Code네에서 Break한 경우에는 Swift를 사용하지 않는 context이고, Swift Code내에서 Break한 경우에는 반대



`(lldb) expression` Command는 Runtime에 여러 정보를 출력할 수 있을 뿐아니라 값을 변경 해줄 수도 있습니다.

LLDB는 내부적으로 값이 출력될때마다 local variable을 *$R~*의 형태로 만들어 저장합니다. 이 값들은 해당 break context가 벗어나도 사용 가능한 값들이고, 심지어 수정해서 사용할 수도 있습니다.





https://medium.com/flawless-app-stories/debugging-swift-code-with-lldb-b30c5cf2fd49