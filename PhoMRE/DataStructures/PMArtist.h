//
//  PMArtist.h
//  PhoMRE
//
//  Created by Joseph Malandruccolo on 6/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMArtist : NSObject

@property (strong, atomic) NSString *name;               //  artist name
@property (strong, atomic) NSArray *similarArtists;      //  array of similar artists
@property (strong, atomic) NSArray *tags;                //  tags

@end
