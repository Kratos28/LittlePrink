//
//  CodeLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/9/9.
//

import UIKit

class CodeLoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var getAuthCodeBtn: UIButton!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    var phoneNumStr : String {
        phoneNumTF.unwarppedText;
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        hideKeyBoardWhenTappedAround();
        loginBtn.setToDisabled();
        // Do any additional setup after loading the view.
    }
  
    @IBAction func TFEditingChanged(_ sender: Any) {
        getAuthCodeBtn.isHidden = phoneNumStr.isPhoneNum
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.phoneNumTF.becomeFirstResponder();
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true);
    }
    

    @IBAction func getAuthCode(_ sender: Any) {
        
        getAuthCodeBtn.isEnabled = false;
        getAuthCodeBtn.setTitle("重新发送\(60)", for: .disabled);
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(<#T##@objc method#>), userInfo: nil, repeats: true);
    }
      
    @objc 
    
    @IBAction func login(_ sender: Any) {
    }
}
extension CodeLoginVC :UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var limit = textField == phoneNumTF ? 11 : 6;
        let isExceed = range.location >= limit || (textField.unwarppedText.count + string.count ) > limit
        if isExceed
        {
            showTextHUD("最多只能\(limit)");
        }
        return !isExceed;
    }
}
