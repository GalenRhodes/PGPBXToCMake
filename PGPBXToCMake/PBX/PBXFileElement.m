/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXFileElement.m
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

#import "PBXFileElement.h"

@implementation PBXFileElement {
    }

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSString *)sourceTreeDescription {
        return self.plistBranch[@"sourceTree"];
    }

    -(NSString *)name {
        return self.plistBranch[@"name"];
    }

    -(PBXSourceTreeEnum)sourceTree {
        PGSWITCH(self.sourceTreeDescription);
            PGCASE(@"<absolute>");
                return PBX_SRC_TREE_ABSOLUTE;
            PGCASE(@"<group>");
                return PBX_SRC_TREE_GROUP;
            PGCASE(@"SOURCE_ROOT");
                return PBX_SRC_TREE_SOURCE_ROOT;
            PGCASE(@"BUILT_PRODUCTS_DIR");
                return PBX_SRC_TREE_BUILT_PRODUCTS_DIR;
            PGCASE(@"SDKROOT");
                return PBX_SRC_TREE_SDKROOT;
            PGDEFAULT;
                return PBX_SRC_TREE_NONE;
        PGSWITCHEND;
    }

@end
