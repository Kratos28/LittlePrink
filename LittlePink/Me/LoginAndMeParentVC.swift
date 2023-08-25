

import UIKit
import LeanCloud

var loginAndMeParentVC = UIViewController()

class LoginAndMeParentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = LCApplication.default.currentUser {
            let meVC =  storyboard!.instantiateViewController(identifier: kMeVCID){ coder in
                MeVC(coder: coder, user: user);
            }
            add(child: meVC)
        } else {
            let loginVC = storyboard!.instantiateViewController(identifier: kLoginVCID)
            add(child: loginVC)
        }
        
        loginAndMeParentVC = self//用一个强引用保存当前这个父vc,方便在登录和退出时找到正确的父vc
    }

}
