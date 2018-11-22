/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXCopyFilesBuildPhase.m
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

#import "PBXCopyFilesBuildPhase.h"

@implementation PBXCopyFilesBuildPhase {
    }

///* Begin PBXCopyFilesBuildPhase section */
//    8303C61E21A3173200B38FE2 /* CopyFiles */ = {
//        isa             = PBXCopyFilesBuildPhase;
//        buildActionMask = 2147483647;
//        dstPath = /usr / share / man / man1 / ;
//        dstSubfolderSpec                   = 0;
//        files                              = ();
//        runOnlyForDeploymentPostprocessing = 1;
//    };
///* End PBXCopyFilesBuildPhase section */

    +(instancetype)copyFilesBuildPhaseWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSInteger)dstSubfolderSpec {
        return INTVAL(@"dstSubfolderSpec");
    }

    -(NSString *)dstPath {
        return self.plistBranch[@"dstPath"];
    }

@end
