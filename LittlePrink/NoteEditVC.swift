//
//  NoteEditVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/25.
//

import UIKit

class NoteEditVC: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


extension NoteEditVC:UICollectionViewDelegate
{
    
}

extension NoteEditVC:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return nil;
    }
    
    
}
