//
//  NoteDetailVC-Config.swift
//  LittlePink
//
//  Created by 刘军 on 2021/2/17.
//

import Foundation
import ImageSlideshow
import UIKit
import GrowingTextView
import LeanCloud
import Hero
extension NoteDetailVC{
    func config(){
        
      
        //imageSlideshow
        imageSlideshow.zoomEnabled = true;
        imageSlideshow.circular = false;
        imageSlideshow.contentScaleMode = .scaleAspectFill;
        imageSlideshow.activityIndicator = DefaultActivityIndicator();
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = mainColor
        imageSlideshow.pageIndicator = pageControl;
        
    
        
        if LCApplication.default.currentUser == nil{
            likeBtn.setToNormal();
            favBtn.setToNormal();
            
        }
        
        
        //textView
        textView.textContainerInset = UIEdgeInsets(top: 11.5 , left: 16, bottom:11.5, right: 15);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil);
        textView.delegate = self;
        tableView.register(UINib(nibName: "CommentView", bundle: nil), forHeaderFooterViewReuseIdentifier: kCommentViewID);
        tableView.register(CommentSectionFooterView.self, forHeaderFooterViewReuseIdentifier: kCommentSectionFooterViewID);
        view.hero.id = noteHeroID;
        let pan = UIPanGestureRecognizer(target: self, action: #selector(slide));
        view.addGestureRecognizer(pan);
        
        
       
        
    }
    func adjustTableHeaderViewHeight()
    {
        //计算出tableHeaderView里内容的总height--固定用法(开销较大,不可过度使用)
        let height = tableHeaderView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        //取出初始frame值,待会把里面的height替换成上面计算的height,其余不替换
        var frame = tableHeaderView.frame
        //一旦tableHeaderView的height已经是实际height了,则不能也没必要继续赋值frame了.
        //需判断,否则更改tableHeaderView的frame会再次触发viewDidLayoutSubviews,进而进入死循环
        if frame.height != height{
            frame.size.height = height//替换成实际height
            tableHeaderView.frame = frame//重新赋值frame,即可改变tableHeaderView的布局(实际就是改变height)
        }
    }
}
extension NoteDetailVC : GrowingTextViewDelegate{

    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded();
        }
    }
}
extension NoteDetailVC
{
    @objc func keyboardWillChangeFrame(_ notification: Notification)
    {
     if let endFrame =   (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
         let keyboardH  = screenRect.height -  endFrame.origin.y;
             if keyboardH > 0{
                 view.insertSubview(overlayView, belowSubview: textViewBarView);
             }else
             {
                 overlayView.removeFromSuperview();
                 textViewBarView.isHidden = true;
             }
            textViewBarBottomConstraint.constant = keyboardH;
            view.layoutIfNeeded();
        }
        
    }
    @objc private func slide(pan : UIPanGestureRecognizer)
    {
        let translationX =  pan.translation(in: pan.view).x;
        
        if translationX > 0
        {
            let progress = (translationX / screenRect.width / 3);
            switch pan.state
            {
                case .began:
                backToCell();
                case .changed:
                    Hero.shared.update(progress);
                let position = CGPoint(x: translationX + view.center.x, y: pan.translation(in: pan.view).y + view.center.y);
                Hero.shared.apply(modifiers: [.position(position)], to: view)
                default:
                    //50 point/s
                    if progress +   pan.velocity(in: pan.view).x / view.bounds.width > 0.5{
                        Hero.shared.finish();
                    }else
                    {
                        Hero.shared.cancel();
                    }
            }
        }else if translationX < 0
        {
            let progress = -(translationX / screenRect.width);
            switch pan.state{
            case .began:
                noteToMeVC(author);
            case .changed:
                Hero.shared.update(progress);
            default:
                if progress  > 0.2{
                    Hero.shared.finish();
                    
                }else
                {
                    Hero.shared.cancel();
                }
            }
        }
    }
    
   
}
