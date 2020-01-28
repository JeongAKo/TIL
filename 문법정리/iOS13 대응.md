# iOS 13 대응

SceneDelegate가 생기면서 기존 Appdelegate에 있던 기능이 옮겨 갔는데 여기서 문제는

iOS13버전 아래로 빌드를 하고싶으면 오류가 난다는것이였다



😜 해결방법

https://sarunw.com/tips/create-new-ios12-project-in-xcode11/

##### @available(iOS 13.0, *) 적용해주기





##### present시 card presentation style로 띄우지 않고 fullScreen으로 띄우기

~~~swift
let settingVC = SettingsVC()
settingVC.modalPresentationStyle = .fullScreen
present(settingVC, animated: true, completion: nil)
~~~



modal로 present는 하지만 사용자가 직접 내릴수 없게 만든다.

`default` 상태는 false이므로 사용자에서 내리게하고 싶지 않으면 `true`로 변경하면 된다.

~~~swift
if #available(iOS 13.0, *) {
        settingVC.isModalInPresentation = true
      }
~~~

