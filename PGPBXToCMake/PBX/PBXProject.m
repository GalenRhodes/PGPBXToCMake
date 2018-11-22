/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXProject.m
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

#import "PBXProject.h"
#import "XCConfigurationList.h"
#import "PBXGroup.h"
#import "PBXNativeTarget.h"

@implementation PBXProject {
    }

    @synthesize buildConfigurationList = _buildConfigurationList;
    @synthesize mainGroup = _mainGroup;
    @synthesize productRefGroup = _productRefGroup;
    @synthesize targets = _targets;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _buildConfigurationList = [XCConfigurationList xcConfigListWithID:self.plistBranch[@"buildConfigurationList"] plist:plist error:error];
            _mainGroup              = [PBXGroup pbxGroupWithID:self.plistBranch[@"mainGroup"] plist:plist error:error];
            _productRefGroup        = [PBXGroup pbxGroupWithID:self.plistBranch[@"productRefGroup"] plist:plist error:error];

            PBXArray pTargets = self.plistBranch[@"targets"];
            _targets = [NSMutableArray arrayWithCapacity:pTargets.count ?: 1];

            for(NSString *targetID in pTargets) {
                PBXNativeTarget *nativeTarget = [PBXNativeTarget pbxNativeTargetWithID:targetID plist:plist];
                if(nativeTarget) ADDOBJ(_targets, nativeTarget);
            }
        }

        return self;
    }

    +(instancetype)pbxProjectWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        return [[self alloc] initWithID:pbxID plist:plist error:error];
    }

    -(PBXDict)attributes {
        return self.plist[@"attributes"];
    }

    -(NSString *)compatibilityVersion {
        return self.plist[@"compatibilityVersion"];
    }

    -(NSString *)developmentRegion {
        return self.plist[@"developmentRegion"];
    }

    -(BOOL)hasScannedForEncodings {
        return BOOLVAL(@"hasScannedForEncodings");
    }

    -(PBXArray)knownRegions {
        return self.plist[@"knownRegions"];
    }

    -(NSString *)projectDirPath {
        return self.plist[@"projectDirPath"];
    }

    -(NSString *)projectRoot {
        return self.plist[@"projectRoot"];
    }

@end
