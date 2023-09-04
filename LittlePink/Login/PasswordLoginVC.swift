
import UIKit
import LeanCloud
class PasswordLoginVC: UIViewController {

    
    @IBOutlet weak var phoneNumTF:UITextField!
    @IBOutlet weak var passwordTF:UITextField!
    @IBOutlet weak var loginBtn:UIButton!
    private var phoneNumStr : String {phoneNumTF.unwrappedText};
    private var passwordStr  : String {passwordTF.unwrappedText};
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround();
        loginBtn.setToDisabled();
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        phoneNumTF.becomeFirstResponder();

    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func backToCodeLoginVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func TFEditChanged(_ sender : Any){
        if phoneNumStr.isPhoneNum && passwordStr.isPassword{
            loginBtn.setToEnabled();
        }else
        {
            loginBtn.setToDisabled();
        }
    }
    
    @IBAction func login(_ sender: Any) {
        view.endEditing(true);
        
        LCUser.logIn(mobilePhoneNumber: phoneNumStr, password: passwordStr) { result in
            self.hideLoadHUD();
            switch result {
            case .success(object: let user):
            self.dismissAndShowMeVC(user);
            case .failure(error: let error):
                self.showLoginHUD();

                DispatchQueue.main.async {
                    self.showTextHUD("登录失败",true,error.reason);
                }
                
            }
        };
        
    }
}

extension PasswordLoginVC: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case phoneNumTF:
            passwordTF.becomeFirstResponder();
        default:
            if loginBtn.isEnabled{login(loginBtn)};
        }
        
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let limit = textField == phoneNumTF ? 11 : 16
        let isExceed = range.location >= limit || (textField.unwrappedText.count + string.count) > limit
        if isExceed{
            showTextHUD("最多只能输入\(limit)位哦")
        }
        return !isExceed;
        
    }
    
}
