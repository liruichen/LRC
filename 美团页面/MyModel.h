//
//  MessageModel.h
//  大众点评
//
//  Created by 千锋 on 16/6/17.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property NSString *image;
@property NSString *title;
@property NSString *number;

- (instancetype) initWithImageName: (NSString *) imageName andTitle: (NSString *) title andNumber: (NSString *) number;

@end
