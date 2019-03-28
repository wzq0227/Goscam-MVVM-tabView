//
//  MytableView.h
//  MVVMDemo
//
//  Created by AnDong on 2019/3/27.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MytableView : UITableView<UITableViewDelegate,UITableViewDataSource>

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong)UIViewController * vc;
@end

NS_ASSUME_NONNULL_END
