//
//  Basic-Extensions.swift
//  LittlePink
//
//  Created by 9130Game on 2023/9/12.
//

import Foundation
extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String{
            return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
    // MARK: 静态属性和方法--1.直接用类名进行调用,2.省资源
    // MARK: static和class的区别
    //static能修饰class/struct/enum的存储属性、计算属性、方法;class能修饰类的计算属性和方法
    //static修饰的类方法不能继承；class修饰的类方法可以继承
    //在protocol中要使用static
    
    //加载xib上的view
    //为了更通用，使用泛型。as?后需接类型，故形式参数需为T.Type，实质参数为XXView.self--固定用法
    static func loadView<T>(fromNib name: String, with type: T.Type) -> T{
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T{
            return view
        }
        fatalError("加载\(type)类型的view失败")
    }

}

extension FileManager{
    //对url添加子路径常用appendingPathComponent,对path添加就直接字符串拼接/插值
    func save(_ data: Data?, to dirName: String, as fileName: String) -> URL?{
        guard let data = data else {
            //print("要写入的data为nil")
            return nil
        }
        
        // MARK: 知识点
        //1.path转URL,URL转path
        //2.创建文件夹和文件时都需要先规定URL
        //3.一般都会使用fileExists先判断文件夹或文件是否存在
        
        // MARK: 创建文件夹
        //"file:///xx/xx/tmp/dirName"
        //这里的URL(fileURLWithPath: NSTemporaryDirectory())也可使用temporaryDirectory
        let dirURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(dirName, isDirectory: true)
        
        if !fileExists(atPath: dirURL.path){
            guard let _ = try? createDirectory(at: dirURL, withIntermediateDirectories: true) else {
                print("创建文件夹失败")
                return nil
            }
        }
        
        // MARK: 写入文件
        //"file:///xx/xx/tmp/dirName/fileName"
        let fileURL = dirURL.appendingPathComponent(fileName)
        
        if !fileExists(atPath: fileURL.path){
            guard let _ = try? data.write(to: fileURL) else {
                print("写入/创建文件失败")
                return nil
            }
        }
        
        return fileURL
    }
}


extension UserDefaults
{
    static func inCrease(_ key:String, by val:Int = 1){
        standard.set(standard.integer(forKey:key) + val, forKey: key);
    }
    
    static func deCrease(_ key:String, by val:Int = 1){
        standard.set(standard.integer(forKey:key) - val, forKey: key);

    }

}
