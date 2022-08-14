//
//  Extension.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/18.
//

import Foundation
import UIKit



extension Optional where Wrapped == String {
    var unwrappedText: String {self ?? ""}
    
}
extension UITextField
{
    var unwarppedText:String {
        text ?? ""
    }
    var exactText:String
    {
        unwarppedText.isBlank ? "" : unwarppedText;
    }
}

extension UIImage
{
    enum JPEGQuality:CGFloat
    {
        case lowest = 0;
        case low = 0.25;
        case medium = 0.5
        case high = 0.75
        case highest = 1
    }
    func jpeg(_ jpegGQuality :JPEGQuality) -> Data? {
        jpegData(compressionQuality: jpegGQuality.rawValue);
        
    }
    
    convenience init?(_ data:Data?) {
        if let  unwarppedData = data
        {
            self.init(data: unwarppedData)
        }else
        {
            return nil;
        }
    }
    
}

extension UITextView
{
    var unwarppedText:String {
        text ?? ""
    }
    var exactText:String
    {
        unwarppedText.isBlank ? "" : unwarppedText;
    }
}

extension UIView
{
    @IBInspectable  var  cornerRadius : CGFloat{
        set{
            self.layer.cornerRadius = newValue;
        }
        get{
            return self.layer.cornerRadius;
        }
    }
    
}

extension UIViewController {

    
    
    func showLoadHUd(_ title :String? = nil)
    {
        let hud = MBProgressHUD.showAdded(to: view, animated: true);
        hud.label.text = title;
        
    }
    func hideLoadHUD(){
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: self.view, animated: true);
        }
    }
    
    //MARK: 提示框-自动隐藏
    func showTextHUD(_ title:String,_ subtitle:String? = nil){
        let hud =  MBProgressHUD.showAdded(to: view, animated: true);
         hud.mode = .text;
        hud.label.text = title;
        hud.detailsLabel.text = subtitle;
        hud.hide(animated: true, afterDelay: 2);
    }
    
    func hideKeyBoardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
    }
    @objc func dismissKeyBoard(){
        view.endEditing(true);
    }
    
}


extension Bundle{
    var appName :String {
        
        if  let appname =  localizedInfoDictionary?["CFBundleDisplayName"] as? String
         {
            return appname;
         }else
         {
             return infoDictionary!["CFBundleDisplayName"] as! String;
         }

    }
    
    static func loadView<T>(fromNib name :String, with type:T.Type) -> T
    {
        if let view  =  Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("加载\(type)类型的view失败");
        
    }
}

extension String
{
    var isBlank:Bool
    {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty;
    }
}

