## UIActivityIndicator



~~~swift
import UIKit 
class ActivityIndicatorVC: BaseViewController { 
  lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView() 
     if #available(iOS 13.0, *) {
      activityIndicator.style = UIActivityIndicatorView.Style.medium
    } else {
      activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    activityIndicator.center = self.view.center 
    activityIndicator.hidesWhenStopped = true  
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.white 
    activityIndicator.startAnimating() 
    return activityIndicator 
  }() 
  
  
  override func viewDidLoad() { 
    super.viewDidLoad() 
    self.view.addSubview(self.activityIndicator) 
  } 
  

~~~

