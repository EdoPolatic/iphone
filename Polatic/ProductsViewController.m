//
//  ProductsViewController.m
//  Polatic
//
//  Created by polatic on 4/30/14.
//  Copyright (c) 2014 polatic. All rights reserved.
//

#import "ProductsViewController.h"
#import "TableCell.h"
@interface ProductsViewController ()

@end

@implementation ProductsViewController
@synthesize array,imageArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    imageArray = [[NSMutableArray alloc]initWithObjects:@"bi.png",@"hostrack.jpg",@"nfc.jpg",@"server.jpg" ,nil];
    [self.scrollView setContentSize:(CGSizeMake(320, 1500))];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *CellIdentifier = @"Cell";
    TableCell* cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.label.text = [array objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}




@end

