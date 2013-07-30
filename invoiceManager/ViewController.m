//
//  ViewController.m
//  invoiceManager
//
//  Created by Mihai on 2013-05-14.
//  Copyright (c) 2013 Mihai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollViewer;
@synthesize segmentedControl;
@synthesize invoiceField;
@synthesize selectedBtnBg, selectedBtnBgTwo;

-(void) viewDidAppear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
    //[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSArray *array    ToLoadPicker = [[NSArray alloc] initWithObjects:@”iPhone”,@”iPad”,@”iPod”,@”iMac”,@”MacBook”,@”MacBook Pro”, nil];
    
    //NSLog(@"hey bud, %@", invMgr.customerName);
    [scrollViewer setScrollEnabled:YES];
    [scrollViewer setContentSize:CGSizeMake(768, 3500)];
    
    //segmentedControl.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
    
    /*UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
     [scrollViewer addGestureRecognizer:singleTap];*/
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    list1 = [NSMutableArray arrayWithCapacity:5];
    [list1 addObject:@"first one"];
    [list1 addObject:@"second one"];
    [list1 addObject:@"third one"];
    
    // load saved values (IF ANY)
    InvoiceManager *invoiceMngr = [InvoiceManager sharedInvoiceManager];
    
    [invoiceMngr printOut];
    
    /*if (invoiceMngr.invoiceNo != NULL){
     invoiceField.text = invoiceMngr.invoiceNo;
     }
     if (invoiceMngr.poNo != NULL){
     poField.text = invoiceMngr.poNo;
     }
     if (invoiceMngr.orderDate != NULL){
     poField.text = invoiceMngr.orderDate;
     }
     if (invoiceMngr.technicianName != NULL){
     techNameField.text = invoiceMngr.technicianName;
     }
     if (invoiceMngr.customerFirstName != NULL){
     customerFirstNameField.text = invoiceMngr.customerFirstName;
     }
     if (invoiceMngr.customerLastName != NULL){
     customerLastNameField.text = invoiceMngr.customerLastName;
     }
     if (invoiceMngr.customerAddressOne != NULL){
     customerAddressOneField.text = invoiceMngr.customerAddressOne;
     }
     if (invoiceMngr.customerAddressTwo != NULL){
     customerAddressTwoField.text = invoiceMngr.customerAddressTwo;
     }
     if (invoiceMngr.customerPhoneNo != NULL){
     customerPhoneField.text = invoiceMngr.customerPhoneNo;
     }
     if (invoiceMngr.customerEmail != NULL){
     customerEmailField.text = invoiceMngr.customerEmail;
     }
     if (invoiceMngr.customerReferredBy != NULL){
     customerReferredField.text = invoiceMngr.customerReferredBy;
     }
     */
    /*if (invoiceMngr.ratePerSquareFeet){
     ratePerSqFeet.text = [NSString stringWithFormat:@"%f", invoiceMngr.ratePerSquareFeet];
     }*/
    
    //InvoiceManager *blah = [InvoiceManager sharedInvoiceManager];
    //blah.customerName = @"Heybaboo";
    //NSLog(@"name is %@", blah.customerName);
    
    //[testBtn setImage:[UIImage imageNamed:@"bg1.jpg"] forState:nil];
    
    /*NSArray *arr = [segmentedControl subviews];
     NSLog(@"count is %u", [arr count]);
     for (int i = 0; i < [arr count]; i++) {
     UIView *v = (UIView*) [arr objectAtIndex:i];
     NSArray *subarr = [v subviews];
     NSLog(@"count is %u", [subarr count]);
     for (int j = 0; j < [subarr count]; j++) {
     if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
     UILabel *l = (UILabel*) [subarr objectAtIndex:j];
     l.transform = CGAffineTransformMakeRotation(-M_PI / 2.0); //do the reverse of what Ben did
     
     }
     }
     }*/
    
	//scrollViewer.contentSize = CGSizeMake(847, 800);
    //self.scrollViewer.contentSize = CGSizeMake(768, 3600);
    
    [super viewDidLoad];
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
    //NSLog(@"dismiss keyboard?");
}

/*
 - (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
 {
 CGPoint touchPoint=[gesture locationInView:scrollViewer];
 [invoiceField resignFirstResponder];
 NSLog(@"HEEELLO THERE ");
 }*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 return 1;
 }
 
 // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
 // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
 }
 */

-(IBAction)switchControllers {
    InvoiceManager* invoiceMngr = [InvoiceManager sharedInvoiceManager];
    NSLog(@"c !!!!!!!!! ust last nameis %@", [invoiceMngr customerLastName]);
    //SecondViewController *viewcontroller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    //ThirdViewController *viewcontroller = [[ThirdViewController alloc] init];
    //[self presentModalViewController:viewcontroller animated:YES];
    //[self.storyboard instantiateViewControllerWithIdentifier:@"Third"];
    //[storyboard instantiateViewControllerWithIdentifier:@"SecondController"];
    
    /*
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
     SecondViewController *second = (SecondViewController*) [storyboard instantiateViewControllerWithIdentifier:@"SecondController"];
     second.set = 56;
     second.SVCdelegate = self;
     [self presentViewController:second animated:YES completion:nil];
     */
    //UINavigationController *ha = [self.navigationController initWithRootViewController:self];
    //NSLog(@"nav controller: %@", ha);
    
    //SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
    InvoiceManager *invMngr = [InvoiceManager sharedInvoiceManager];
    if ([invMngr secondVC]){
        //NSLog(@">>> its already initiated !");
        [self.navigationController pushViewController:[invMngr secondVC] animated:YES];
    } else {
        NSLog(@">>> it's NOT initiated !");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
        SecondVC *second = (SecondVC*) [storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
        [invMngr setSecondVC:second];
        [[invMngr secondVC] retain];
        [self.navigationController pushViewController:second animated:YES];
        
    }
    
    if ([invMngr invoiceVC]){
        //NSLog(@">>> its already initiated !");
        //[self.navigationController pushViewController:[invMngr secondVC] animated:YES];
    } else {
        NSLog(@">>> invoice VC is NOT initiated !");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
        InvoiceVC *invoiceVCinst = (InvoiceVC*) [storyboard instantiateViewControllerWithIdentifier:@"InvoiceVC"];
        [invMngr setInvoiceVC:invoiceVCinst];
        [[invMngr invoiceVC] retain];
        //[self.navigationController pushViewController:invoiceVCinst animated:YES];
    }
    
    //ServiceTypeViewController *second = (ServiceTypeViewController*) [storyboard instantiateViewControllerWithIdentifier:@"ServiceTypeViewController"];
    
    //AAAViewController *aaa = [[AAAViewController alloc] initWithNibName:@"AAAViewController" bundle:nil];
    //[ha pushViewController:second animated:YES];
    
    //[self presentModalViewController:second animated:YES];
    
    //[second release];
    
    NSLog(@"initiating new view controller..%@", self.navigationController);
    
    //[second release];
}

/*-(IBAction) goAwayKeyboard: (id) sender {
 NSLog(@"keyboard going away ?");
 [sender resignFirstResponder];
 [invoiceField resignFirstResponder];
 }*/

-(void) textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"done editing");
    //NSLog(@"text: %@", textField.restorationIdentifier);
    //NSLog(@"text: %@", textField.placeholder);
}

// this VC is the delegate for SecondViewController. delegate method(s):
- (void)updateTableSVC:(ServiceTypeViewController *)ServiceTypeViewController {
    NSLog(@"called it !");
}

// - - - - - - START of IBActions
// - - - - - - - - - - - - - - - -

// currently, ONLY UITextFields are connected to this function, so a cast is done over all 'sender' id's
// if anything BUT UITextField outlets are connected to this func, it will not work properly
-(IBAction) onCustomEditingDone:(id) sender {
    InvoiceManager *invoiceMngr = [InvoiceManager sharedInvoiceManager];
    // THE CAST: (note! read above)
    NSString *inputtedText = [(UITextField *)sender text];
    NSLog(@"inputted text is : %@", inputtedText);
    if ([[sender restorationIdentifier] isEqualToString:@"invoiceNo"]){
        [invoiceMngr setInvoiceNo:inputtedText];
        [[invoiceMngr invoiceNo] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"poNo"]){
        [invoiceMngr setPoNo:inputtedText];
        [[invoiceMngr poNo] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"technicianName"]){
        [invoiceMngr setTechnicianName:inputtedText];
        [[invoiceMngr technicianName] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"currentDate"]){
        [invoiceMngr setOrderDate:inputtedText];
        [[invoiceMngr orderDate] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerFirstName"]){
        [invoiceMngr setCustomerFirstName:inputtedText];
        [[invoiceMngr customerFirstName] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerLastName"]){
        [invoiceMngr setCustomerLastName:inputtedText];
        [[invoiceMngr customerLastName] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerAddressOne"]){
        [invoiceMngr setCustomerAddressOne:inputtedText];
        [[invoiceMngr customerAddressOne] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerAddressTwo"]){
        [invoiceMngr setCustomerAddressTwo:inputtedText];
        [[invoiceMngr customerAddressTwo] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerPhone"]){
        [invoiceMngr setCustomerPhoneNo:inputtedText];
        [[invoiceMngr customerPhoneNo] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerPhoneTwo"]){
        [invoiceMngr setCustomerPhoneNoTwo:inputtedText];
        [[invoiceMngr customerPhoneNoTwo] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerEmail"]){
        [invoiceMngr setCustomerEmail:inputtedText];
        [[invoiceMngr customerEmail] retain];
    } else if ([[sender restorationIdentifier] isEqualToString:@"customerReferredBy"]){
        [invoiceMngr setCustomerReferredBy:inputtedText];
        [[invoiceMngr customerReferredBy] retain];
    }
    
    NSLog(@"cust last nameis %@", [invoiceMngr customerLastName]);
}

// only supports UIButton's right now
-(IBAction) onChoosingBuildingBtn: (id) sender {
    // set last selected back to normal
    for (UIButton *aSubview in self.view.subviews){
        //for (id aSubview in aSubview2.subviews){
        if ([aSubview isKindOfClass:[UIButton class]]){
            if ([aSubview tag] == 10){
                NSLog(@"hi, %@, %u", [aSubview restorationIdentifier], [aSubview tag]);
                //[aSubview setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [aSubview setTag:0];
            }
        }
        //}
    }
    
    // put background image view under the newly selected button
    UIButton *btn = (UIButton*)sender;
    NSString *senderID = [btn restorationIdentifier];
    
    InvoiceManager *invMngr = [InvoiceManager sharedInvoiceManager];
    
    if ([senderID isEqualToString:@"residential"]){
        [selectedBtnBg setFrame:CGRectMake(447.0f, selectedBtnBg.frame.origin.y, selectedBtnBg.frame.size.width, selectedBtnBg.frame.size.height)];
        [customerFirstNameField setPlaceholder:@"customer first name"];
        [customerLastNameField setPlaceholder:@"customer last name"];
        
        // save the type of building selected in the invoice manager singleton
        [invMngr setTypeOfBuilding:@"Residential Building"];
    } else if ([senderID isEqualToString:@"commercial"]){
        [selectedBtnBg setFrame:CGRectMake(581.0f, selectedBtnBg.frame.origin.y, selectedBtnBg.frame.size.width, selectedBtnBg.frame.size.height)];
        [customerFirstNameField setPlaceholder:@"company name"];
        [customerLastNameField setPlaceholder:@"project manager name"];
        
        // save the type of building selected in the invoice manager singleton
        [invMngr setTypeOfBuilding:@"Commercial Building"];
    }
    [btn setTag:10];
    
    //[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

// only supports UIButton's right now
-(IBAction) onChoosingBuildingBtnTwo: (id) sender {
    // set last selected back to normal
    for (UIButton *aSubview in self.view.subviews){
        //for (id aSubview in aSubview2.subviews){
        if ([aSubview isKindOfClass:[UIButton class]]){
            if ([aSubview tag] == 11){
                NSLog(@"hi, %@, %u", [aSubview restorationIdentifier], [aSubview tag]);
                //[aSubview setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [aSubview setTag:0];
            }
        }
        //}
    }
    
    // put background image view under the newly selected button
    UIButton *btn = (UIButton*)sender;
    NSString *senderID = [btn restorationIdentifier];
    
    InvoiceManager *invMngr = [InvoiceManager sharedInvoiceManager];
    
    if ([senderID isEqualToString:@"furnished"]){
        [selectedBtnBgTwo setFrame:
         CGRectMake(403.0f, selectedBtnBgTwo.frame.origin.y, selectedBtnBgTwo.frame.size.width, selectedBtnBgTwo.frame.size.height)];
        [invMngr setBuildingState:@"Furnished State"];
    } else if ([senderID isEqualToString:@"vacant"]){
        [selectedBtnBgTwo setFrame:
         CGRectMake(517.0f, selectedBtnBgTwo.frame.origin.y, selectedBtnBgTwo.frame.size.width, selectedBtnBgTwo.frame.size.height)];
        [invMngr setBuildingState:@"Vacant State"];
    } else if ([senderID isEqualToString:@"portable"]){
        [selectedBtnBgTwo setFrame:
         CGRectMake(640.0f, selectedBtnBgTwo.frame.origin.y, selectedBtnBgTwo.frame.size.width, selectedBtnBgTwo.frame.size.height)];
        [invMngr setBuildingState:@"Portable State"];
    }
    [btn setTag:11];
    //[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(IBAction)onTouchDownIcon {
    [testBtn setBackgroundImage:[UIImage imageNamed:@"settingsBtnTouchDown.png"] forState:UIControlStateHighlighted];
}

-(void) dealloc {
    [super dealloc];
}

@end
