//
//  API.m
//  APIURLTest
//
//  Created by j on 19/08/2017.
//  Copyright © 2017 j. All rights reserved.
//

#import "API.h"
#import <objc/runtime.h>

@implementation TTNetworkBase

- (instancetype)init
{
    if (self = [super init]) {
        [self initProperty];
    }
    return self;
}

- (void)initProperty
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i ++) {
        
        objc_property_t p = propertyList[i];
        
        NSString *pName = [NSString stringWithUTF8String:property_getName(p)]; // 比较当前属性值是否等于目的值,等则返回
        if ([self valueForKey:pName] == nil) { // 若果属性为空,那么初始化一个
            // 获取属性名

            unsigned int attrCount = 0;
            objc_property_attribute_t *pAttr = property_copyAttributeList(p, &attrCount);
            
            for (int j = 0; j < attrCount; j++) {
                
                objc_property_attribute_t attr = pAttr[j];
                
                if (strcmp(attr.name, "T") == 0) {
                    
                    NSString *value = [NSString stringWithUTF8String:attr.value];
                    
                    value = [value substringWithRange:NSMakeRange(2, value.length - 3)];
                    NSLog(@"%@", value);
                    if (value) {
                        Class cla = NSClassFromString(value);
                        id obj = [[cla alloc] init];
//                        NSLog(@"=== %@", obj);
                        [self setValue:obj forKey:pName];
//                        NSLog(@"%@",[self valueForKey:pName]);
                    }
                }
            }
        }
        
    }
        
    
}

@end

@implementation TTNetworkPortrait

@end

@implementation TTNetworkNews

@end

@implementation TTNetworkAnswer

@end

@implementation TTNetworkShare

@end

@implementation TTNetworkLesson

@end

@implementation TTNetworkFinished

@end

@implementation TTNetworkTeacher

@end

@implementation TTNetworkSearch_by_tags

@end

@implementation TTNetworkNotice

@end

@implementation TTNetworkReset

@end

@implementation TTNetworkClass

@end

@implementation TTNetworkSmscode

@end

@implementation TTNetworkWxpay

@end

@implementation TTNetworkUnfinished

@end

@implementation TTNetworkFilename

@end

@implementation TTNetworkLog

@end

@implementation TTNetworkProvince

@end

@implementation TTNetworkCredit

@end

@implementation TTNetworkExercise

@end

@implementation TTNetworkInfo

@end

@implementation TTNetworkOrg

@end

@implementation TTNetworkType_and_mode

@end

@implementation TTNetworkMedal

@end

@implementation TTNetworkComment

@end

@implementation TTNetworkRegister

@end

@implementation TTNetworkAuth

@end

@implementation TTNetworkHw

@end

@implementation TTNetworkAgreement

@end

@implementation TTNetworkDuiba

@end

@implementation TTNetworkList

@end

@implementation TTNetworkTag

@end

@implementation TTNetworkAlipay

@end

@implementation TTNetworkRanking

@end

@implementation TTNetworkOrder

@end

@implementation TTNetworkHomepage

@end

@implementation TTNetworkAnnouncement

@end

@implementation TTNetworkBook

@end

@implementation TTNetworkShow

@end

@implementation TTNetworkFast_login

@end

@implementation TTNetworkEval

@end

@implementation TTNetworkIap

@end

@implementation TTNetworkHome

@end

@implementation TTNetworkApple

@end

@implementation TTNetworkCheckin

@end

@implementation TTNetworkPrice

@end

@implementation TTNetworkVip

@end

@implementation TTNetworkSubtag

@end

@implementation TTNetworkPayment

@end

@implementation TTNetworkPassword

@end

@implementation TTNetworkDocument

@end

@implementation TTNetworkOss

@end

@implementation TTNetworkStudent

@end

@implementation API

- (NSString *)APIURLForObj:(id)obj
{
    
    return [self get:[self class] destionValue:obj baseString:@"api/" upperValue:self];
    
}

- (NSString *)get:(__unsafe_unretained Class)class destionValue:(id)destValue baseString:(NSString *)baseString upperValue:(id)upperValue
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    
    for (int i = 0; i < count; i ++) {
      
        objc_property_t p = propertyList[i];
      
        NSString *pName = [NSString stringWithUTF8String:property_getName(p)]; // 比较当前属性值是否等于目的值,等则返回
        if ([upperValue valueForKey:pName] == destValue) {
            return [baseString stringByAppendingString:pName];
        }
        NSLog(@"pname is %@", pName);
        unsigned int attrCount = 0;
        objc_property_attribute_t *pAttr = property_copyAttributeList(p, &attrCount);
        
        for (int j = 0; j < attrCount; j++) {
            
            objc_property_attribute_t attr = pAttr[j];
            
            if (strcmp(attr.name, "T") == 0) { // 获取属性名字,如果不是基类则继续往下查
                
                NSString *value = [NSString stringWithUTF8String:attr.value];
                value = [value substringWithRange:NSMakeRange(2, value.length - 3)];
                NSLog(@"value is %@", value);
                
                if (![value hasPrefix:@"NS"]) {// 基类
                    NSString *str = [self get:NSClassFromString(value) destionValue:destValue baseString:[[baseString stringByAppendingString:pName] stringByAppendingString:@"/"] upperValue:[upperValue valueForKey:pName]];
                    if (str) { //当前查到底没有结果则不返回,继续上级的循环
                        return str;
                    }
                }
            }
        }

    }
    return nil;
}
@end
