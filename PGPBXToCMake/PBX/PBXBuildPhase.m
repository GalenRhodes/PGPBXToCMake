/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXBuildPhase.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 11/22/18
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

#import "PBXBuildPhase.h"
#import "PBXBuildFile.h"

@implementation PBXBuildPhase {
    }

//    8353A99121419B190017D1DE /* CopyFiles */ = {
//        isa             = PBXCopyFilesBuildPhase;
//        buildActionMask = 2147483647;
//        dstPath = /usr / share / man / man1 / ;
//        dstSubfolderSpec                   = 0;
//        files                              = ();
//        runOnlyForDeploymentPostprocessing = 1;
//    };
//    8353A99021419B190017D1DE /* Frameworks */ = {
//        isa                                = PBXFrameworksBuildPhase;
//        buildActionMask                    = 2147483647;
//        files                              = (83DBE563216E698800306C81 /* libiconv.tbd in Frameworks */, 8353A99C21419B440017D1DE /* Rubicon.framework in Frameworks */,);
//        runOnlyForDeploymentPostprocessing = 0;
//    };
//    838950C020CEF2E900997982 /* Headers */ = {
//        isa                                = PBXHeadersBuildPhase;
//        buildActionMask                    = 2147483647;
//        files                              = (838950C120CEF2FD00997982 /* CommonBaseClass.h in Headers */, 838950C220CEF2FD00997982 /* PGXMLParserDelegateTest.h in Headers */, 1117D51944FF1968C96F0B00 /* PGNSXMLParserDelegateTest.h in Headers */,);
//        runOnlyForDeploymentPostprocessing = 0;
//    };
//    83CC448A1E0B037600DDE50D /* Resources */ = {
//        isa                                = PBXResourcesBuildPhase;
//        buildActionMask                    = 2147483647;
//        files                              = (1117DDB86452C586CB24951D /* Localizable.strings in Resources */,);
//        runOnlyForDeploymentPostprocessing = 0;
//    };
//    8353A98F21419B190017D1DE /* Sources */ = {
//        isa                                = PBXSourcesBuildPhase;
//        buildActionMask                    = 2147483647;
//        files                              = (8353A99621419B190017D1DE /* main.m in Sources */, 1117D87B6B8CBE1317E85BF9 /* MyDelegate.m in Sources */, 1117D9D757575DE46BE0E9C1 /* SmallTests.m in Sources */, 1117D100A720DC0BDCCD3FD2 /* MyNSDelegate.m in Sources */,);
//        runOnlyForDeploymentPostprocessing = 0;
//    };

    @synthesize files = _files;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            PBXArray pbxFiles = self.plistBranch[@"files"];
            _files = [NSMutableArray arrayWithCapacity:(pbxFiles.count ?: 1)];

            for(NSString *id in pbxFiles) {
                PBXBuildFile *o = [PBXBuildFile buildFileWithID:id plist:plist];
                if(o) ADDOBJ(_files, o);
            }
        }

        return self;
    }

    -(BOOL)runOnlyForDeploymentPostprocessing {
        return BOOLVAL(@"runOnlyForDeploymentPostprocessing");
    }

    -(NSInteger)buildActionMask {
        return INTVAL(@"buildActionMask");
    }

@end
