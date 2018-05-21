//
//  PPRetailInstrumentationDelegate.h
//  PPRetailInstrumentInterafce
//
//  Created by Tilahun, Yoseph on 5/14/18.
//  Copyright © 2018 Tilahun, Yoseph. All rights reserved.
//

#ifndef PPRetailInstrumentationDelegate_h
#define PPRetailInstrumentationDelegate_h
@protocol PPRetailInstrumentationDelegate

-(void)reportTransactionStart:(NSString *)name info:(NSDictionary *)info;
-(void)reportTransactionFinish:(NSString *)name info:(NSDictionary *)info;
-(void)reportTransactionFailure:(NSString *)name info:(NSDictionary *)info;


@end

#endif /* PPRetailInstrumentationDelegate_h */
