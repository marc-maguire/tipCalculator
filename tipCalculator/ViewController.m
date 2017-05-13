//
//  ViewController.m
//  tipCalculator
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (nonatomic) NSInteger billAmount;
@property (nonatomic) float tipPercentage;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@end

@implementation ViewController

//user can enter a bill amount into a UITextField

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateTipButtonPressed {
    self.billAmount = [self.billAmountTextField.text integerValue];
   
    if ([self.tipPercentageTextField.text  isEqual: @""]) {
    
        self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.02f",self.billAmount * 0.15];
        
    } else {
        
          self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.2f",self.billAmount * ([self.tipPercentageTextField.text integerValue]/100.0)];
        
    }
    
}


@end
