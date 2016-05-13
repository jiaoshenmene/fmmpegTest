//
//  HomeVC.m
//  LOFFmpegSample
//
//  Created by sogou on 16/5/10.
//  Copyright © 2016年 lewis. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong) UITableView *mHomeTableView;
@property (nonatomic , strong) NSArray *contentArray;

@end
@implementation HomeVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSLog(@"%@",docDir);
    
    
    _mHomeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _mHomeTableView.dataSource = self;
    _mHomeTableView.delegate = self;
    [self.view addSubview:_mHomeTableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contentArray.count;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}



@end
