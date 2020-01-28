[축(axis)](https://developer.apple.com/documentation/uikit/uistackview/1616223-axis): ([UIStackView](https://developer.apple.com/documentation/uikit/uistackview) 전용) 스택 뷰의 방향, 수직(vertical) 또는 수평(horizontal)을 정의합니다.

[방향(orientation)](https://developer.apple.com/documentation/appkit/nsstackview/1488950-orientation): ([UIStackView](https://developer.apple.com/documentation/uikit/uistackview) 전용) 스택 뷰의 방향, 수직(vertical) 또는 수평(horizontal)을 정의합니다.

[구분(distribution)](https://developer.apple.com/documentation/uikit/uistackview/1616233-distribution): 축을 따라 뷰의 레이아웃을 정의합니다.

[정렬(alignment)](https://developer.apple.com/documentation/uikit/uistackview/1616243-alignment): 스택 뷰의 축에 수직인 뷰의 레이아웃을 정의합니다.

[간격(spacing)](https://developer.apple.com/documentation/uikit/uistackview/1616225-spacing): 인접한(adjacent) 뷰 사이의 공간을 정의합니다.



![스크린샷 2019-07-17 오후 12 34 42](https://user-images.githubusercontent.com/47776915/61345258-59174e00-a88f-11e9-9403-7c7eb9788827.png)



#### Alignment

![image-asset](https://user-images.githubusercontent.com/47776915/61358840-2896da80-a8b6-11e9-8990-f85597a763ba.png)





#### Distribution

![스크린샷 2019-07-17 오후 5 40 20](https://user-images.githubusercontent.com/47776915/61360772-1323af80-a8ba-11e9-825f-43cb6958c514.png)





~~~swift
 let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .leading
    titleStackView.distribution = .equalCentering
    titleStackView.spacing = padding

    addSubview(titleStackView)
~~~



