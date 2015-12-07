//
//  ZZQuestionViewController.m
//  MIX
//
//  Created by zhou on 15/11/25.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "ZZQuestionViewController.h"
#import "HMSegmentedControl.h"
#import "ZZNewestViewController.h"
#import "ZZHottestViewController.h"
#import "MacroDefinition.h"
#import "ZZunAnsweredViewController.h"
#import "EXTScope.h"
#import "ZZAskViewController.h"
#import "ZZQuestionDetailViewController.h"
#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>

@interface ZZQuestionViewController ()<UIScrollViewDelegate,ZZNewestViewControllerDelegate>
@property (nonatomic, strong) UIScrollView *helperScrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) ZZNewestViewController *newestViewController;
@property (nonatomic, strong) ZZHottestViewController *hottestViewController;
@property (nonatomic, strong) ZZunAnsweredViewController *unAnsweredViewController;

@end

@implementation ZZQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    


    
    [self configureTitles:@"问题"];
    
    // 提问按钮
    UIButton *askButton = [UIButton buttonWithType:UIButtonTypeCustom];
    askButton.backgroundColor = [UIColor clearColor];
    [askButton setTitle:@"提问" forState:UIControlStateNormal];
    askButton.titleLabel.font = [UIFont systemFontOfSize:17];
    askButton.frame = CGRectMake(0, 0, 35, 17);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:askButton];
    [askButton addTarget:self action:@selector(askButtonDidPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"最新的", @"热门的", @"未回答"]];
    segmentedControl.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionIndicatorColor = kMainColor;
    segmentedControl.selectionIndicatorHeight = 2;
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectedTitleTextAttributes = @{UITextAttributeTextColor:kMainColor,UITextAttributeFont:[UIFont systemFontOfSize:15]};
    segmentedControl.titleTextAttributes = @{UITextAttributeTextColor:UIColorFromRGB(0x595959),UITextAttributeFont:[UIFont systemFontOfSize:15]};

    segmentedControl.backgroundColor = UIColorFromRGB(0xf3f3f3);
    self.segmentedControl = segmentedControl;
    @weakify(self);
    [segmentedControl setIndexChangeBlock:^(NSInteger index) {
        @strongify(self);
        CGPoint point = CGPointMake(index * self.view.bounds.size.width, 0);
        self.helperScrollView.delegate = nil;
        [self.helperScrollView setContentOffset:point animated:NO];
        self.helperScrollView.delegate = self;
    }];
    [self.view addSubview:segmentedControl];
    
    
    
    
    

    self.helperScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, segmentedControl.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - segmentedControl.frame.size.height - 49 )];
    [self.view addSubview:self.helperScrollView];
    self.helperScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height - segmentedControl.frame.size.height - 65 );
    self.helperScrollView.pagingEnabled = YES;
    self.helperScrollView.delegate = self;
    [self.view addSubview:self.helperScrollView];
    
    
    ZZNewestViewController *newestViewController = [[ZZNewestViewController alloc] init];
    newestViewController.delegate = self;
    newestViewController.view.frame = CGRectMake(0, 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height - 65);
    newestViewController.tableView.frame = newestViewController.view.bounds;
    self.newestViewController = newestViewController;
    [self.helperScrollView addSubview:newestViewController.view];
    
    ZZHottestViewController *hottesetViewController = [[ZZHottestViewController alloc] init];
    hottesetViewController.view.frame = CGRectMake(CGRectGetMaxX(newestViewController.view.frame), 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
    self.hottestViewController = hottesetViewController;
    [self.helperScrollView addSubview:hottesetViewController.view];
    
    
    ZZunAnsweredViewController *unAnswerViewController = [[ZZunAnsweredViewController alloc] init];
    unAnswerViewController.view.frame = CGRectMake(CGRectGetMaxX(hottesetViewController.view.frame), 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
    self.unAnsweredViewController = unAnswerViewController;
    [self.helperScrollView addSubview:unAnswerViewController.view];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
}

#pragma  mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  //
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"offsetX: %f",scrollView.contentOffset.x);
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    
    self.segmentedControl.selectedSegmentIndex = index;


}

#pragma mark - Button Action
- (void)askButtonDidPressed{
    ZZAskViewController *askViewController = [[ZZAskViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:askViewController];
    [self presentViewController:navigationController animated:YES completion:nil];

}

#pragma mark - ZZNewestViewControllerDelegate
- (void)newestViewController:(ZZNewestViewController *)newestViewController
    didPressedWithQuestionId:(NSString *)questionid{
    if (questionid.length == 0) {
        return;
    }
    
    
    ZZQuestionDetailViewController *questionDetailViewController = [[ZZQuestionDetailViewController alloc] initWithQuestionId:questionid];

    [self.navigationController pushViewController:questionDetailViewController animated:NO];
    
    
    
    

}


@end

