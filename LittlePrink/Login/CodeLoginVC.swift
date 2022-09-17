//
//  CodeLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/9/9.
//

import UIKit
import LeanCloud
let totalTime = 60;
class CodeLoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var getAuthCodeBtn: UIButton!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    var authCodeStr : String {
        authCodeTF.unwarppedText;
    }
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
  
    @IBAction func TFEditingChanged(_ sender: UITextField) {
        
        
        if sender == phoneNumTF
        {
            getAuthCodeBtn.isHidden = !phoneNumStr.isPhoneNum && getAuthCodeBtn.isEnabled;
        }
        
        if phoneNumStr.isPhoneNum && authCodeStr.isAuthCode
        {
            loginBtn.setToEnabled();
        }else
        {
            loginBtn.setToDisabled();
        }

        
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
        
        let variables: LCDictionary = [
            "ttl": LCNumber(5),         // 验证码有效时间为 10 分钟
            "name": LCString("小粉书"), // 应用名称
        ]
        LCSMSClient.requestShortMessage(
            mobilePhoneNumber: phoneNumStr,
            templateName: "Register_Notice", // 控制台配置好的模板名称
            signatureName: "小粉书",
            variables: variables)     // 控制台配置好的短信签名名称
        { (result) in
            if case let .failure(error: error)  = result{
                print(error.reason);
                
            }
        }
    }
      
    
    @IBAction func login(_ sender: UIButton) {
        view.endEditing(true);
        showLoadHUd();
        LCUser.signUpOrLogIn(mobilePhoneNumber: phoneNumStr, verificationCode: authCodeStr) { result in
            self.hideLoadHUD();
            switch result{
            case let .success(object: user):
                
                let randomNickName  = "小粉薯\(String.randomString(6))";
                let randomAvatar = UIImage(named:"avatarPH\(Int.random(in: 1...4))")!;
                if let avatarData = randomAvatar.pngData(){
                    let avatarFile =  LCFile(payload: .data(data: avatarData));
                    avatarFile.mimeType = "image/jpeg";
                    avatarFile.save(to: user, as: kAvatarCol);
                }
                
                do {
                    try  user.set(kNickName, value: "randomNickName");
                    
                    
                } catch {
                    print("给User字段赋值失败");
                    return;
                }
                
                user.save { result in
                    if case . success = result {
                        
                    }
                }
                
            case let .failure(error: error):
                print(error);
                
                DispatchQueue.main.async {
                    self.showTextHUD("登录失败",true , error.reason);
                }
            }
        }
        
        
    }
}
extension CodeLoginVC :UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var limit = textField == phoneNumTF ? 11 : 6;
        let isExceed = range.location >= limit || (textField.unwarppedText.count + string.count ) > limit
        if isExceed
        {
            showTextHUD("最多只能\(limit)");
            return false;
        }
        
        return !isExceed;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneNumTF
        {
            authCodeTF.becomeFirstResponder();
        } else
        {
            if loginBtn.isEnabled
            {
                login(loginBtn);
            }
        }
        
        return true;
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
