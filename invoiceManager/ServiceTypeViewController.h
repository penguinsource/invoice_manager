//
//  SecondViewController.h
//  invoiceManager
//
//  Created by Mihai on 2013-05-14.
//  Copyright (c) 2013 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsPopoverVC.h"
#import "OptionsMatressPopoverVC.h"
#import "OptionsUpholsteryPopoverVC.h"
#import "OptionsFloodPopoverVC.h"
#import "OptionsAreaRugsPopoverVC.h"
#import "OptionsMiscellaneousPopoverVC.h"
#import "OptionsAutoSpaPVC.h"
#import "OptionsSemiSpaPVC.h"
#import "OptionsAutoDetailPVC.h"
#import "OptionsSemiDetailPVC.h"
#import "OptionsAluminumMetalPVC.h"
#import "OptionsWindshieldCrackPVC.h"
#import "OptionsDuctFurnaceCleanPVC.h"

//#import "ServiceDataCell.h"

@class ServiceTypeViewController;

@protocol SecondViewControllerDelegate <NSObject>
- (void)updateTableSVC:(ServiceTypeViewController *)ServiceTypeViewController;
@end

@interface ServiceTypeViewController : UIViewController <OptionsDuctFurnaceCleanPVCDelegate, OptionsWindshieldCrackPVCDelegate, OptionsAluminumMetalPVCDelegate, OptionsAutoDetailPVCDelegate, OptionsSemiDetailPVCDelegate, OptionsSemiSpaPVCdelegate, OptionsAutoSpaPVCdelegate, OptionsPopoverVCDelegate, OptionsMiscellaneousPopoverVCDelegate, OptionsAreaRugsPopoverVCDelegate, OptionsFloodPopoverVCDelegate, OptionsMatressPopoverVCDelegate, OptionsUpholsteryPopoverVCDelegate, UITableViewDataSource, UITableViewDelegate> {
    // delegate vars
    id <SecondViewControllerDelegate> SVCdelegate;
    
    // variables
    NSString *VCServiceNameType;
    NSInteger dataTableNoOfRows;
    UIPopoverController *popover;
    NSMutableArray *serviceDataCellArray;
    NSString *selectedAutoSpaType;
    
    // outlets
    IBOutlet UIView *carpetTypeSelection;
    IBOutlet UILabel *subserviceSelectionLabel;
    
    IBOutlet UITableView *dataTable;
    IBOutlet UILabel *addServiceLabel, *serviceTitleLabel;
    IBOutlet UIButton *backBtn;
    IBOutlet UIImageView *selectedType;
    IBOutlet UIButton *addServiceBtn;
    IBOutlet UIButton *selectedAutoSpaTypeBtn;
    NSMutableArray *uilabelsArray;
    
    IBOutlet UILabel *col1Name, *col2Name, *col3Name, *col4Name;
}

@property (nonatomic, assign) id <SecondViewControllerDelegate> SVCdelegate;

@property (assign, readwrite) NSMutableArray *uilabelsArray;
@property (assign, readwrite) NSMutableArray *serviceDataCellArray;
@property (assign, readwrite) NSInteger dataTableNoOfRows;
@property (assign, readwrite) NSString *VCServiceNameType, *selectedAutoSpaType;
@property (nonatomic, assign) UIPopoverController *popover;
@property (nonatomic, assign) UIButton *backBtn;

@property (assign, readwrite) IBOutlet UIButton *addServiceBtn, *selectedAutoSpaTypeBtn;
@property (assign, readwrite) IBOutlet UIView *carpetTypeSelection;
@property (assign, readwrite) IBOutlet UILabel *addServiceLabel, *serviceTitleLabel, *subserviceSelectionLabel;
@property (assign, readwrite) IBOutlet UILabel *col1Name, *col2Name, *col3Name, *col4Name;
@property (assign, readwrite) IBOutlet UIImageView *selectedType;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
//-(IBAction) goBackCUSTOMACTION;
-(IBAction) removeRow: (id)sender;
-(IBAction) onChoosingType: (id) sender;
-(IBAction) displayOptionsPopoverVC: (id) sender;
-(IBAction) gotoNextView;
-(IBAction) gotoLastView;
@end
