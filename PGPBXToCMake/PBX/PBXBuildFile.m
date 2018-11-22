/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXBuildFile.m
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

#import "PBXBuildFile.h"
#import "PBXFileReference.h"

@implementation PBXBuildFile {
    }
// 1117D1F84B392BF54403366B /* PBX.m in Sources */ = {isa = PBXBuildFile; fileRef = 1117D979FD9FB4CE9BF430A3 /* PBX.m */; settings = {ATTRIBUTES = (Private, ); }; };

    @synthesize visibility = _visibility;
    @synthesize file = _file;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _file       = [PBXFileReference fileReferenceWithID:self.plistBranch[@"fileRef"] plist:plist];
            _visibility = PBXFileVisibilityProject;

            [self setVisibility:self.attributes];
        }

        return self;
    }

    +(instancetype)buildFileWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(void)setVisibility:(PBXArray)attr {
        if(attr.count) {
            for(NSString *a in attr) {
                if([a isEqualToString:@"Private"]) _visibility = PBXFileVisibilityPrivate;
                else if([a isEqualToString:@"Public"]) _visibility = PBXFileVisibilityPublic;
                else if([a isEqualToString:@"Project"]) _visibility = PBXFileVisibilityProject;
            }
        }
    }

    -(PBXArray)attributes {
        return self.settings[@"ATTRIBUTES"];
    }

    -(PBXDict)settings {
        return self.plistBranch[@"settings"];
    }

@end
