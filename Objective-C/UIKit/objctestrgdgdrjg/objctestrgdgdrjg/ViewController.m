//
//  ViewController.m
//  objctestrgdgdrjg
//
//  Created by Zachary Keffaber on 12/20/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)GreenColorButton:(id)sender {
    self.view.backgroundColor = UIColor.systemGreenColor;
}
- (IBAction)YellowColorButton:(id)sender {
    self.view.backgroundColor = UIColor.systemYellowColor;
}
- (IBAction)BlueColorButton:(id)sender {
    self.view.backgroundColor = UIColor.systemBlueColor;
}

@end
