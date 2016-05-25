//
//  HomeVC.m
//  LOFFmpegSample
//
//  Created by sogou on 16/5/10.
//  Copyright © 2016年 lewis. All rights reserved.
//

#import "HomeVC.h"
#import "KxMovieViewController.h"


@interface HomeVC()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong) UITableView *mHomeTableView;
@property (nonatomic , strong) NSArray *contentArray;

@property (nonatomic , strong) NSString *basePatch;

@end
@implementation HomeVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    _basePatch = docDir;
    NSLog(@"%@",docDir);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileList = [[NSArray alloc] init];
    //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    fileList = [fileManager contentsOfDirectoryAtPath:docDir error:&error];
    _contentArray = fileList;
    
   
    
    NSLog(@"路径==%@,fileList%@",docDir,fileList);

    
    _mHomeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
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
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    NSString *name = [_contentArray objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ffffffff");
    NSString *filepatch = [NSString stringWithFormat:@"%@/%@",_basePatch,_contentArray[indexPath.row]];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);

    KxMovieViewController *vc = [KxMovieViewController movieViewControllerWithContentPath:filepatch
                                                                               parameters:parameters];
    [self presentViewController:vc animated:YES completion:nil];

}


@end
