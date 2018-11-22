/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: XCConfigurationList.m
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

#import "XCConfigurationList.h"
#import "XCBuildConfiguration.h"

@implementation XCConfigurationList {
    }

//    8353A99921419B190017D1DE /* Build configuration list for PBXNativeTarget "TypeSizes" */ = {
//        isa                           = XCConfigurationList;
//        buildConfigurations           = (8353A99721419B190017D1DE /* Debug */, 8353A99821419B190017D1DE /* Release */,);
//        defaultConfigurationIsVisible = 0;
//        defaultConfigurationName      = Release;
//    };

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            PBXArray configs = self.plistBranch[@"buildConfigurations"];
            _buildConfigurations = [NSMutableArray arrayWithCapacity:configs.count ?: 1];

            for(NSString *id in configs) {
                XCBuildConfiguration *o = [XCBuildConfiguration buildConfigurationWithID:id plist:plist];
                if(o) ADDOBJ(_buildConfigurations, o);
            }
        }

        return self;
    }

    +(instancetype)xcConfigListWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        return [[self alloc] initWithID:pbxID plist:plist error:error];
    }

    -(NSString *)defaultConfigurationName {
        return self.plist[@"defaultConfigurationName"];
    }

    -(BOOL)defaultConfigurationIsVisible {
        NSString *v = self.plist[@"defaultConfigurationIsVisible"];
        return (v && ![@"0" isEqualToString:v]);
    }

@end
