//
//  ViewController.h
//  AddressBook
//
//  Created by Pulkit Kathuria on 10/29/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *labelFirstName;
@property (strong, nonatomic) IBOutlet UILabel *labelLastName;
@property (strong, nonatomic) IBOutlet UILabel *labelPhoneNumbers;
@property (strong, nonatomic) IBOutlet UILabel *labelEmails;

@property (strong, nonatomic) IBOutlet UIImageView *imageContact;

@property (strong, nonatomic) IBOutlet UILabel *labelContactInfo;

-(IBAction)accessAddressBook;
@end
