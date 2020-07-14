### 사진찍고 사진첩에 저장하기



> Privacy - Camera Usage Description
>
> Privacy - Photo Library Usage Description
>
> Privacy - Photo Library Additions Usage Description





##### 서울봉우리 NMapVC에 적용사례

~~~swift

// MARK: -  UIImagePickerControllerDelegate
extension NMapVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[.originalImage] as? UIImage else {
      print("Image not found!")
      return
    }
    
    imagePickerController.dismiss(animated: true, completion: nil)
    
    if UserInfo.def.getChallengeRecord() {  // 도전 완료
      if let timeRecord = UserInfo.def.finishChallengeMountain(image: image) {
        saveToAlbum(named: "서울 봉우리", image: image)
        print("📷saved finish image: \(timeRecord)")
        
        self.startDate = nil
        self.recordView.challengerRecordTimeLabel.text = "00:00:00"
        self.setCameraButtonStatus(.normal)
        self.presentFinishMountainClimbing(record: timeRecord, image: image)
      } else {
        print("finishChallengeMountain is nil")
      }
    } else {  // 도전 시작
      if let date = UserInfo.def.startChallengeMountain() {
        saveToAlbum(named: "서울 봉우리", image: image)
        print("📷saved start image")
        self.locatoinCheckTimeInterval = 1
        self.startDate = date
        time()
        self.setCameraButtonStatus(.challenging)
//        presentFinishMountainClimbing(record: "", image: image)
      } else {
        print("startChallengeMountain is nil")
      }
    }
    
    
  }
}
~~~

