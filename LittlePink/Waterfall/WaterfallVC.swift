

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip
import LeanCloud
import SegementSlide

class WaterfallVC: UICollectionViewController,SegementSlideContentScrollViewDelegate {
    var channel = ""
    
    @objc var scrollView: UIScrollView
    {
        return self.collectionView;
    }
    //草稿页相关数据
    var isDraft = false
    var draftNotes: [DraftNote] = []
    
    //首页相关数据
    var notes: [LCObject] = []
    var isMyDraft = false;
    var user: LCUser?
    var isMyNote = false;
    var isMyFav = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        
        if let  user = user
        {//个人页面
            
            if isMyNote{
                getMyNotes(user);
            }else if isMyFav{
                
            }
            
        }else if isDraft
        {//草稿总页面
            getDraftNotes();

        }else
        {//首页
            getNotes();

        }
        
        
    }
    
    
    @IBAction func dismissDraftNotesVC(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

// MARK: - CHTCollectionViewDelegateWaterfallLayout


extension WaterfallVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel)
    }
}
