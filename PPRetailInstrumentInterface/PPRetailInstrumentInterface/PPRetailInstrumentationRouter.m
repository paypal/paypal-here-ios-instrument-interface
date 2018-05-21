//
//  PPRetailInstrumentationRouter.m
//  PPRetailInstrumentInterafce
//
//  Created by Tilahun, Yoseph on 5/14/18.
//  Copyright © 2018 Tilahun, Yoseph. All rights reserved.
//

#import "PPRetailInstrumentationRouter.h"


@implementation PPRetailInstrumentationRouter  {

    NSLock *_lock;
}
- (instancetype)init
{
    if ((self = [super init]))
    {
        self.logService  = [[NSMutableArray alloc] init];
            _lock        = [[NSLock alloc] init];
    }
    return self;
}



-(void)reportTransactionStart:(NSString *)name info:(NSDictionary *)info {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [_lock lock];
        for (id loggingService in self.logService ){
            if ([loggingService conformsToProtocol:@protocol(PPRetailInstrumentationDelegate)]) {
                [loggingService reportTransactionStart: name info:info];
            }
        }
        [_lock unlock];
    });
}

-(void)reportTransactionFinish:(NSString *)name info:(NSDictionary *)info {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [_lock lock];
        for (id loggingService in self.logService ){
            if ([loggingService conformsToProtocol:@protocol(PPRetailInstrumentationDelegate)]) {
                [loggingService reportTransactionFinish: name info:info];
            }
        }
        [_lock unlock];
    });
}

-(void)reportTransactionFailure:(NSString *)name info:(NSDictionary *)info {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [_lock lock];
        for (id loggingService in self.logService ){
            if ([loggingService conformsToProtocol:@protocol(PPRetailInstrumentationDelegate)]) {
                [loggingService reportTransactionFailure: name info:info];
            }
        }
        [_lock unlock];
    });
}

-(void)addLoggingService:(id <PPRetailInstrumentationDelegate>)loggingService {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_lock lock];
        if(loggingService) {
            [self.logService addObject:loggingService];
        }
        [_lock unlock];
    });

}

-(void)removeLoggingService:(id <PPRetailInstrumentationDelegate>)loggingService {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_lock lock];
        if (loggingService && [self.logService containsObject:loggingService]) {
            [self.logService removeObject:loggingService];
        }
        [_lock unlock];
    });

}

@end
