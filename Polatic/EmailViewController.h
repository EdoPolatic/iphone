//
//  EmailViewController.h
//  Polatic
//
//  Created by polatic on 4/22/14.
//  Copyright (c) 2014 polatic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface EmailViewController : UIViewController <MFMailComposeViewControllerDelegate,UITextViewDelegate>
- (IBAction)compose:(id)sender;
- (IBAction)doneButton:(id)sender;
@property (assign,nonatomic) UIModalTransitionStyle *transitionStyle;
@property (strong,nonatomic) IBOutlet UITextView *textView;
@end
