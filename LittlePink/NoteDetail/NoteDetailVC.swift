//
//  NoteDetailVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/2/17.
//

import UIKit
import ImageSlideshow
import LeanCloud
import FaveButton
import GrowingTextView
class NoteDetailVC: UIViewController {
    
    var note: LCObject
    var isLikeFromWaterfallCell = false
    var delNoteFinished: (() -> ())?
    
    var comments: [LCObject] = []
    
    var isReply = false //用于判断用户按下textview的发送按钮时究竟是评论(comment)还是回复(reply)
    var commentSection = 0 //用于找出用户是对哪个评论进行的回复
    
    var replies: [ExpandableReplies] = []
    var replyToUser: LCUser?
    
    var isFromMeVC = false
    var fromMeVCUser: LCUser?
    
    var isFromPush = false
    var delegate: NoteDetailVCDelegate?
    var cellItem: Int?
    
    var noteHeroID: String?
    
    //上方bar
    @IBOutlet weak var authorAvatarBtn: UIButton!
    @IBOutlet weak var authorNickNameBtn: UIButton!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var shareOrMoreBtn: UIButton!
    
    //tableHeaderView
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var imageSlideshow: ImageSlideshow!
    @IBOutlet weak var imageSlideShowHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    //这里不使用UITextView是因其默认是滚动状态,不太方便搞成有多少就显示多少行的状态,实际开发中显示多行文本一般是用Label
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var channelBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    //整个tableView
    @IBOutlet weak var tableView: UITableView!
    
    //下方bar(点赞收藏评论)
    @IBOutlet weak var likeBtn: FaveButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var favBtn: FaveButton!
    @IBOutlet weak var favCountLabel: UILabel!
    @IBOutlet weak var commentCountBtn: UIButton!
    
    @IBOutlet weak var textViewBarView: UIView!
    @IBOutlet weak var textView: GrowingTextView!
    @IBOutlet weak var textViewBarBottomConstraint: NSLayoutConstraint!
    
    lazy var overlayView: UIView = {
        let overlayView = UIView(frame: view.frame)
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0.1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        overlayView.addGestureRecognizer(tap)
        return overlayView
    }()
    
    var likeCount = 0{
        didSet{
            likeCountLabel.text = likeCount == 0 ? "点赞" : likeCount.formattedStr
        }
    }
    var currentLikeCount = 0
    var favCount = 0{
        didSet{
            favCountLabel.text = favCount == 0 ? "收藏" : favCount.formattedStr
        }
    }
    var currentFavCount = 0
    var commentCount = 0{
        didSet{
            commentCountLabel.text = "\(commentCount)"
            commentCountBtn.setTitle(commentCount == 0 ? "评论" : commentCount.formattedStr, for: .normal)
        }
    }
    
    //计算属性
    var author: LCUser?{ note.get(kAuthorCol) as? LCUser }
    var isLike: Bool { likeBtn.isSelected }
    var isFav: Bool { favBtn.isSelected }
    var isReadMyNote: Bool {
        if let user = LCApplication.default.currentUser, let author = author, user == author{
            return true
        }else{
            return false
        }
    }
    
    init?(coder: NSCoder, note: LCObject) {
        self.note = note
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("必须传一些参数进来以构造本对象,不能单纯的用storyboard!.instantiateViewController构造本对象")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUI()
        getCommentsAndReplies()
        getFav()
    }
    //动态计算tableHeaderView的height(放在viewdidappear的话会触发多次),相当于手动实现了estimate size(目前cell已配备这种功能)
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustTableHeaderViewHeight()
    }
    
    @IBAction func back(_ sender: Any) { backToCell() }
    //点击作者头像或昵称
    @IBAction func goToAuthorMeVC(_ sender: Any) { noteToMeVC(author) }
    //点击分享或更多按钮
    @IBAction func shareOrMore(_ sender: Any) { shareOrMore() }
    //点赞
    @IBAction func like(_ sender: Any) { like() }
    //收藏
    @IBAction func fav(_ sender: Any) { fav() }
    //评论
    @IBAction func comment(_ sender: Any) { comment() }
    //发送评论
    @IBAction func postCommentOrReply(_ sender: Any) {
        //此处省略1.button的动态enable处理,2.字数限制的提示,3.按下键盘return键的处理
        if !textView.isBlank{
            if !isReply{
                //评论
                //note-comment一对多;user-comment一对多,故创建/取出comment表,在里面放入note和user字段
                postComment()
            }else{
                //回复
                //comment-reply一对多;user-reply一对多,和comment表类似
                postReply()
            }
            hideAndResetTextView()
        }
    }
    
}
