/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXGroup.m
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

#import "PBXGroup.h"
#import "PBXFileReference.h"

@implementation PBXGroup {
    }

//    83CC448D1E0B037700DDE50D /* Products */ = {
//        isa        = PBXGroup;
//        children   = (83CC448C1E0B037700DDE50D /* Rubicon.framework */, 83CC44951E0B037700DDE50D /* RubiconTests.xctest */, 8353A99321419B190017D1DE /* TypeSizes */,);
//        name       = Products;
//        sourceTree = "<group>";
//    };

    @synthesize children = _children;
    @synthesize subGroups = _subGroups;
    @synthesize others = _others;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
            PBXArray plistChildren = self.plistBranch[@"children"];
            _children  = [NSMutableArray arrayWithCapacity:plistChildren.count ?: 1];
            _subGroups = [NSMutableArray arrayWithCapacity:plistChildren.count ?: 1];
            _others    = [NSMutableArray arrayWithCapacity:plistChildren.count ?: 1];

            for(NSString *id in plistChildren) {
                PBX *o = [PBX objectFromID:id plist:plist];
                if(o) {
                    PGSWITCH(o.pbxISA);
                        PGCASE(NSStringFromClass([PBXGroup class]));
                            ADDOBJ(_subGroups, o);
                            break;
                        PGCASE(NSStringFromClass([PBXFileReference class]));
                            ADDOBJ(_children, o);
                            break;
                        PGDEFAULT;
                            ADDOBJ(_others, o);
                            break;
                    PGSWITCHEND;
                }
            }
        }

        return self;
    }

    +(instancetype)pbxGroupWithID:(NSString *)pbxID plist:(PBXDict)plist error:(NSError **)error {
        return [[self alloc] initWithID:pbxID plist:plist error:error];
    }

    -(NSString *)name {
        return self.plistBranch[@"name"];
    }

    -(NSString *)sourceTree {
        return self.plistBranch[@"sourceTree"];
    }

@end
