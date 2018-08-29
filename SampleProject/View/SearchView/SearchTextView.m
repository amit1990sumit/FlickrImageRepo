//
//  SearchTextView.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "SearchTextView.h"

@interface SearchTextView()<UITextFieldDelegate>{
}
@end
@implementation SearchTextView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.delegate = self;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(_textFieldShouldReturnBlock){
        _textFieldShouldReturnBlock(textField);
    }
    return YES;
}


@end
