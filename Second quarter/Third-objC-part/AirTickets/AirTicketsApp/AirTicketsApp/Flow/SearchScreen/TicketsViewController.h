//
//  TicketsViewController.h
//  AirTicketsApp
//
//  Created by artem.ustinov on 01.08.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController

- (instancetype)initWithTickets:(NSArray *)tickets;

@end

NS_ASSUME_NONNULL_END
