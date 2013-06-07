//
//  PMSong.h
//  PhoMRE
//
//  Created by Joseph Malandruccolo on 6/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMArtist.h"

@interface PMSong : NSObject

@property (strong, atomic) NSString *name;          //  name of the song
@property (strong, atomic) PMArtist *artist;        //  name of the artist
@property (strong, atomic) NSString *album;         //  albumn
@property (strong, atomic) NSArray *tags;           //  list of 'top tag names' from last.fm API

@end
