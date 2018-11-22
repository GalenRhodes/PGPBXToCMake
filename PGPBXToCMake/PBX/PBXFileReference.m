/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXFileReference.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 2018-11-19
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

#import "PBXFileReference.h"

@implementation PBXFileReference {
    }

    //  1117D9DC70BE474C3D16B0BA /* NSError+PGError.h */ = {
    //      isa = PBXFileReference;
    //      fileEncoding = 4;
    //      lastKnownFileType = sourcecode.c.h;
    //      path = "NSError+PGError.h";
    //      sourceTree = "<group>";
    // };

    +(instancetype)fileReferenceWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSString *)fileEncoding {
        return self.plistBranch[@"fileEncoding"];
    }

    -(NSString *)lastKnownFileType {
        return self.plistBranch[@"lastKnownFileType"];
    }

    -(NSString *)path {
        return self.plistBranch[@"path"];
    }

    -(NSString *)sourceTree {
        return self.plistBranch[@"sourceTree"];
    }

    -(NSString *)explicitFileType {
        return self.plistBranch[@"explicitFileType"];
    }

    -(BOOL)includeInIndex {
        return ![self.plistBranch[@"includeInIndex"] isEqualToString:@"0"];
    }

@end
