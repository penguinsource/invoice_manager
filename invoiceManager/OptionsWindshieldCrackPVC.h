//  OptionsSemiDetailPVC.h
//  invoiceManager
//
//  Created by Mihai on 2013-05-20.
//  Copyright (c) 2013 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceDataCell.h"
#import "BasePopoverVC.h"

@class OptionsWindshieldCrackPVC;

@protocol OptionsWindshieldCrackPVCDelegate <NSObject>
- (void)updateSpaWindshieldDataTable:(OptionsWindshieldCrackPVC *)optionsVS editType:(NSString*) editType withServiceCell: (ServiceDataCell*) cell_arg;
@end

@interface OptionsWindshieldCrackPVC : BasePopoverVC {
    
    // delegate variables
    id <OptionsWindshieldCrackPVCDelegate> ADelegate;  // options view controller delegate
    
    // variables
    NSString *serviceType;  // '1st Rock Chip', '2nd Rock Chip', 'Additional Rock Chip', etc..
    NSString *serviceTypeRestorationID;
    NSString *notesAboutRoom;
    float price, priceRate;
    NSInteger quantity;
    
    // outlets
    IBOutlet UILabel *priceLabel;
    IBOutlet UITextField *quantityField;
    
    IBOutlet UIScrollView *scrollViewer;
}

@property (nonatomic, assign) id <OptionsWindshieldCrackPVCDelegate> ADelegate;

@property (assign, readwrite) NSInteger quantity;
@property (assign, readwrite) float price, priceRate;
@property (assign, readwrite) NSString *serviceType, *serviceTypeRestorationID, *notesAboutRoom;

@property (assign, nonatomic) IBOutlet UIScrollView *scrollViewer;
@property (nonatomic, assign) IBOutlet UITextField *quantityField;
@property (nonatomic, assign) IBOutlet UILabel *priceLabel;

-(IBAction) saveOrCancel: (id) sender;
-(IBAction) onChoosingServiceType: (id) sender;
-(IBAction) quantityChanged: (id) sender;

@end
