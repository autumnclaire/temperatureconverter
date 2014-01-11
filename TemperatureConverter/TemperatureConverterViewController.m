//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Autumn Victor on 1/10/14.
//  Copyright (c) 2014 Autumn Victor. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *temperatureTypePicker;
@property (weak, nonatomic) IBOutlet UILabel *resultTemperatureType;
@property (weak, nonatomic) IBOutlet UILabel *resultTemperatureValue;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UITextField *temperatureField;

- (IBAction)onTemperatureTypeChanged:(id)sender;
- (IBAction)onTouchConvertButton:(id)sender;
- (void) resetValues;
- (float) convertToCelsius:(float) fahrenheitValue;
- (float) convertToFahrenheit: (float) celsiusValue;
- (NSString*) formatToNiceString: (float) floatValue;
- (void) doConversion;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTemperatureTypeChanged:(id)sender {
    int newIndex = self.temperatureTypePicker.selectedSegmentIndex;
    if (newIndex == 0) {
        self.resultTemperatureType.text = @"Celsius";
    } else {
        self.resultTemperatureType.text = @"Fahrenheit";
    }
    self.resultTemperatureValue.text = @"";
}

- (IBAction)onTouchConvertButton:(id)sender {
    [self.view endEditing: YES];    //dismisses the keyboard
    [self doConversion];
}

- (void) doConversion {
    NSString* temperatureValue = self.temperatureField.text;
    int index = self.temperatureTypePicker.selectedSegmentIndex;
    if (index == 0) {
        
        self.resultTemperatureValue.text = [self formatToNiceString:[self convertToCelsius: [temperatureValue floatValue]]];
        self.resultTemperatureType.text = @"Celsius";
    } else {
        self.resultTemperatureValue.text = [self formatToNiceString:[self convertToFahrenheit: [temperatureValue floatValue]]];
        self.resultTemperatureType.text = @"Fahrenheit";
    }
}

- (void) resetValues {
    self.temperatureField.text = @"";
    self.resultTemperatureType.text = @"Celsius";
    self.resultTemperatureValue.text = @"";
}

- (float) convertToCelsius: (float)fahrenheit {
    return (fahrenheit - 32.0f) * (5.0f/9.0f);
}

- (float) convertToFahrenheit: (float) celsius {
    return ((9.0f/5.0f) * celsius) + 32;
}

- (NSString*) formatToNiceString:(float)floatValue {
    return [NSString  stringWithFormat:@"%0.2f", floatValue];
}



@end
