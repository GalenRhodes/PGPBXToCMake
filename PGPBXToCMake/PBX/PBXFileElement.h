/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXFileElement.h
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

#ifndef __PGPBXTOCMAKE_PBXFILEELEMENT_H__
#define __PGPBXTOCMAKE_PBXFILEELEMENT_H__

#import "PBX.h"

typedef NS_ENUM(NSUInteger, PBXSourceTreeEnum) {
    PBX_SRC_TREE_NONE = 0,           // Not in the source tree.
    PBX_SRC_TREE_ABSOLUTE,           // Absolute file path reference outside the project.
    PBX_SRC_TREE_GROUP,              // Inside the source tree.
    PBX_SRC_TREE_SOURCE_ROOT,        // At the root of the source tree.
    PBX_SRC_TREE_BUILT_PRODUCTS_DIR, // In the build directory.
    PBX_SRC_TREE_SDKROOT             // In the SDK build-chain directory.
};

NS_ASSUME_NONNULL_BEGIN

@interface PBXFileElement : PBX

    @property(readonly) NSString          *name;
    @property(readonly) NSString          *sourceTreeDescription;
    @property(readonly) PBXSourceTreeEnum sourceTree;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXFILEELEMENT_H__
