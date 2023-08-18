//
//  Constants.swift
//  LittlePink
//
//  Created by 刘军 on 2020/11/7.
//

import UIKit

// MARK: - ID
//StoryboardID
let kFollowVCID = "FollowVCID"
let kNearByVCID = "NearByVCID"
let kDisCoveryVCID = "DiscoveryVCID"
let kWaterfallVCID = "WaterfallVCID"
let kNoteEditVCID = "NoteEditVCID"
let kChannelTableVCID = "ChannelTableVCID"
let kLoginNaviID = "LoginNaviID"
let kLoginVCID = "LoginVCID"
let kMeVCID = "MeVCID"
let kDraftNotesNaviID = "DraftNotesNaviID"
let kNoteDetailVCID = "NoteDetailVCID"

//Cell相关ID
let kWaterfallCellID = "WaterfallCellID"
let kPhotoCellID = "PhotoCellID"
let kPhotoFooterID = "PhotoFooterID"
let kSubChannelCellID = "SubChannelCellID"
let kPOICellID = "POICellID"
let kDraftNoteWaterfallCellID = "DraftNoteWaterfallCellID"
let kCommentViewID =  "CommentViewID"
let kReplyCellID  = "ReplyCellID";
let kCommentSectionFooterViewID = "commentSectionFooterViewID";
// MARK: - 资源文件相关
let mainColor = UIColor(named: "main")!
let mainLightColor = UIColor(named: "main-light")!
let blueColor = UIColor(named: "blue")!
let imagePH = UIImage(named: "imagePH")!

// MARK: - UserDefaults的key
let kNameFromAppleID = "nameFromAppleID"
let kEmailFromAppleID = "emailFromAppleID"
// MARK: - CoreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate;


let persistentContainer = appDelegate.persistentContainer
let context = persistentContainer.viewContext
let backgroundContext = persistentContainer.newBackgroundContext()

// MARK: - UI布局
let screenRect = UIScreen.main.bounds

// MARK: - 业务逻辑相关
//瀑布流
let kWaterfallPadding: CGFloat = 4
let kDraftNoteWaterfallCellBottomViewH: CGFloat = 68
let kWaterfallCellBottomViewH: CGFloat = 64

let kChannels = ["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"]

//YPImagePicker
let kMaxCameraZoomFactor: CGFloat = 5
let kMaxPhotoCount = 9
let kSpacingBetweenItems: CGFloat = 2

//笔记
let kMaxNoteTitleCount = 20
let kMaxNoteTextCount = 1000
let  kNoteCommetPH = "精彩评论被优先展示哦";
//话题
let kAllSubChannels = [
    ["穿神马是神马", "就快瘦到50斤啦", "花5个小时修的靓图", "网红店入坑记"],
    ["魔都名媛会会长", "爬行西藏", "无边泳池只要9块9"],
    ["小鲜肉的魔幻剧", "国产动画雄起"],
    ["练舞20年", "还在玩小提琴吗,我已经尤克里里了哦", "巴西柔术", "听说拳击能减肥", "乖乖交智商税吧"],
    ["粉底没有最厚,只有更厚", "最近很火的法属xx岛的面霜"],
    ["我是白富美你是吗", "康一康瞧一瞧啦"],
    ["装x西餐厅", "网红店打卡"],
    ["我的猫儿子", "我的猫女儿", "我的兔兔"]
]

//高德
let kAMapApiKey = "6edef4b411a5f6695bfc3f31ba0954a9"
let kNoPOIPH = "未知地点"
let kPOITypes = "医疗保健服务" //调试用
//let kPOITypes = "汽车服务|汽车销售|汽车维修|摩托车服务|餐饮服务|购物服务|生活服务|体育休闲服务|医疗保健服务|住宿服务|风景名胜|商务住宅|政府机构及社会团体|科教文化服务|交通设施服务|金融保险服务|公司企业|道路附属设施|地名地址信息|公共设施"
let kPOIsInitArr = [["不显示位置", ""]]
let kPOIsOffset = 20

//极光
let kJAppKey = "7d4ab0c8971f3dfe9884dee0"

//支付宝
let kAliPayAppID = "2021002125653447"
let kAliPayPID = "2088002401295380"
let kAlipayPrivateKey = "支付宝后台上传的公钥对应的私钥"
let kAppScheme = "LittlePink"

//正则表达式
let kPhoneRegEx = "^1\\d{10}$"
let kAuthCodeRegEx = "^\\d{6}$"

//云端
let kNotesOffset = 10


let kCommentOffSet = 10;


// MARK: - Leancloud
//配置相关
let kLCAppID = "KhBhnnGp6hqVn4K85HyhpqPJ-gzGzoHsz"
let kLCAppKey = "DTqthcpzPIkVTwlFwIyj4mLQ"
let kLCServerURL = "https://khbhnngp.lc-cn-n1-shared.com"

//通用字段
let kCreatedAtCol = "createdAt"
let kUpdatedAtCol = "updatedAt"

//表
let kNoteTable = "Note"
let kUserLikeTable = "UserLike";
let kUserFavTable = "UserFav";
let kCommentTable = "Comment"
let kReplyTable = "Reply";
let kIDCol = "id";
let kUserInfoTable =  "UserInfo";



let kReplyToUserCol = "ReplyToUserCol"
//UserInfo 表
let kUserObjectIDCol = "userObjectId";

//User表
let kNickNameCol = "nickName"
let kAvatarCol = "avatar"
let kGenderCol = "gender"
let kIntroCol = "intro"


//Note表
let kCoverPhotoCol = "coverPhoto"
let kCoverPhotoRatioCol = "coverPhotoRatio"
let kPhotosCol = "photos"
let kVideoCol = "video"
let kTitleCol = "title"
let kTextCol = "text"
let kChannelCol = "channel"
let kSubChannelCol = "subChannel"
let kPOINameCol = "poiName"
let kIsVideoCol = "isVideo"
let kLikeCountCol = "likeCount"
let kFavCountCol = "favCount"
let kCommentCountCol = "commentCount"
let kAuthorCol = "author"
let kHasEditCol = "hasEdit"
let kUserCol = "user";
let kNoteCol = "note"
let kCommentCol = "comment"
let kHasReplyCol = "hasReply"

// MARK: - 全局函数
func largeIcon(_ iconName: String, with color: UIColor = .label) -> UIImage{
    let config = UIImage.SymbolConfiguration(scale: .large)
    let icon = UIImage(systemName: iconName, withConfiguration: config)!
    
    return icon.withTintColor(color)
}



func showGlobalTextHUD(_ title:String){
    let window = UIApplication.shared.windows.last!;
    let hud = MBProgressHUD.showAdded(to: window, animated: true);
    hud.mode = .text;
    hud.label.text = title;
    hud.hide(animated: true, afterDelay: 2);
}
