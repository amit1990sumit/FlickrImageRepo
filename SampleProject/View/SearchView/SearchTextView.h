//
//  SearchTextView.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TextFieldShouldReturnBlock)(UITextField *textField);
@interface SearchTextView : UITextField
@property(nonatomic,copy)TextFieldShouldReturnBlock textFieldShouldReturnBlock;
@end
