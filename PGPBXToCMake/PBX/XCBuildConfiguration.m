/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: XCBuildConfiguration.m
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

#import "XCBuildConfiguration.h"

@implementation XCBuildConfiguration {
    }

//    83CC44A51E0B037700DDE50D /* Release */ = {
//        isa           = XCBuildConfiguration;
//        buildSettings = {
//                COMBINE_HIDPI_IMAGES = YES;
//                DEVELOPMENT_TEAM = Q5XWZ7S7E9;
//                INFOPLIST_FILE = RubiconTests/Info.plist;
//                LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/../Frameworks @loader_path/../Frameworks";
//                PRODUCT_BUNDLE_IDENTIFIER = com.projectgalen.RubiconTests;
//                PRODUCT_NAME = "$(TARGET_NAME)";
//        };
//        name          = Release;
//    };

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSString *)name {
        return self.plistBranch[@"name"];
    }

    -(PBXArray)buildSettings {
        return self.plistBranch[@"buildSettings"];
    }

@end
