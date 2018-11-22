/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXContainerItemProxy.m
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

#import "PBXContainerItemProxy.h"

@implementation PBXContainerItemProxy {
    }

//    8353A99A21419B270017D1DE /* PBXContainerItemProxy */ = {
//        isa                  = PBXContainerItemProxy;
//        containerPortal      = 83CC44831E0B037600DDE50D /* Project object */;
//        proxyType            = 1;
//        remoteGlobalIDString = 83CC448B1E0B037600DDE50D;
//        remoteInfo           = Rubicon;
//    };

    @synthesize remoteGlobalIDString = _remoteGlobalIDString;
    @synthesize containerPortal = _containerPortal;

    +(instancetype)containerItemProxyWithID:(NSString *)pbxID plist:(PBXDict)plist {
        return [[self alloc] initWithID:pbxID plist:plist];
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _containerPortal      = [PBX objectFromID:self.plistBranch[@"containerPortal"] plist:plist];
            _remoteGlobalIDString = [PBX objectFromID:self.plistBranch[@"remoteGlobalIDString"] plist:plist];
        }

        return self;
    }

    -(NSString *)proxyType {
        return self.plistBranch[@"proxyType"];
    }

    -(NSString *)remoteInfo {
        return self.plistBranch[@"remoteInfo"];
    }

@end
