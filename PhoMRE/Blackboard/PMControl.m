//
//  PMControl.m
//  PhoMRE
//
//  Created by Joseph Malandruccolo on 6/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PMControl.h"

@implementation PMControl

- (void) start
{
    NSLog(@"Ask me for a recommendation based on a track of your choosing:");
    NSLog(@"****artist:");
    
    char artistWord[50];
    scanf("%49s", artistWord);
    
    //  convert C string to NSString, trimming the trailing newline character
    NSString *aristWordObject = [[NSString stringWithCString:artistWord encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSLog(@"You entered %@", aristWordObject);
    
}

@end
