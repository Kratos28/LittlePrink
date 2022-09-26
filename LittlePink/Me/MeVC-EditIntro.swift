//
//  MeVC-EditIntro.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/3.
//

import Foundation

extension MeVC{
    @objc func editIntro(){
        let vc = storyboard!.instantiateViewController(identifier: kIntroVCID) as! IntroVC
        vc.intro = user.getExactStringVal(kIntroCol)
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension MeVC: IntroVCDelegate{
    func updateIntro(_ intro: String) {
        //UI
        meHeaderView.introLabel.text = intro.isEmpty ? kIntroPH : intro
        //云端
        try? user.set(kIntroCol, value: intro)
        user.save{ _ in }
    }
}
