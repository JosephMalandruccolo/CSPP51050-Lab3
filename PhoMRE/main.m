//
//  main.m
//  PhoMRE
//
//  Created by Joseph Malandruccolo on 6/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMControl.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        PMControl *controller = [[PMControl alloc] init];
        [controller start];
        
    }
    return 0;
}

