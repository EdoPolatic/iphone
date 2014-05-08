//
//  ProductsViewController.h
//  Polatic
//
//  Created by polatic on 4/30/14.
//  Copyright (c) 2014 polatic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *array;
@property (strong,nonatomic) NSMutableArray *imageArray;

@end
