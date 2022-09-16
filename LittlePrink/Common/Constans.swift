//
//  Constans.swift
//  LittlePrink
//
//  Created by Kratos on 2022/5/31.
//

import UIKit
let kDiscoveryVCID = "DiscoveryVCID";
let kNearByVCID = "NearByVCID";
let kFollowVCID = "FollowVCID";
let kWaterfallVCID = "WaterfallVCID";

let kDraftNoteWaterfallCellBottomViewH : CGFloat = 84;

let screenRect = UIScreen.main.bounds;
let kNoteEditVCID = "NoteEditVCID";
let kPhotoCellID = "PhotoCellID";
let ksubChannelCellID = "SubChannelCellID";
let imagePH = UIImage(named: "imagePH")!;
// MARK: -资源文件
let mainColor = UIColor(named: "main")!;

let blueColor = UIColor(named: "blue")!;
let kPOICellID = "POICellID"
// MARK: CellID
let waterfallCellID = "waterfallCellID";

let kDratNoteWaterfallCellID = "DratNoteWaterfallCellID";

let kChannelTableVCID = "ChannelTableViewVCID";

let kWaterfallPadding :CGFloat =  4;
let kphotoFooterID = "PhotoFooterID"
let kloginNavID = "LoginNavID";

//MARK: -coreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate;
let context = persistentContainer.viewContext;
let persistentContainer = appDelegate.persistentContainer;
let backgroundContext = persistentContainer.newBackgroundContext();

//MARK: -业务逻辑相关
let kchannels = ["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"]


let kNameFromAppleID = "nameFromAppleID";
let kEmailFromAppleID = "emailFromAppleID";

let kMaxPhotoCount = 9;
let KMaxCameraZoomFactor = 5.0;
let kSpacingBetweenItems = 2.0;
let kMaxNoteTitleCount = 20;
let kMaxNoteTextCount = 5;
let kAMapapiKey = "";
let kJAppKey = "";
let kAliPayAppID = "2021002125697028";
let kAliPayPID = "2088002401295380";
let kAppScheme = "LittlePrink";
//话题
let kAllSubChannels =
[
    ["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"],
    ["推荐","wefw","娱乐","才艺","美wew","白富wefwfw美","fefef","萌宠"],
    ["3222","wefw","娱乐","才艺","美wew","白富wefwfw美","fefef","wefw"],
    ["3222","wefw","egwgw","才艺","美wew","白富wefwfw美","fefef","wefw"],
    ["3222","wefw","egwgw","才艺","美wew","fwe美","fefef","wefw"],
    ["3222","wefw","egwgw","才艺","美wew","fwe美","fefef","wefw"],
    ["3222","wefw","egwgw","才艺","美wew","fwe美","fefef","wefw"],
    ["3222","wefw","egwgw","才艺","美wew","fwe美","fefef","wefw"]


    
]


let kNoPOIPH = "未知地址"
let kPOIsInitArr = [["不显示位置",""]]
let kPOIType = "汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务|汽车服务"
let kPOIOffset = 20;


let kLCAppID = "13268331128";
let kLCAppKey = "KtkqHFYTksVwhWhgaoCZi8H1";
let kLCServerURL = "https://ed2jrtd9.lc-cn-n1-shared.com";
let mainLightColor = UIColor(named: "main-light")


//正则
let kPhoneRegEX = "^1\\d{10}$"
let kAuthCodeRegEx = "^\\d{6}$";


//User
let kNickName = "nickname";

let kAvatarCol = "avatar";
