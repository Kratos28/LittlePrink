//
//  Extensions.swift
//  LittlePink
//
//  Created by 刘军 on 2020/11/17.
//

import UIKit
import DateToolsSwift
import AVFoundation

extension Int{
    var formattedStr: String{
        let num = Double(self)
        let tenThousand = num / 10_000
        let hundredMillion = num / 100_000_000
        
        if tenThousand < 1{
            return "\(self)"
        }else if hundredMillion >= 1{
            return "\(round(hundredMillion * 10) / 10)亿"
        }else{
            return "\(round(tenThousand * 10) / 10)万"
        }
    }
}

extension String{
    var isBlank: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func spliceAttrStr(_ dateStr: String)->NSMutableAttributedString
    {
            
        let attrText =  toAttrStr();
        let attrDate = " \(dateStr)".toAttrStr(12, .secondaryLabel);
        attrText.append(attrDate);
        return attrText;
        
    }
    func toAttrStr(_ fontSize :CGFloat = 14, _ color: UIColor = .label) ->NSMutableAttributedString
    {
        let attr : [NSAttributedString.Key:Any] = [
            .font : UIFont.systemFont(ofSize: fontSize),
            .foregroundColor : color
        ]
        return NSMutableAttributedString(string: self,attributes: attr);
    }
    
    var isPhoneNum: Bool{
        Int(self) != nil && NSRegularExpression(kPhoneRegEx).matches(self)
    }
    
    var isAuthCode: Bool{
        Int(self) != nil && NSRegularExpression(kAuthCodeRegEx).matches(self)
    }
    
    
    var isPassword: Bool{
        
         NSRegularExpression(kPasswordRegEx).matches(self)

    }
    
    
    static func randomString(_ length: Int) -> String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            fatalError("非法的正则表达式")//因不能确保调用父类的init函数
        }
    }
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

extension Optional where Wrapped == String{
    var unwrappedText: String { self ?? "" }
}

extension Date{
    //本项目5种时间表示方式:
    //1.刚刚/5分钟前;2.今天21:10;3.昨天21:10;4.09-15;5.2019-09-15
    var formattedDate: String{
        let currentYear = Date().year
        if year == currentYear{//今年
            if isToday{//今天
                if minutesAgo > 10{//note发布(或存草稿)超过10分钟即显示'今天xx:xx'
                    return "今天 \(format(with: "HH:mm"))"
                }else{
                    return timeAgoSinceNow
                }
            }else if isYesterday{//昨天
                return "昨天 \(format(with: "HH:mm"))"
            }else{//前天或更早的时间
                return format(with: "MM-dd")
            }
        }else if year < currentYear{//去年或更早
            return format(with: "yyyy-MM-dd")
        }else{
            return "明年或更远,目前项目暂不会用到"
        }
    }
}

extension URL{
    //从视频中生成封面图(了解)
    var thumbnail: UIImage{
        let asset = AVAsset(url: self)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //如果视频尺寸确定的话可以用下面这句提高处理性能
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
            return imagePH
        }
    }
}

extension UILabel
{
    func setToLight(_ text:String){
        self.text = text;
        textColor = .label;
    }
}


extension UIButton{
    
    func setToEnabled(){
        isEnabled = true
        backgroundColor = mainColor
    }
    
    func setToDisabled(){
        isEnabled = false
        backgroundColor = mainLightColor
    }
    
    func makeCapsule(_ color:UIColor = .label)
    {
        layer.cornerRadius = frame.height / 2;
        layer.borderWidth  = 1;
        layer.borderColor = color.cgColor;
        
    }
}

extension UIImage{
    //初始化构造器三原则:
    //1.指定构造器必须调用它直接父类的指定构造器方法--见FollowVC
    //2.便利构造器必须调用同一个类中定义的其它初始化方法
    //3.便利构造器在最后必须调用一个指定构造器
    convenience init?(_ data: Data?) {
        if let unwrappedData = data{
            self.init(data: unwrappedData)
        }else{
            return nil
        }
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data?{
        jpegData(compressionQuality: jpegQuality.rawValue)
    }
}

extension UITextField{
    var unwrappedText: String { text ?? "" }
    var exactText: String {
        unwrappedText.isBlank ? "" : unwrappedText
    }
    var isBlank:Bool{
        unwrappedText.isBlank
    }
}
extension UITextView{
    var unwrappedText: String { text ?? "" }
    var exactText: String {
        unwrappedText.isBlank ? "" : unwrappedText
    }
    var isBlank:Bool{
        unwrappedText.isBlank
    }
}


extension UIAlertAction
{
    func setTitleColor(_ color :UIColor){
        setValue(color, forKey: "titleTextColor");
    }
    
    var titleTextColor: UIColor?{
        get
        {
            value(forKey: "titleTextColor") as? UIColor
        }set
        {
            setValue(newValue, forKey: "titleTextColor");

        }
    }
}


