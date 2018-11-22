/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXBuildRule.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 11/21/18
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

#import "PBXBuildRule.h"

@implementation PBXBuildRule {
    }

    +(instancetype)buildRuleWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            // TODO: Finish...
        }

        return self;
    }

///* Begin PBXBuildRule section */
//    8364C2B421A5EB0D004EDC8D /* PBXBuildRule */ = {
//        isa                      = PBXBuildRule;
//        compilerSpec             = com.apple.compilers.proxy.script;
//        fileType                 = text.plist.strings;
//        script                   = "# builtin-copyStrings\n";
//        isEditable               = 1;
//        outputFiles              = ("$(DERIVED_FILE_DIR)/newOutputFile",);
//        outputFilesCompilerFlags = ("-a",);
//    };
///* End PBXBuildRule section */

    -(BOOL)isEditable {
        return BOOLVAL(@"isEditable");
    }

    -(NSString *)compilerSpec {
        return self.plistBranch[@"compilerSpec"];
    }

    -(NSString *)fileType {
        return self.plistBranch[@"fileType"];
    }

    -(NSString *)script {
        return self.plistBranch[@"script"];
    }

    -(PBXArray)outputFiles {
        return self.plistBranch[@"outputFiles"];
    }

    -(PBXArray)outputFilesCompilerFlags {
        return self.plistBranch[@"outputFilesCompilerFlags"];
    }

@end
