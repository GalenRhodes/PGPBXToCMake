/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXShellScriptBuildPhase.m
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

#import "PBXShellScriptBuildPhase.h"

@implementation PBXShellScriptBuildPhase {
    }

//    4D22DBAE11674009007AF714 /* ShellScript */ = {
//        isa                                = PBXShellScriptBuildPhase;
//        buildActionMask                    = 2147483647;
//        files                              = ();
//        inputPaths                         = ();
//        outputPaths                        = ();
//        shellPath = /bin / sh;
//        shellScript = "./fix_references.sh";
//        runOnlyForDeploymentPostprocessing = 0;
//    };

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(PBXArray)inputPaths {
        return self.plistBranch[@"inputPaths"];
    }

    -(PBXArray)outputPaths {
        return self.plistBranch[@"outputPaths"];
    }

    -(NSString *)shellPath {
        return self.plistBranch[@"shellPath"];
    }

    -(NSString *)shellScript {
        return self.plistBranch[@"shellScript"];
    }

@end
