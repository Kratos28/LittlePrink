//
//  NoteDetailVC-MeVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/1.
//

import LeanCloud

extension NoteDetailVC{
    func noteToMeVC(_ user: LCUser?){
        guard let user = user else { return }
        
        if isFromMeVC, let fromMeVCUser = fromMeVCUser, fromMeVCUser == user{
            dismiss(animated: true)
        }else{
            let meVC = storyboard!.instantiateViewController(identifier: kMeVCID) { coder in
                MeVC(coder: coder, user: user)
            }
            meVC.isFromNote = true
            meVC.modalPresentationStyle = .fullScreen
            //把系统自带的转场动画改成push和pop动画
            meVC.heroModalAnimationType = .selectBy(presenting: .push(direction: .left), dismissing: .pull(direction: .right))
            
            present(meVC, animated: true)
        }
    }
    
    @objc func goToMeVC(_ tap: UIPassableTapGestureRecognizer){
        let user = tap.passObj
        noteToMeVC(user)
    }
}
