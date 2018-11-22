/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXTargetDependency.m
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

#import "PBXTargetDependency.h"
#import "PBXContainerItemProxy.h"
#import "PBXNativeTarget.h"

@implementation PBXTargetDependency {
    }

//    8353A99B21419B270017D1DE /* PBXTargetDependency */ = {
//        isa         = PBXTargetDependency;
//        target      = 83CC448B1E0B037600DDE50D /* Rubicon */;
//        targetProxy = 8353A99A21419B270017D1DE /* PBXContainerItemProxy */;
//    };

    @synthesize targetProxy = _targetProxy;
    @synthesize target = _target;

    +(instancetype)targetDependencyWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _targetProxy = [PBXContainerItemProxy containerItemProxyWithID:self.plistBranch[@"targetProxy"] plist:plist];

            NSString *targetID = self.plistBranch[@"target"];
            NSString *oisa     = DICT(self.plistObjects[targetID])[@"isa"];

            if([NSStringFromClass([PBXNativeTarget class]) isEqualToString:oisa]) _target = [PBXNativeTarget pbxNativeTargetWithID:targetID plist:plist];
            else if([[NSRegularExpression regularExpressionWithPattern:@"PBX\\w+?Target"] matches:oisa]) _target = [PBXTarget targetWithID:targetID plist:plist];
        }

        return self;
    }

@end
