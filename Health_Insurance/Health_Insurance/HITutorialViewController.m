//
//  HITutorialViewController.m
//  Health_Insurance
//
//  Created by GIGIGUN on 2015/9/28.
//  Copyright © 2015年 GIGIGUN. All rights reserved.
//

#import "HITutorialViewController.h"
#define PagesInTutor 3

@interface HITutorialViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *TutorScrollerView;

@property (strong, nonatomic) IBOutlet UIView *View1;
@property (strong, nonatomic) IBOutlet UIView *View2;
@property (strong, nonatomic) IBOutlet UIView *View3;

// Global Layout
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *View1TailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *View2LeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *View2TailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *View3LeadingConstraint;


// Page2 Members
@property (strong, nonatomic) IBOutlet UIImageView *Tutor2_AccountImgView;
@property (strong, nonatomic) IBOutlet UILabel *Tutor2_AccountNameLab;
@property (strong, nonatomic) IBOutlet UILabel *Tutor2_AccountHeight;
@property (strong, nonatomic) IBOutlet UILabel *Tutor2_AccountWeight;
@property (strong, nonatomic) IBOutlet UIImageView *Tutor2_AccountGenderImgView;

// Page3 Members
@property (strong, nonatomic) IBOutlet UIButton *Tutor3_ImportHIInfoBtn;
@property (strong, nonatomic) IBOutlet UIButton *Tutor3_ClickToLearnMoreBtn;
@property (strong, nonatomic) IBOutlet UILabel *Tutor3_IntroLab;
@property (strong, nonatomic) IBOutlet UIButton *Tutor3_EnterAppBtn;
@end

@implementation HITutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat ViewWidth = self.view.frame.size.width;
    
    
    // TODO: Get Tutor Page Numbers
    _View1TailingConstraint.constant += (ViewWidth * (PagesInTutor - 1) );
    _View2LeadingConstraint.constant = ViewWidth + 12.5f;
    _View2TailingConstraint.constant = ViewWidth - 12.5f;
    _View3LeadingConstraint.constant = ViewWidth * (PagesInTutor - 1);
    
    
    [self SetTutor3_PageElement];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"scroll location = %f", scrollView.contentOffset.x);
}

-(void) SetTutor3_PageElement
{
    [_Tutor3_ImportHIInfoBtn.layer setBorderWidth:1.0f];
    [_Tutor3_ImportHIInfoBtn.layer setCornerRadius:5.0f];
    [_Tutor3_ImportHIInfoBtn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [_Tutor3_EnterAppBtn.layer setBorderWidth:1.0f];
    [_Tutor3_EnterAppBtn.layer setCornerRadius:5.0f];
    [_Tutor3_EnterAppBtn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
}

@end
