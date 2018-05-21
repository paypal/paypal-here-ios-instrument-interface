//
//  PPRetailInstrumentationRouter.h
//  PPRetailInstrumentInterafce
//
//  Created by Tilahun, Yoseph on 5/14/18.
//  Copyright © 2018 Tilahun, Yoseph. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPRetailInstrumentationDelegate.h"

@interface PPRetailInstrumentationRouter : NSObject <PPRetailInstrumentationDelegate>
@property (strong, nonatomic) NSMutableArray *logService;
-(void)addLoggingService:(id <PPRetailInstrumentationDelegate>)logService;
-(void)removeLoggingService:(id <PPRetailInstrumentationDelegate>)loggingService;

@end
