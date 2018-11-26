/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXRoot.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 11/26/18
 *
 * Copyright © 2018 Project Galen. All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *//************************************************************************/

#import "PBXRoot.h"

@implementation PBXRoot {
    }

    -(instancetype)initWithPlist:(PBXDict)plist {
        self = [super initWithID:PBXRootID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSString *)pbxISA {
        return NSStringFromClass(PBXRoot.class);
    }

    -(NSInteger)archiveVersion {
        return INTVAL(@"archiveVersion");
    }

    -(NSInteger)objectVersion {
        return INTVAL(@"objectVersion");
    }

@end
