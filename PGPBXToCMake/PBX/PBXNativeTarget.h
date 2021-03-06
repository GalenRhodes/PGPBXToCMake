/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXNativeTarget.h
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

#ifndef __PGPBXTOCMAKE_PBXNATIVETARGET__
#define __PGPBXTOCMAKE_PBXNATIVETARGET__

#import "PBXAggregateTarget.h"

@class PBXNativeTargetAttribs;
@class PBXFileReference;
@class PBXTargetDependency;
@class XCConfigurationList;
@class PBXBuildRule;
@class PBXBuildPhase;

typedef NS_ENUM(NSUInteger, PBXProductTypeEnum) {
    PBX_PRODUCT_TYPE_NONE = 0,             //
    PBX_PRODUCT_TYPE_UNKNOWN,              // ***NOT ONE OF THE FOLLOWING***
    PBX_PRODUCT_TYPE_APPLICATION,          // com.apple.product-type.application
    PBX_PRODUCT_TYPE_TOOL,                 // com.apple.product-type.tool
    PBX_PRODUCT_TYPE_LIBRARY_STATIC,       // com.apple.product-type.library.static
    PBX_PRODUCT_TYPE_LIBRARY_DYNAMIC,      // com.apple.product-type.library.dynamic
    PBX_PRODUCT_TYPE_KERNELEXTENSION,      // com.apple.product-type.kernel-extension
    PBX_PRODUCT_TYPE_KERNELEXTENSION_IOKIT // com.apple.product-type.kernel-extension.iokit
};

NS_ASSUME_NONNULL_BEGIN

@interface PBXNativeTarget : PBXAggregateTarget

    @property(nonatomic, readonly) PBXNativeTargetAttribs  *attributes;
    @property(readonly) /*      */ PBXProductTypeEnum      productType;
    @property(readonly) /*      */ NSString                *productTypeDescription;
    @property(readonly) /*      */ PBXFileReference        *productReference;
    @property(readonly) /*      */ NSArray<PBXBuildRule *> *buildRules;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXNATIVETARGET__
