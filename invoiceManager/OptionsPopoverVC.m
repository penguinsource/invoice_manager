//
//  OptionsPopoverVC.m
//  invoiceManager
//
//  Created by Mihai on 2013-05-20.
//  Copyright (c) 2013 Mihai. All rights reserved.
//

#import "OptionsPopoverVC.h"

@interface OptionsPopoverVC ()

@end

@implementation OptionsPopoverVC

//@synthesize notesField;
@synthesize OVCDelegate;
@synthesize rWidth, rLength, roomName, squareFeet, price, notesAboutRoom;
@synthesize lengthField, widthField, stairsField, landingsField;
@synthesize addonDeodorizer, addonFabricProtector, addonBiocide;
@synthesize priceRate;
@synthesize stairs, landings, stairsService;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated {
    
    if ([self editMode]){
        [saveOrEditBtn setRestorationIdentifier:@"edit"];
        [saveOrEditBtn setTitle:@"Edit" forState:UIControlStateNormal];
        
        [self restoreSavedSelections];    
        
        [self doCalculations];  // do calculations in case some variables changes ( rate per square feet )
    } else {
        // set up the notes field
        notesField.text = @"Place notes and comments here";
        notesField.textColor = [UIColor lightGrayColor];
        [notesField setDelegate:self];
        
        // init vars in case error occurs
        roomName = @"";
        notesAboutRoom = @"";
        rLength = 0;
        rWidth = 0;
        squareFeet = 0;
        price = 0;
        priceRate = 0;
        stairs = 0;
        landings = 0;
        stairsService = FALSE;
    }
    // NSLog(@"title of uivc is %@", [self title]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// restore the selected gui buttons to the ones saved in the 'editingCell'
-(void) restoreSavedSelections {
    
    // de-select all buttons with a specific tag and select the ones that were saved
    for (UIButton *v in self.view.subviews) {
        for (UIButton *btn in v.subviews){
            if ([btn isKindOfClass:[UIButton class]]){
                if ([btn tag] == 5){    // TAG = 5 means that this button is SELECTED
                    [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
                    //[btn setTitleColor:[UIColor colorWithWhite:94.0/255.0 alpha:100.0] forState:UIControlStateNormal];
                    [btn setTag:0];
                }
                
                // select the room name/ stairs button which is set in the editing cell
                if ([[[btn titleLabel] text] isEqualToString:[editingCell name]]){
                    [btn setTag:5];
                    [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    
                }
                
                // restore the addon's ( as selected or not ) based on the editing cell
                if ([[btn restorationIdentifier] isEqualToString:@"deodorizer"]){
                    if ([editingCell addonDeodorizer]){
                        addonDeodorizer = TRUE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    } else {
                        addonDeodorizer = FALSE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
                    }
                } else if ([[btn restorationIdentifier] isEqualToString:@"fabricProtector"]){
                    if ([editingCell addonFabricProtector]){
                        addonFabricProtector = TRUE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    } else {
                        addonFabricProtector = FALSE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
                    }
                } else if ([[btn restorationIdentifier] isEqualToString:@"biocide"]){
                    if ([editingCell addonBiocide]){
                        addonBiocide = TRUE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    } else {
                        addonBiocide = FALSE;
                        [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
                    }
                }                
            } else if ([btn isKindOfClass:[UITextField class]]){
                // restore the width and length saved
                UITextField* someField = (UITextField*) btn;
                if ([[btn restorationIdentifier] isEqualToString:@"length"]){
                    [someField setText:[NSString stringWithFormat:@"%f", [editingCell rlength]]];
                } else if ([[btn restorationIdentifier] isEqualToString:@"width"]){
                    [someField setText:[NSString stringWithFormat:@"%f", [editingCell rwidth]]];
                }
            }
        }
    }
    
    // restore the notes saved
    [notesField setText:[editingCell notes]];
}

-(IBAction) onClickingBtn: (id) sender {
    // de-select all buttons with a specific tag
    for (UIButton *v in self.view.subviews) {
        for (UIButton *btn in v.subviews){
            if ([btn isKindOfClass:[UIButton class]]){
                if ([btn tag] == 5){    // TAG = 5 means that this button is SELECTED
                    [btn setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
                    //[btn setTitleColor:[UIColor colorWithWhite:94.0/255.0 alpha:100.0] forState:UIControlStateNormal];
                    [btn setTag:0];
                }
            }
        }
    }
    
    // select the button the user clicked and set a specific tag for it
    UIButton *btnEx = (UIButton*) sender;
    NSLog(@"title is: %@", [[btnEx titleLabel] text]);
    //[btnEx setImage:[UIImage imageNamed:@"btnBackground2Sel.png" ] forState:UIControlStateNormal];
    [btnEx setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
    [btnEx setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnEx setTag:5];           // TAG = 5 means that this button is SELECTED
    
    roomName = [[btnEx titleLabel] text];
    
    if ([roomName isEqualToString:@"Stairs / Landings"]){
        stairsService = TRUE;
    } else {
        stairsService = FALSE;
    }
    [self doCalculations];
}

-(IBAction) onCustomEditingDone: (id) sender {
    if ([[sender restorationIdentifier] isEqualToString:@"length"]){
        rLength = [[(UITextField *)sender text] floatValue];
        [self doCalculations];
    } else if ([[sender restorationIdentifier] isEqualToString:@"width"]){
        rWidth = [[(UITextField *)sender text] floatValue];
        [self doCalculations];
    } else if ([[sender restorationIdentifier] isEqualToString:@"stairs"]){
        stairs = [[stairsField text] integerValue];
    } else if ([[sender restorationIdentifier] isEqualToString:@"landings"]){
        landings = [[landingsField text] integerValue];
    }
    [self doCalculations];
}

-(IBAction) saveAddon:(id)sender {
    if ([[sender restorationIdentifier] isEqualToString:@"deodorizer"]) {
        if (addonDeodorizer){
            addonDeodorizer = FALSE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        } else {
            addonDeodorizer = TRUE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    } else if ([[sender restorationIdentifier] isEqualToString:@"fabricProtector"]) {
        if (addonFabricProtector){
            addonFabricProtector = FALSE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        } else {
            addonFabricProtector = TRUE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    } else if ([[sender restorationIdentifier] isEqualToString:@"biocide"]) {
        if (addonBiocide){
            addonBiocide = FALSE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor colorWithRed:94.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        } else {
            addonBiocide = TRUE;
            [sender setBackgroundImage:[UIImage imageNamed:@"btnBackground5Sel.png"] forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    [self doCalculations];
}

-(void) doCalculations {
    InvoiceManager *invoiceMngr = [InvoiceManager sharedInvoiceManager];
    priceRate = [invoiceMngr ratePerSquareFeet];
    if (stairsService) {
        NSLog(@"%u, %u", stairs, landings);
        price = (stairs * 5.0f) + (landings * 10.0f);
        [priceLabel setText:[NSString stringWithFormat:@"$%0.02f", price]];
    } else {
        if (addonDeodorizer) {
            priceRate = priceRate + 0.10f;
        }
        if (addonFabricProtector){
            priceRate = priceRate + 0.15f;
        }
        if (addonBiocide){
            priceRate = priceRate + 0.15f;
        }
        
        if (rLength && rWidth){
            squareFeet = (float) rLength * rWidth;
            [sqfeetLabel setText:[NSString stringWithFormat:@"%0.02f square feet", squareFeet]];
            
            //NSLog(@"rate us %f", [invoiceMngr ratePerSquareFeet]);
            NSLog(@"caculation !!!!");
            price = (float)squareFeet * priceRate;
            [priceLabel setText:[NSString stringWithFormat:@"$%0.02f", price]];
        } else {
            [priceLabel setText:[NSString stringWithFormat:@"$0.00"]];
        }
    }
}

-(IBAction) saveOrCancel: (id) sender {
    notesAboutRoom = notesField.text;
    
    if ([[sender restorationIdentifier] isEqualToString:@"save"]){
        // if stairs/landings was selected
        if (stairsService){
            // save data into a service data cell
            ServiceDataCell *newCell = [[ServiceDataCell alloc] init];
            
            newCell.itemAttribute = @"Stairs";
            newCell.serviceType = @"carpet";
            newCell.rlength = 0.0f;         // N/A
            newCell.rwidth = 0.0f;          // N/A
            newCell.name = roomName;        // will be "Stairs / Landings"
            newCell.priceRate = 0.0f;       // N/A, price is set to: 1 stair = $5.0f, 1 landing = $10.0f
            newCell.quantity = stairs;      // quantity = # of stairs
            newCell.quantity2 = landings;   // quantity2 = # of landings
            newCell.notes = notesAboutRoom;
            newCell.price = price;
            
            [OVCDelegate updateDataTable:self editType:@"add" withServiceCell:newCell];
        }else { // else if a room was selected
            // save data into a service data cell
            ServiceDataCell *newCell = [[ServiceDataCell alloc] init];
            NSLog(@"price rate is %f", priceRate);
            newCell.itemAttribute = @"Room";
            newCell.serviceType = @"carpet";
            newCell.rlength = rLength;
            newCell.rwidth = rWidth;
            newCell.name = roomName;
            newCell.priceRate = priceRate;
            newCell.notes = notesAboutRoom;
            newCell.addonDeodorizer = addonDeodorizer;
            newCell.addonFabricProtector = addonFabricProtector;
            newCell.addonBiocide = addonBiocide;
            newCell.price = price;
            NSLog(@"the PRICE SENT IS %f", newCell.price);
            [OVCDelegate updateDataTable:self editType:@"add" withServiceCell:newCell];
            /*[OVCDelegate updateDataTable: self editType:@"add" withLength: rLength withWidth: rWidth andRoom: roomName withPriceRate: priceRate andNotes: notesAboutRoom];*/
        }
    } else if ([[sender restorationIdentifier] isEqualToString:@"edit"]){
        //[OVCDelegate updateDataTable:self editType:@"cancel" withServiceCell:nil];
        //[OVCDelegate updateDataTable: self editType:@"cancel" withLength: 0.0 withWidth: 0.0 andRoom: nil withPriceRate: 0.0 andNotes:nil];
        // NSLog(@"I AM EDITING STUFF!");
        if (stairsService){
            self.editingCell.itemAttribute = @"Stairs";
            self.editingCell.serviceType = @"carpet";
            self.editingCell.rlength = 0.0f;
            self.editingCell.rwidth = 0.0f;
            self.editingCell.name = roomName;
            self.editingCell.priceRate = 0.0f;
            self.editingCell.quantity = stairs;
            self.editingCell.quantity2 = landings;
            self.editingCell.notes = notesAboutRoom;
            self.editingCell.price = price;
            //[[self editingCell] setPrice:99.0f];
        } else {
            self.editingCell.itemAttribute = @"Room";
            self.editingCell.serviceType = @"carpet";
            self.editingCell.rlength = rLength;
            self.editingCell.rwidth = rWidth;
            self.editingCell.name = roomName;
            self.editingCell.priceRate = priceRate;
            self.editingCell.notes = notesAboutRoom;
            self.editingCell.addonDeodorizer = addonDeodorizer;
            self.editingCell.addonFabricProtector = addonFabricProtector;
            self.editingCell.addonBiocide = addonBiocide;
            self.editingCell.price = price;
        }
        [OVCDelegate updateDataTable:self editType:@"edit" withServiceCell:nil];
        
    } else if ([[sender restorationIdentifier] isEqualToString:@"cancel"]){
        [OVCDelegate updateDataTable:self editType:@"cancel" withServiceCell:nil];
        //[OVCDelegate updateDataTable: self editType:@"cancel" withLength: 0.0 withWidth: 0.0 andRoom: nil withPriceRate: 0.0 andNotes:nil];
    }
}



@end
