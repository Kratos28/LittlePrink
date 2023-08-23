//
//  NoteDetailVC-MeVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/21.
//

import Foundation
import LeanCloud
extension NoteDetailVC{
    func noteToMeVC(_ user :LCUser?){
        guard let user = user else{return}
        let meVC = storyboard!.instantiateViewController(identifier: kMeVCID){
            coder in
            MeVC(coder: coder, user: user);
        }
        meVC.isFromNote = true;
        meVC.modalPresentationStyle = .fullScreen;
        present(meVC, animated: false);
    }
    
    @objc func goToMeVC(_tap:UIPassableTapGestureRecoginzer){
        let user = _tap.passObj;
        noteToMeVC(user);
    }
    
}
