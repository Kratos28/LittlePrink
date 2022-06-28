//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let
   private lazy var cv: UICollectionView {
       let layout = UICollectionViewFlowLayout();
       layout.scrollDirection = .horizontal;
       layout.itemSize = CGSize(width: 90, height: 90);
       cv.translatesAutoresizingMaskIntoConstraints = false;
       let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout);
       
       cv.register(CVCell.self, forCellWithReuseIdentifier: "CVCellID");
       return cv;
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(cv);
        setUI();
        self.view = view
    }
    
    
    private func setUI(){
        cv.heightAnchor.constraint(equalToConstant: 90).isActive = true;
        cv.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true;
        cv.leftAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true;
        cv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16).isActive = true;
    }
}

class CVCell :UICollectionViewCell
{
    
}

PlaygroundPage.current.liveView = MyViewController()



