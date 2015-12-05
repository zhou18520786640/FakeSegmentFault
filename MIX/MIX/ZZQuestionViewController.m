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

@interface ZZQuestionViewController ()<UIScrollViewDelegate>
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
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 36, 18)];
    titleLabel.text = @"问题";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;


    
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
    
    
    
    
    

    self.helperScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, segmentedControl.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - segmentedControl.frame.size.height - 65 )];
    [self.view addSubview:self.helperScrollView];
    self.helperScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height - segmentedControl.frame.size.height - 65 );
    self.helperScrollView.pagingEnabled = YES;
    self.helperScrollView.delegate = self;
    [self.view addSubview:self.helperScrollView];
    
    
    ZZNewestViewController *newestViewController = [[ZZNewestViewController alloc] init];
    newestViewController.view.frame = CGRectMake(0, 0, self.helperScrollView.bounds.size.width, self.helperScrollView.bounds.size.height);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
//
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma  mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  //
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"offsetX: %f",scrollView.contentOffset.x);
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    
    self.segmentedControl.selectedSegmentIndex = index;


}



@end

