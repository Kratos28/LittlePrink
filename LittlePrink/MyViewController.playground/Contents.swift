//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    let photos = [
       UIImage(named: "1"),
       UIImage(named: "2"),
       UIImage(named: "3")

   ];
    
        lazy var cv: UICollectionView {
       let layout = UICollectionViewFlowLayout();
       layout.scrollDirection = .horizontal;
       layout.itemSize = CGSize(width: 90, height: 90);
       let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout:layout);
       cv.translatesAutoresizingMaskIntoConstraints = false;

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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCellID", for: indexPath) as! CVCell
        cell.imageview.image = self.photos[indexPath.item];
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
    }
    
}




class CVCell :UICollectionViewCell
{
    lazy var imageview:UIImageView = {
        let imagview = UIImageView();
        imagview.translatesAutoresizingMaskIntoConstraints = false;
        imagview.contentMode = .scaleAspectFill;
        imagview.backgroundColor = .systemBackground;
        return imagview;
    }();
    override init(frame: CGRect) {
        super.init(frame: frame);
        addSubview(imageview);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        imageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true;
        imageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true;
        imageview.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true;
        imageview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true;

    }
}

PlaygroundPage.current.liveView = MyViewController()



