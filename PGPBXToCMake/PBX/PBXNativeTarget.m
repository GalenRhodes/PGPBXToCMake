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
#import "PBXBuildRule.h"

@implementation PBXNativeTarget {
    }

    @synthesize attributes = _attributes;
    @synthesize productReference = _productReference;
    @synthesize buildRules = _buildRules;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            _productReference = [PBX objectFromID:self.plistBranch[@"productReference"] plist:plist];
            _buildRules       = pbxObjectsFromIDs(@"buildRules", pbxID, plist);
        }

        return self;
    }

    -(PBXProductTypeEnum)productType {
        NSString *desc = self.productTypeDescription;

        if(desc.length) {
            PGSWITCH(desc);
                PGCASE(@"com.apple.product-type.application");
                    return PBX_PRODUCT_TYPE_APPLICATION;
                PGCASE(@"com.apple.product-type.tool");
                    return PBX_PRODUCT_TYPE_TOOL;
                PGCASE(@"com.apple.product-type.library.static");
                    return PBX_PRODUCT_TYPE_LIBRARY_STATIC;
                PGCASE(@"com.apple.product-type.library.dynamic");
                    return PBX_PRODUCT_TYPE_LIBRARY_DYNAMIC;
                PGCASE(@"com.apple.product-type.kernel-extension");
                    return PBX_PRODUCT_TYPE_KERNELEXTENSION;
                PGCASE(@"com.apple.product-type.kernel-extension.iokit");
                    return PBX_PRODUCT_TYPE_KERNELEXTENSION_IOKIT;
                PGDEFAULT;
                    return PBX_PRODUCT_TYPE_UNKNOWN;
            PGSWITCHEND;
        }
        else {
            return PBX_PRODUCT_TYPE_NONE;
        }
    }

    -(NSString *)productTypeDescription {
        return self.plistBranch[@"productType"];
    }

    -(void)setAttributes:(PBXNativeTargetAttribs *)attribs {
        _attributes = attribs;
    }

@end
