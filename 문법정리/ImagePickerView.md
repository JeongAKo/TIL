## ImagePickerView



~~~swift
   @objc private func actionPictureBtn(_ sender: UIButton) {
    print("사진추가")
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.allowsEditing = true // 이걸 하면 이미지 자를수 있다
    present(picker, animated: true, completion: nil)
  }


extension Viewcontroller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("cancled picker")
    dismiss(animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("selected Image")
    var selectedImageFromPicker: UIImage?
    
    if let editedImage = info[.editedImage] as? UIImage { // 이미지 자르기
      selectedImageFromPicker = editedImage
    } else if let originalImage = info[.originalImage] as? UIImage {  //오리지널 이미지
      selectedImageFromPicker = originalImage
    }
    
    if let selectedImage = selectedImageFromPicker {
      myImgView.image = selectedImage // 이미지뷰에 선택한 이미지 넣어주기
    }
    
    dismiss(animated: true, completion: nil)
  }
  
}


~~~

