### Date Picker

~~~swift
  // MARK: - Properties
private lazy var birthTextfield: UITextField = {
    let textField = UITextField()
    textField.attributedPlaceholder = NSAttributedString.settingPlaceholder(text: "생년월일을 선택해 주세요")
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.textColor = UIColor.appColor(.gray_666)
    textField.keyboardType = .decimalPad
    textField.inputView = self.datePicker
    textField.inputAccessoryView = self.toolbar
    //    textField.delegate = self
    view.addSubview(textField)
    return textField
  }()

  private lazy var datePicker: UIDatePicker = {
    let loc = Locale.init(identifier: "ko_KR")
    let datePicker = UIDatePicker(frame: .zero)
    datePicker.locale = loc
    datePicker.datePickerMode = .date
    datePicker.maximumDate = Date() //현재시간보다 높게 설정할 수 없게 설정
    return datePicker
  }()

  let toolbar: UIToolbar = {
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelDatePicker))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(doneDatePicker))
    toolbar.setItems([cancelButton,spaceButton, doneButton], animated: false)
    return toolbar
  }()


  // MARK: - Action Method
  @objc func doneDatePicker(){
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "YYYY년 MM월 dd일"
    birthTextfield.text = formatter.string(from: datePicker.date)
    view.endEditing(true)
  }
  
  @objc func cancelDatePicker(){
    self.view.endEditing(true)
  }
~~~





