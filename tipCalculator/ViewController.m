//
//  ViewController.m
//  tipCalculator
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (nonatomic) NSInteger billAmount;
@property (nonatomic) float tipPercentage;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@end

@implementation ViewController


//for stretch goal we can do NSNotification center and subscribe to notifications of UIKeyboardWillShowNotification
// this notifcation passes a dictionary which will give us access to UIKeyboardFrameEndUserInfoKey which will hold the location and size of the keyboard after it is on screen.
//somehow use that value to adjust our view up by an equal amount


//maybe use UITextFieldDeleage to auto update the label on changes?
- (void)viewDidLoad {
    [super viewDidLoad];
    self.billAmountTextField.delegate = self;
    //calculate tip whenever the bill amount is changed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(calculateTip) name:UITextFieldTextDidChangeNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateViewFrame) name:UIKeyboardWillShowNotification object: nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)calculateTip {
    self.billAmount = [self.billAmountTextField.text integerValue];
   
    if ([self.tipPercentageTextField.text  isEqual: @""]) {
    
        self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.02f",self.billAmount * 0.15];
        
    } else {
        
          self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.2f",self.billAmount * ([self.tipPercentageTextField.text integerValue]/100.0)];
    }
}
- (void)updateViewFrame {
    
    CGRect newFrame = self.view.frame;
//    newFrame.origin.y +=
}


@end
