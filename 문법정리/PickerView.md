~~~swift
class PickerViewController: UIViewController {
	private let pickerValues: [String] = ["별점순", "리뷰순", "할인율"]
  private var didSelectRow = 0
  
  private lazy var sortPickerView: UIPickerView = {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    View.addSubview(picker)
    return picker
  }()
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {

  //피커뷰 폰트 조정
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    var pickerLabel: UILabel? = (view as? UILabel)
    pickerLabel = UILabel()
    pickerLabel?.textAlignment = .center
    pickerLabel?.text = pickerValues[row]
    pickerLabel?.font = UIFont(name: "Raleway", size: 20)
    return pickerLabel!
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerValues.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerValues[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // FIXME: - A method called when the picker is selected
		didSelectRow = row //로우 넘버를 가져올 때
    pickerView.numberOfComponents //row(행)를 가져오는게 아니고 열을 가져오는거
    
  }
}
~~~

