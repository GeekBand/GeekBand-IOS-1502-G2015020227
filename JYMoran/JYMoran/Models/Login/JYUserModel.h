//
//  JYUserModel.h
//  JYMoran
//
//  Created by Joe on 10/23/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYUserModel : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *loginReturnMessage;
@property (nonatomic, copy) NSString *registerReturnMessage;

@end
