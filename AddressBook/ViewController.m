//
//  ViewController.m
//  AddressBook
//
//  Created by Pulkit Kathuria on 10/29/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)accessAddressBook{
    // creating the picker
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
	// place the delegate of the picker to the controll
	picker.peoplePickerDelegate = self;
    
	// showing the picker
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    // assigning control back to the main controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	

    self.labelFirstName.text = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    self.labelLastName.text = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);

    
	ABMultiValueRef multiPhone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (ABMultiValueGetCount(multiPhone)>0){
        //self.labelPhoneNumbers.text = (__bridge NSString*)ABMultiValueCopyValueAtIndex(multiPhone, 0);
        
        NSArray *arrayPhone = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(multiPhone);
        self.labelPhoneNumbers.text = [arrayPhone componentsJoinedByString:@"\n"];
        NSLog(@"%@", arrayPhone);
    }
    
    ABMultiValueRef multiEmail = ABRecordCopyValue(person, kABPersonEmailProperty);
    if (ABMultiValueGetCount(multiEmail)>0){
        //self.labelEmails.text = (__bridge NSString*)ABMultiValueCopyValueAtIndex(multiEmail, 0);
        NSArray *arrayEmail = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(multiEmail);
        self.labelEmails.text = [arrayEmail componentsJoinedByString:@"\n"];
        NSLog(@"%@", arrayEmail);

    }
    
    NSData *contactImageData = (__bridge NSData*)ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail);
    UIImage * image = [[UIImage alloc] initWithData:contactImageData];
    [self.imageContact setImage:image];

    
    [self dismissViewControllerAnimated:YES completion:nil];
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}


@end
