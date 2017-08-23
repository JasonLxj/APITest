//
//  ViewController.m
//  APIURLTest
//
//  Created by j on 19/08/2017.
//  Copyright © 2017 j. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *classNameArray;
@property (nonatomic, strong) NSMutableDictionary *propertyDict;
@property (nonatomic, strong) NSMutableDictionary *propertyTypeDict;

@property (nonatomic, strong) NSMutableSet *classNamePrintArray;
@property (nonatomic, strong) NSMutableDictionary *impDict;

@end

@implementation ViewController
@synthesize classNameArray, propertyDict, propertyTypeDict, classNamePrintArray, impDict;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    return;
    classNameArray = [NSMutableArray array];
    propertyDict = [NSMutableDictionary dictionary];
    propertyTypeDict = [NSMutableDictionary dictionary];
    
    
    classNamePrintArray = [NSMutableSet set];
    impDict = [NSMutableDictionary dictionary];
    
    NSArray *array = @[@"student/duiba/autologin",
                       @"student/login",
                       @"student/portrait/upload",
                       @"student/captcha",
                       @"student/homepage/image",
                       @"student/credit/log/list",
                       
                       @"student/fast_login",
                       @"student/fast_login/smscode/send",
                       
                       @"student/register",
                       @"student/register/smscode/send",
                       
                       @"student/info",
                       @"student/info/update",
                       @"student/info/password/update",
                       @"student/info/password/reset",
                       @"student/info/password/reset/smscode/send",
                       
                       @"student/order/create",
                       @"student/order/finished/list",
                       
                       @"student/payment/alipay/order/precreate",
                       @"student/payment/wxpay/order/precreate",
                       @"student/payment/apple/iap/certificate",
                       
                       @"student/vip/price/list",
                       @"student/vip/agreement/url",
                       @"student/vip/document/url",
                       
                       @"student/org/teacher/list",
                       @"student/org/announcement/list",
                       
                       @"student/class/list",
                       @"student/class/join",
                       @"student/class/book/list",
                       
                       @"student/hw/unfinished/list",
                       @"student/hw/finished/list",
                       @"student/hw/info",
                       @"student/hw/answer/upload",
                       @"student/hw/complete",
                       @"student/hw/comment/list",
                       @"student/hw/exercise/create",
                       @"student/hw/exercise/list",
                       @"student/hw/exercise/submit",
                       @"student/hw/exercise/delete",
                       @"student/hw/share/info",
                       @"student/hw/share/confirm",
                       @"student/hw/show/list",
                       @"student/notice/home",
                       @"student/notice/list",
                       @"student/oss/authority",
                       @"student/oss/filename/encode",
                       @"student/book/home",
                       @"student/book/home/v2",
                       @"student/book/list",
                       @"student/book/list/v2",
                       @"student/book/info",
                       @"student/book/lesson/info",
                       @"student/book/lesson/hw/type_and_mode/list",
                       @"student/book/auth/consumecode",
                       @"student/book/tag/subtag/list",
                       @"student/book/search_by_tags/list",
                       @"student/book/province/tag/list",
                       @"student/book/lesson/share/info",
                       @"student/checkin/v2",
                       @"student/checkin/info/v2",
                       @"student/ranking/list",
                       @"student/news/list",
                       @"student/eval/home",
                       @"student/eval/list",
                       @"student/eval/next",
                       @"student/eval/create",
                       @"student/eval/finish",
                       @"student/eval/share/info",
                       @"student/medal/mylist"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    
    for (NSString *str in array) {
        // TODO:lxj 取出所有的key,然后组成字典
    // 再根据字典创建 对象
        NSArray *subArray = [str componentsSeparatedByString:@"/"];
        NSString *lastStr = nil;
        for (NSString *subStr in subArray) {
            if (lastStr) {
                NSMutableSet *mArray = [[dict objectForKey:lastStr] mutableCopy];
                if (!mArray) {
                    mArray = [NSMutableSet set];
                }
                [mArray addObject:subStr];
                [dict setObject:mArray forKey:lastStr];
            }
            lastStr = subStr;
        }
    }

    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *className = [NSString stringWithFormat:@"TTNetwork%@",[NSString stringWithFormat:@"%@%@",[[key substringToIndex:1] uppercaseString], [[key substringFromIndex:1] lowercaseString]]];
        
        
        
        NSMutableString *propertyString = [NSMutableString string];
        [propertyString appendString:[NSString stringWithFormat:@"@interface %@ : TTNetworkBase\n\n",className]];
        
        NSSet *valueArray = (NSSet *)obj;
        
        NSMutableArray *propertyArray = [NSMutableArray array];
        
        for (NSString *str in valueArray) {
            
            if ([dict objectForKey:str] != nil) {
                NSString *propertyType = [NSString stringWithFormat:@"TTNetwork%@%@",[[str substringToIndex:1] uppercaseString], [[str substringFromIndex:1] lowercaseString]];
                [propertyArray addObject:propertyType];
                
                [propertyString appendString:[NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;\n", propertyType, str]];
            }
            else {
                [propertyString appendString:[NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;\n", str]];
            }
        }
        
        [propertyString appendString:@"@end\n\n"];
        
        [impDict setObject:[NSString stringWithFormat:@"@implementation %@ \n\n@end\n\n", className] forKey:className];
        [propertyDict setObject:propertyString forKey:className];
        [propertyTypeDict setObject:propertyArray forKey:className];
        [classNameArray addObject:className];
        
    }];
    
    [self printClassNameAndProperty:classNameArray.firstObject];
    
    for (NSString *str in classNamePrintArray) {
        printf("%s", [impDict[str] UTF8String]);
    }
}

- (void)printClassNameAndProperty:(NSString *)className
{
        NSArray *typeArray = [propertyTypeDict objectForKey:className];
        if (typeArray.count > 0) {
            for (NSString *typeStr in typeArray) {
                if ([classNameArray containsObject:typeStr]) {
                    [self printClassNameAndProperty:typeStr];
                }
                else if ([typeStr isEqualToString:[typeArray lastObject]]){
                    printf("%s", [propertyDict[className] UTF8String]);
                    [propertyDict removeObjectForKey:className];
                    [classNameArray removeObject:className];
                    [classNamePrintArray addObject:className];
//                    NSLog(@"%ld", classNameArray.count);
                    if (classNameArray.count > 0) {
                        [self printClassNameAndProperty:classNameArray.firstObject];
                    }
                    else {
                        NSLog(@"完了");
                    }
                }
            }

        }
        else {
            printf("%s", [propertyDict[className] UTF8String]);
            
            [classNameArray removeObject:className];
             [propertyDict removeObjectForKey:className];
            [classNamePrintArray addObject:className];
//            NSLog(@"%ld", classNameArray.count);
            if (classNameArray.count > 0) {
                [self printClassNameAndProperty:classNameArray.firstObject];
            }
            else {
//                NSLog(@"完了");
            }

        }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
