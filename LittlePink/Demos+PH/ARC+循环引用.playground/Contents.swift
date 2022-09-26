import UIKit

// MARK: - ARC(Automatic Reference Counting)-自动引用计数
//是iOS的内存管理机制

// MARK: - 会造成不好的现象:Reference Cycle/Retain Cycles-循环引用,从而导致内存泄露(memory leak)
//解决方法:weak(弱引用)和unowned(无主引用)--只要其中一个就行
class Author{
    var name: String
    weak var video: Video?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("author对象被销毁了")
    }
}

class Video{
    unowned var author: Author
    init(author: Author) {
        self.author = author
    }
    deinit {
        print("video对象被销毁了")
    }
}

var author: Author? = Author(name: "Lebus")
var video: Video? = Video(author: author!)
author?.video = video

author = nil
video = nil

// MARK: - delegate等属性被标记为weak的原因,也需放置滥用
class vc: UIViewController, UITableViewDelegate{
    var tableView: UITableView!
    override func viewDidLoad() {
        tableView.delegate = self
    }
}

// MARK: - 捕获列表CaptureList--闭包循环引用的解决方案
//1.全局函数闭包
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML()) // Prints "<p>hello, world</p>"
paragraph = nil

//2.逃逸闭包--见didFinishPicking
