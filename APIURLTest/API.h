//
//  API.h
//  APIURLTest
//
//  Created by j on 19/08/2017.
//  Copyright © 2017 j. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTNetworkBase : NSObject

@end

@interface TTNetworkIap : TTNetworkBase

@property (nonatomic, strong) NSString *certificate;

@end

@interface TTNetworkList : TTNetworkBase

@property (nonatomic, strong) NSString *v2;
@end

@interface TTNetworkType_and_mode : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkSmscode : TTNetworkBase

@property (nonatomic, strong) NSString *send;
@end

@interface TTNetworkReset : TTNetworkBase

@property (nonatomic, strong) TTNetworkSmscode *smscode;
@end

@interface TTNetworkPassword : TTNetworkBase

@property (nonatomic, strong) TTNetworkReset *reset;
@property (nonatomic, strong) NSString *update;
@end

@interface TTNetworkInfo : TTNetworkBase

@property (nonatomic, strong) NSString *update;
@property (nonatomic, strong) NSString *v2;
@property (nonatomic, strong) TTNetworkPassword *password;
@end

@interface TTNetworkShare : TTNetworkBase

@property (nonatomic, strong) NSString *confirm;
@property (nonatomic, strong) TTNetworkInfo *info;
@end

@interface TTNetworkExercise : TTNetworkBase

@property (nonatomic, strong) NSString *delete;
@property (nonatomic, strong) NSString *submit;
@property (nonatomic, strong) TTNetworkList *list;
@property (nonatomic, strong) NSString *create;
@end

@interface TTNetworkAnswer : TTNetworkBase

@property (nonatomic, strong) NSString *upload;
@end

@interface TTNetworkFinished : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkUnfinished : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkShow : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkComment : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkHw : TTNetworkBase

@property (nonatomic, strong) TTNetworkExercise *exercise;
@property (nonatomic, strong) TTNetworkAnswer *answer;
@property (nonatomic, strong) TTNetworkFinished *finished;
@property (nonatomic, strong) TTNetworkUnfinished *unfinished;
@property (nonatomic, strong) TTNetworkType_and_mode *type_and_mode;
@property (nonatomic, strong) TTNetworkShow *show;
@property (nonatomic, strong) TTNetworkShare *share;
@property (nonatomic, strong) NSString *complete;
@property (nonatomic, strong) TTNetworkComment *comment;
@property (nonatomic, strong) TTNetworkInfo *info;
@end

@interface TTNetworkLesson : TTNetworkBase

@property (nonatomic, strong) TTNetworkShare *share;
@property (nonatomic, strong) TTNetworkInfo *info;
@property (nonatomic, strong) TTNetworkHw *hw;
@end

@interface TTNetworkHome : TTNetworkBase

@property (nonatomic, strong) NSString *v2;
@end

@interface TTNetworkSubtag : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkTag : TTNetworkBase

@property (nonatomic, strong) TTNetworkSubtag *subtag;
@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkSearch_by_tags : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkAuth : TTNetworkBase

@property (nonatomic, strong) NSString *consumecode;
@end

@interface TTNetworkProvince : TTNetworkBase

@property (nonatomic, strong) TTNetworkTag *tag;
@end

@interface TTNetworkBook : TTNetworkBase

@property (nonatomic, strong) TTNetworkLesson *lesson;
@property (nonatomic, strong) TTNetworkInfo *info;
@property (nonatomic, strong) TTNetworkHome *home;
@property (nonatomic, strong) TTNetworkTag *tag;
@property (nonatomic, strong) TTNetworkSearch_by_tags *search_by_tags;
@property (nonatomic, strong) TTNetworkList *list;
@property (nonatomic, strong) TTNetworkAuth *auth;
@property (nonatomic, strong) TTNetworkProvince *province;
@end

@interface TTNetworkClass : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@property (nonatomic, strong) TTNetworkBook *book;
@property (nonatomic, strong) NSString *join;
@end

@interface TTNetworkRegister : TTNetworkBase

@property (nonatomic, strong) TTNetworkSmscode *smscode;
@end

@interface TTNetworkMedal : TTNetworkBase

@property (nonatomic, strong) NSString *mylist;
@end

@interface TTNetworkTeacher : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkAnnouncement : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkOrg : TTNetworkBase

@property (nonatomic, strong) TTNetworkTeacher *teacher;
@property (nonatomic, strong) TTNetworkAnnouncement *announcement;
@end

@interface TTNetworkNotice : TTNetworkBase

@property (nonatomic, strong) TTNetworkHome *home;
@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkLog : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkCredit : TTNetworkBase

@property (nonatomic, strong) TTNetworkLog *log;
@end

@interface TTNetworkFilename : TTNetworkBase

@property (nonatomic, strong) NSString *encode;
@end

@interface TTNetworkFast_login : TTNetworkBase

@property (nonatomic, strong) TTNetworkSmscode *smscode;
@end

@interface TTNetworkOss : TTNetworkBase

@property (nonatomic, strong) NSString *authority;
@property (nonatomic, strong) TTNetworkFilename *filename;
@end

@interface TTNetworkOrder : TTNetworkBase

@property (nonatomic, strong) TTNetworkFinished *finished;
@property (nonatomic, strong) NSString *create;
@property (nonatomic, strong) NSString *precreate;
@end

@interface TTNetworkAlipay : TTNetworkBase

@property (nonatomic, strong) TTNetworkOrder *order;
@end

@interface TTNetworkAgreement : TTNetworkBase

@property (nonatomic, strong) NSString *url;
@end

@interface TTNetworkRanking : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkNews : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkDuiba : TTNetworkBase

@property (nonatomic, strong) NSString *autologin;
@end

@interface TTNetworkPortrait : TTNetworkBase

@property (nonatomic, strong) NSString *upload;
@end

@interface TTNetworkEval : TTNetworkBase

@property (nonatomic, strong) TTNetworkHome *home;
@property (nonatomic, strong) NSString *finish;
@property (nonatomic, strong) TTNetworkList *list;
@property (nonatomic, strong) NSString *next;
@property (nonatomic, strong) TTNetworkShare *share;
@property (nonatomic, strong) NSString *create;
@end

@interface TTNetworkHomepage : TTNetworkBase

@property (nonatomic, strong) NSString *image;
@end

@interface TTNetworkWxpay : TTNetworkBase

@property (nonatomic, strong) TTNetworkOrder *order;
@end

@interface TTNetworkApple : TTNetworkBase

@property (nonatomic, strong) TTNetworkIap *iap;
@end

@interface TTNetworkPayment : TTNetworkBase

@property (nonatomic, strong) TTNetworkAlipay *alipay;
@property (nonatomic, strong) TTNetworkWxpay *wxpay;
@property (nonatomic, strong) TTNetworkApple *apple;
@end

@interface TTNetworkCheckin : TTNetworkBase

@property (nonatomic, strong) NSString *v2;
@property (nonatomic, strong) TTNetworkInfo *info;
@end

@interface TTNetworkPrice : TTNetworkBase

@property (nonatomic, strong) TTNetworkList *list;
@end

@interface TTNetworkDocument : TTNetworkBase

@property (nonatomic, strong) NSString *url;
@end

@interface TTNetworkVip : TTNetworkBase

@property (nonatomic, strong) TTNetworkPrice *price;
@property (nonatomic, strong) TTNetworkDocument *document;
@property (nonatomic, strong) TTNetworkAgreement *agreement;
@end

@interface TTNetworkStudent : TTNetworkBase

@property (nonatomic, strong) TTNetworkDuiba *duiba;
@property (nonatomic, strong) TTNetworkPortrait *portrait;
@property (nonatomic, strong) TTNetworkClass *class1;
@property (nonatomic, strong) NSString *captcha;
@property (nonatomic, strong) TTNetworkRanking *ranking;
@property (nonatomic, strong) TTNetworkEval *eval;
@property (nonatomic, strong) TTNetworkMedal *medal;
@property (nonatomic, strong) TTNetworkHomepage *homepage;
@property (nonatomic, strong) TTNetworkInfo *info;
@property (nonatomic, strong) TTNetworkHw *hw;
@property (nonatomic, strong) TTNetworkPayment *payment;
@property (nonatomic, strong) TTNetworkNews *news;
@property (nonatomic, strong) TTNetworkFast_login *fast_login;
@property (nonatomic, strong) TTNetworkCheckin *checkin;
@property (nonatomic, strong) TTNetworkNotice *notice;
@property (nonatomic, strong) TTNetworkOss *oss;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) TTNetworkOrg *org;
@property (nonatomic, strong) TTNetworkRegister *register1;
@property (nonatomic, strong) TTNetworkVip *vip;
@property (nonatomic, strong) TTNetworkCredit *credit;
@property (nonatomic, strong) TTNetworkOrder *order;
@property (nonatomic, strong) TTNetworkBook *book;
@end

@interface API : TTNetworkBase

@property (nonatomic, strong) TTNetworkStudent *student;
@property (nonatomic, strong) TTNetworkTeacher *teacher;

- (NSString *)APIURLForObj:(id)obj;

@end
