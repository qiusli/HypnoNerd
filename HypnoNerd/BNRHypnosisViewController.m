//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Qiushi Li on 5/27/15.
//  Copyright (c) 2015 BigNerdRanch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

// 指定这个controller实现UITextFieldDelegate这个interface
@interface BNRHypnosisViewController() <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) loadView {
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    CGRect frame = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnosis me!";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
}

- (BOOL)textFieldShouldReturn: (UITextField *) textField {
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [self resignFirstResponder];
    return true;
}

// designated initializer
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void) drawHypnoticMessage: (NSString *) message {
    for (int i = 0; i < 20; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = message;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blueColor];
        [label sizeToFit];
        
        int x = arc4random() % (int) (self.view.bounds.size.width - label.bounds.size.width);
        int y = arc4random() % (int) (self.view.bounds.size.height - label.bounds.size.height);
        
        CGRect frame = label.frame;
        frame.origin = CGPointMake(x, y);
        label.frame = frame;
        
        [self.view addSubview:label];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
    }
}
@end
