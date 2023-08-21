//
//  CodeLoginVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/30.
//

import UIKit
import LeanCloud

private let totalTime = 5
class CodeLoginVC: UIViewController {
    
    private var timeRemain = totalTime

    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var getAuthCodeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    lazy private var timer = Timer()
    
    private var phoneNumStr: String { phoneNumTF.unwrappedText }
    private var authCodeStr: String { authCodeTF.unwrappedText }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        loginBtn.setToDisabled()
    }
    //因密码登录页面pop回来的时候也需要弹出软键盘,这里简单处理
    //也可手动performsegue(push)进下一个页面,然后用闭包或代理的方式,不再赘述
    //放在viewDidAppear的话会等页面完全展示后再弹出,衔接不太顺畅
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneNumTF.becomeFirstResponder()
    }
    
    @IBAction func dismiss(_ sender: Any) { dismiss(animated: true) }
    
    @IBAction func TFEditingChanged(_ sender: UITextField) {
        if sender == phoneNumTF{
            //判断用户输入的手机号是否合法,来决定‘获取验证码’按钮展示与否
            //若按钮进入倒计时状态（disable）时也不隐藏
            getAuthCodeBtn.isHidden = !phoneNumStr.isPhoneNum && getAuthCodeBtn.isEnabled
        }
        
        if phoneNumStr.isPhoneNum && authCodeStr.isAuthCode{
            loginBtn.setToEnabled()
        }else{
            loginBtn.setToDisabled()
        }
        
    }
    
    //设计1:按钮一直显示，用户按下时判断
    //设计2(本案):按钮先隐藏，用户输完11位手机号后判断，若合法则显示--体验好
    @IBAction func getAuthCode(_ sender: Any) {
        getAuthCodeBtn.isEnabled = false
        setAuthCodeBtnDisabledText()
        authCodeTF.becomeFirstResponder()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAuthCodeBtnText), userInfo: nil, repeats: true)
        
        //name:不指定的话为在LeanCloud上创建的应用名
        //ttl:失效时间.0-30分钟，官方说默认10分钟，实测为30，故这里重新指定
        let variables: LCDictionary = ["name": LCString("小粉书"), "ttl": LCNumber(5)]
        
        LCSMSClient.requestShortMessage(
            mobilePhoneNumber: phoneNumStr,
            templateName: "login",
            signatureName: "小粉书",
            variables: variables)
        { result in
            if case let .failure(error: error) = result{
                print(error.reason ?? "短信验证码未知错误")
            }
        }
    }
    
    //测试手机号:18094343888 测试验证码:045991
    @IBAction func login(_ sender: UIButton) {
        view.endEditing(true)
        
        showLoadHUD()
        LCUser.signUpOrLogIn(mobilePhoneNumber: phoneNumStr, verificationCode: authCodeStr){ result in
            switch result {
            case let .success(object: user):
                //print(user)
                let randomNickName = "小粉薯\(String.randomString(6))"
                self.configAfterLogin(user, randomNickName);
            case let .failure(error: error):
                self.hideLoadHUD()
                DispatchQueue.main.async {
                    self.showTextHUD("登录失败", true, error.reason)
                }
            }
        }
    }


}
// MARK: - UITextFieldDelegate
extension CodeLoginVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //range.location--当前输入的字符或粘贴文本的第一个字符的索引
        //string--当前输入的字符或粘贴的文本
        let limit = textField == phoneNumTF ? 11 : 6
        let isExceed = range.location >= limit || (textField.unwrappedText.count + string.count) > limit
        if isExceed{
            showTextHUD("最多只能输入\(limit)位哦")
        }
        return !isExceed
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneNumTF{
            authCodeTF.becomeFirstResponder()
        }else{
            if loginBtn.isEnabled{ login(loginBtn) }
        }
        return true
    }
}
// MARK: - 监听
extension CodeLoginVC{
    @objc private func changeAuthCodeBtnText(){
        timeRemain -= 1
        setAuthCodeBtnDisabledText()
        
        if timeRemain <= 0{
            timer.invalidate()//使用Timer之后一定要在某个时候销毁掉
            //reset处理
            timeRemain = totalTime
            getAuthCodeBtn.isEnabled = true
            getAuthCodeBtn.setTitle("发送验证码", for: .normal)
            
            getAuthCodeBtn.isHidden = !phoneNumStr.isPhoneNum//防止在倒计时的时候用户修改成了非法手机号，在倒计时结束后仍旧显示为正常按钮
        }
    }
}
// MARK: - 普通函数
extension CodeLoginVC{
    private func setAuthCodeBtnDisabledText(){
        getAuthCodeBtn.setTitle("重新发送(\(timeRemain)s)", for: .disabled)
    }
}
