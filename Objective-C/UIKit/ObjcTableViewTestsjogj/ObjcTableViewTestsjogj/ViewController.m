//
//  ViewController.m
//  ObjcTableViewTestsjogj
//
//  Created by Zachary Keffaber on 12/21/21.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *GreenColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.GreenColor.textColor = UIColor.systemGreenColor;
}


@end
