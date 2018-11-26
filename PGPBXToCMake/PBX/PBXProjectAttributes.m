/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXProjectAttributes.m
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

#import "PBXProjectAttributes.h"
#import "PBXNativeTarget.h"
#import "PBXNativeTargetAttribs.h"

@interface PBXNativeTarget()

    @property(nonatomic) PBXNativeTargetAttribs *attributes;

@end

@implementation PBXProjectAttributes {
    }

    @synthesize otherAttributes = _otherAttributes;

    -(instancetype)initWithAttributes:(PBXDict)otherAttributes plist:(PBXDict)plist {
        self = [super init];

        if(self) {
            _otherAttributes = otherAttributes;
            PBXDict targetAttr = _otherAttributes[@"TargetAttributes"];

            if(targetAttr.count) {
                for(NSString *tid in targetAttr.allKeys) {
                    PBXNativeTarget *nt = [PBX objectFromID:tid plist:plist];
                    if(nt) nt.attributes = [PBXNativeTargetAttribs nativeTargetAttributesWithAttributes:targetAttr[tid]];
                }
            }
        }

        return self;
    }

    +(instancetype)attributesWithAttributes:(PBXDict)otherAttributes plist:(PBXDict)plist {
        return [[self alloc] initWithAttributes:otherAttributes plist:plist];
    }

    -(NSString *)lastUpgradeCheck {
        return self.otherAttributes[@"LastUpgradeCheck"];
    }

    -(NSString *)organizationName {
        return self.otherAttributes[@"ORGANIZATIONNAME"];
    }

@end
