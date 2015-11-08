//
//  JYSquareViewController.m
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYSquareViewController.h"
#import "JYGlobal.h"
#import "JYSquareCell.h"

@interface JYSquareViewController ()

@end

@implementation JYSquareViewController

- (void)requestAllData {
    NSDictionary *paramDic = @{@"user_id":[JYGlobal shareGlobal].user.userId, @"token":[JYGlobal shareGlobal].user.token,
                               @"longitude":@"121.47794", @"latitude":@"31.22516", @"distance":@"1000"};
    JYSquareRequest *squareRequest = [[JYSquareRequest alloc]init];
    [squareRequest sendSquareRequestWithParamter:paramDic delegate:self];
}

- (void)squareRequestSuccess:(JYSquareRequest *)request dictionary:(NSDictionary *)dictionary {
    self.addrArray = [NSMutableArray arrayWithArray:[dictionary allKeys]];
    self.dataDic = dictionary;
    [self.tableView reloadData];
}

- (void)squareRequestFailed:(JYSquareRequest *)request error:(NSError *)error {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"addrArray:%zd", self.addrArray.count);
    return self.addrArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JYSquareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"squareCell" forIndexPath:indexPath];
    if (!cell) { // TODO: why never go here?
        cell = [[JYSquareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"squareCell"];
    }
    
    JYSquareModel *squareModel = self.addrArray[indexPath.row][0];
    cell.squareVC = self;
    cell.locationLabel.text = squareModel.addr;
    cell.dataArr = self.dataDic[self.addrArray[indexPath.row]];
    cell.collectionView.delegate = cell;
    cell.collectionView.dataSource = cell;
    [cell.collectionView reloadData];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NavigationBar settings
    self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.titleButton setTitle:@"全部" forState:UIControlStateNormal];
    self.titleButton.frame = CGRectMake(0, 0, 200, 35);
    self.titleButton.backgroundColor = [UIColor blueColor];
    [self.titleButton addTarget:self action:@selector(titleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.titleButton setImage:[UIImage imageNamed:@"icon_arrow_down"] forState:UIControlStateNormal];
    self.titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 133, 0, 0);
    self.titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    self.navigationItem.titleView = self.titleButton;
    
    // tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.tableView.backgroundColor = [UIColor yellowColor];
    
    [self requestAllData];
}

- (void)titleButtonClicked {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
