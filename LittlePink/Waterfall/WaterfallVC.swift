

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip
import LeanCloud
import SegementSlide

class WaterfallVC: UICollectionViewController,SegementSlideContentScrollViewDelegate {
    var channel = ""
    lazy var header = MJRefreshNormalHeader();
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
    var isMyselfLike = false;
    var isFromMeVC = false;
    var fromMeVCUser: LCUser?
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        
        if let  _ = user
        {//个人页面
            
            if isMyNote{
                header.setRefreshingTarget(self, refreshingAction: #selector(getMyNotes));
            }else if isMyFav{
                header.setRefreshingTarget(self, refreshingAction: #selector(getMyFavNotes));

            }else
            {
                header.setRefreshingTarget(self, refreshingAction: #selector(getMyLikeNotes));

            }
            header.beginRefreshing();
        }else if isDraft
        {//草稿总页面
            getDraftNotes();

        }else
        {//首页
            header.setRefreshingTarget(self, refreshingAction: #selector(getNotes));
            header.beginRefreshing();


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
