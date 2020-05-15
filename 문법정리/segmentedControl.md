### UISegmentedControl



~~~
  let items = ["Purple", "Green", "Blue"]
  
      
  lazy var segmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: items)
    sc.selectedSegmentIndex = 0
    sc.addTarget(self, action: #selector(actionSegmentedControl(_: )), for: .valueChanged)
    self.addSubview(sc)
    return sc
  }()
  
    @objc func actionSegmentedControl(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      print("0")
      existingAdress.isHidden = false
      newAdress.isHidden = true
      
    case 1:
      print("1")
      existingAdress.isHidden = true
      newAdress.isHidden = false
      
    default:
      break
    }
  }
~~~



![IMG_CC383F6E7C79-1](https://user-images.githubusercontent.com/47776915/81923551-d11de400-9618-11ea-9fba-fee1c32b4fea.jpeg)

