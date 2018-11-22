/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXNativeTarget.m
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

#import "PBXNativeTarget.h"
#import "PBXFileReference.h"
#import "XCConfigurationList.h"
#import "PBXSourcesBuildPhase.h"
#import "PBXBuildRule.h"

@implementation PBXNativeTarget {
    }

    @synthesize attributes = _attributes;
    @synthesize productReference = _productReference;
    @synthesize buildConfigurationList = _buildConfigurationList;
    @synthesize buildPhases = _buildPhases;
    @synthesize buildRules = _buildRules;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _productReference       = [PBXFileReference fileReferenceWithID:self.plistBranch[@"productReference"] plist:plist];
            _buildConfigurationList = [XCConfigurationList xcConfigListWithID:self.plistBranch[@"buildConfigurationList"] plist:plist error:nil];

            PBXArray plistBuildPhases = self.plistBranch[@"buildPhases"];
            _buildPhases = [NSMutableArray arrayWithCapacity:(plistBuildPhases.count ?: 1)];

            for(NSString *id in plistBuildPhases) {
                PBXSourcesBuildPhase *sbp = [PBXSourcesBuildPhase sourcesBuildPhaseWithID:id plist:plist];
                if(sbp) ADDOBJ(_buildPhases, sbp);
            }

            PBXArray plistRules = self.plistBranch[@"buildRules"];
            _buildRules = [NSMutableArray arrayWithCapacity:(plistRules.count ?: 1)];

            for(NSString *id in plistRules) {
                PBXBuildRule *rule = [PBXBuildRule buildRuleWithID:id plist:plist];
                if(rule) ADDOBJ(_buildRules, rule);
            }
        }

        return self;
    }

    +(instancetype)nativeTargetWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(NSString *)productName {
        return self.plistBranch[@"productName"];
    }

    -(NSString *)productType {
        return self.plistBranch[@"productType"];
    }

    -(void)setAttributes:(PBXNativeTargetAttribs *)attribs {
        _attributes = attribs;
    }

@end
