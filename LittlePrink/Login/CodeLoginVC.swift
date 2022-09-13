//
//  CodeLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/9/9.
//

import UIKit

let totalTime = 60;
class CodeLoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var getAuthCodeBtn: UIButton!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    lazy var timer = Timer();
    var timeRemain = totalTime;
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
        let s  = phoneNumStr.isPhoneNum && getAuthCodeBtn.isEnabled
        getAuthCodeBtn.isHidden = !s;
        
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
        setAuthCodeBtnDisabledText();
        getAuthCodeBtn.becomeFirstResponder();
        getAuthCodeBtn.setTitle("重新发送\(timeRemain)", for: .disabled);
       timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAuthCodeBtnText), userInfo: nil, repeats: true);
    }
      
    
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
        
        print(isExceed);
        return !isExceed;
    }
}

extension CodeLoginVC
{
   @objc func changeAuthCodeBtnText()
    {
        timeRemain -= 1;
        setAuthCodeBtnDisabledText();
        if timeRemain == 0 {
            timer.invalidate();
            timeRemain = totalTime;
            getAuthCodeBtn.isEnabled = true;
            getAuthCodeBtn.setTitle("发送验证码", for: .normal);
            getAuthCodeBtn.isHidden = !phoneNumStr.isPhoneNum;
        }
    }
}



extension CodeLoginVC
{
    func setAuthCodeBtnDisabledText()
    {
        getAuthCodeBtn.setTitle("重新发送\(timeRemain)", for: .disabled);
        
    }
}
