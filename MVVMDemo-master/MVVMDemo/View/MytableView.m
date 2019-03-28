//
//  MytableView.m
//  MVVMDemo
//
//  Created by AnDong on 2019/3/27.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "MytableView.h"
#import "CustomTableViewCell.h"
#import "PushViewController.h"
@implementation MytableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.titleLabel.text=((CustomModel *)[_array objectAtIndex:indexPath.row]).title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (_array.count>0) {
    //        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:((CustomModel *)[_array objectAtIndex:indexPath.row]).title delegate:nil cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
    //        [alert show];
    [self.vc.navigationController pushViewController:[[PushViewController alloc] init]  animated:YES];
    //    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
@end
