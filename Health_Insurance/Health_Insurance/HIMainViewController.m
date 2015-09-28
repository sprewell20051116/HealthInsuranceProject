//
//  HIMainViewController.m
//  Health_Insurance
//
//  Created by GIGIGUN on 2015/9/28.
//  Copyright © 2015年 GIGIGUN. All rights reserved.
//

#import "HIMainViewController.h"
#import "HITutorialViewController.h"

#import "PlistUtilities.h"



#define INIT_OFFSET 64.0f

@interface HIMainViewController ()
@property (strong, nonatomic) IBOutlet UIView *AccountHeader;
@property (strong, nonatomic) IBOutlet UIImageView *AccountImg;
@property (strong, nonatomic) IBOutlet UILabel *AccountName;

@end

@implementation HIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [PlistUtilities init_Plist];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;

    
    if (NO == [PlistUtilities Plist_GetTutorialSeen]) {
        NSLog(@"Start with Tutorial View");
        dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_async( dispatch_get_main_queue(), ^{
                HITutorialViewController *TutorPage = [self.storyboard instantiateViewControllerWithIdentifier:@"HITutorialViewController"];
                [self presentViewController:TutorPage animated:NO completion:nil];
            });
        });
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Identfier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identfier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identfier];
    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
