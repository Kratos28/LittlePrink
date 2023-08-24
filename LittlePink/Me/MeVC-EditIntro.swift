//
//  MeVC-EditIntro.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/23.
//

import Foundation
extension MeVC{
    @objc func editIntro(){
        let vc = storyboard!.instantiateViewController(withIdentifier: kIntroVCID) as! IntroVC;
        vc.intro = user.getExactStringVal(kIntroCol);
        vc.delegate = self;
        present(vc, animated: true);
    }
}

extension MeVC:IntrolVCDelegate
{
    func updateIntro(_ intro: String) {
        meHeaderView.introLabel.text = intro.isEmpty ? kIntroCol :intro
        try? user.setValue(kIntroCol, forKey: intro);
        user.save{_ in}
    }
}
