//
//  EmailViewController.m
//  Polatic
//
//  Created by polatic on 4/22/14.
//  Copyright (c) 2014 polatic. All rights reserved.
//

#import "EmailViewController.h"
@interface EmailViewController ()

@end

@implementation EmailViewController
@synthesize textView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(tapped:)];
    [textView addGestureRecognizer: tap];
    [textView setDelegate:self];
	// Do any additional setup after loading the view.
}
- (IBAction)compose:(id)sender {
    if ([MFMailComposeViewController canSendMail]){
    // Email Subject
    NSString *emailTitle = @"Request";
    // Email Content
    NSString *messageBody = textView.text;
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"edo@polatic.co.id"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    mc.navigationBar.tintColor = [UIColor darkGrayColor];
    [mc setModalTransitionStyle : UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:mc  animated:YES completion:NULL];
    
    
    }


    else {
    
    NSLog(@"Device is unable to send email in its current state.");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Please enter email address on Mail Application" object:self];}
}

- (IBAction)doneButton:(id)sender {
    [textView resignFirstResponder];
}
- (void) tapped: (UITapGestureRecognizer *) tap {
    [textView becomeFirstResponder];
}



- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) resign{
    [textView resignFirstResponder];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
