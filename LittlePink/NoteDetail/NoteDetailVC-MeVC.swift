//
//  NoteDetailVC-MeVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/21.
//

import Foundation
import LeanCloud
import Hero
extension NoteDetailVC{
    func noteToMeVC(_ user :LCUser?){
        guard let user = user else{return}
        if isFromMeVC,let formMeVCUser = fromMeVCUser , formMeVCUser == user{
            dismiss(animated:  true);
        }else{
            let meVC = storyboard!.instantiateViewController(identifier: kMeVCID){
                coder in
                MeVC(coder: coder, user: user);
            }
            meVC.isFromNote = true;
            meVC.modalPresentationStyle = .fullScreen;
            meVC.heroModalAnimationType = .selectBy(presenting: .push(direction: .left), dismissing: .pull(direction: .right))
            
            present(meVC, animated: false);
        }
      
    }
    
    @objc func goToMeVC(_tap:UIPassableTapGestureRecoginzer){
        let user = _tap.passObj;
        noteToMeVC(user);
    }
    
}
