### Design  Basics (corners, shadows, Color)



https://www.youtube.com/watch?v=xpTGEoUMiOE



https://www.youtube.com/watch?v=Kt9XiUpmcWY



http://www.swiftdevcenter.com/tag/add-bottom-shadow-to-uiview-swift/



https://fluffy.es/rounded-corner-shadow/





`clipsToBounds`는 `UIView`에 속하고 `masksToBounds` 는 `CALayer`에 속합니다.







### modal시 뒷배경 클린하게 

~~~swift
    let rankingVC = RankingVC()
    
    rankingVC.modalPresentationStyle = .overCurrentContext
    present(rankingVC, animated: false)
    
~~~

