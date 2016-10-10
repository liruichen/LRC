//
//  MessageModel.m
//  大众点评
//
//  Created by 千锋 on 16/6/17.
//
//
#import "MyModel.h"

@implementation MyModel
#pragma mark - action
- (instancetype) initWithImageName: (NSString *) imageName andTitle: (NSString *) title andNumber: (NSString *) number {
    self = [super init];
    if (self) {
        self.image = imageName;
        self.title = title;
        self.number = number;
    }
    return self;
}

@end