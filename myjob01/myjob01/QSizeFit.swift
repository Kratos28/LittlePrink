import UIKit
class QSizeFit : NSObject {
    
    static let shared : QSizeFit = {
        let shared = QSizeFit()
        return shared
    }()
    
    let rpx : Double
    override init() {
        rpx = Double(1.0 * UIScreen.main.bounds.size.width / 2048)
    }
    
    
    func getIRpx(value : Int) -> Int{
//        let fff = Int(rpx) * value;
        let fff = Float(rpx) * Float(value);
        return Int(fff);
    }
    
    func getFRpx(value : Float) -> Float{
        return Float(rpx) * value
    }
    
    func getDRpx(value : Double) -> Double{
        return rpx * value
    }
    //
}


 
extension Int {
    var rpx : Int {
        return QSizeFit.shared.getIRpx(value: self)
    }
}

extension Float {
    
    var rpx : Float {
        return QSizeFit.shared.getFRpx(value: self)
    }
    
}

extension Double {
    
    var rpx : Double {
        return QSizeFit.shared.getDRpx(value: self)
    }
}

extension CGFloat {
    
    var rpx : CGFloat {
        return CGFloat(QSizeFit.shared.getFRpx(value: Float(self)))
    }
    
}

