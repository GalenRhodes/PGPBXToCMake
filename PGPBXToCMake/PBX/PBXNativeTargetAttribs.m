/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXNativeTargetAttribs.m
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

#import "PBXNativeTargetAttribs.h"

@implementation PBXNativeTargetAttribs {
    }

    @synthesize attributes = _attributes;

    +(instancetype)nativeTargetAttributesWithAttributes:(PBXDict)attrs {
        return [[self alloc] initWithAttributes:attrs];
    }

    -(instancetype)initWithAttributes:(PBXDict)attrs {
        self = [super init];

        if(self) {
            _attributes = attrs;
        }

        return self;
    }

    -(NSString *)createdOnToolsVersion {
        return _attributes[@"CreatedOnToolsVersion"];
    }

    -(NSString *)developmentTeam {
        return _attributes[@"DevelopmentTeam"];
    }

    -(NSString *)provisioningStyle {
        return _attributes[@"ProvisioningStyle"];
    }

@end
