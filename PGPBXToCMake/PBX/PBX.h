/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBX.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 11/19/18
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

#ifndef __PGPBXTOCMAKE_PBX_H__
#define __PGPBXTOCMAKE_PBX_H__

#import <Rubicon/Rubicon.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSMutableDictionary<NSString *, id> *PBXCache;
typedef NSDictionary<NSString *, id>        *PBXDict;
typedef NSArray<NSString *>                 *PBXArray;

@interface PBX : NSObject

    @property(readonly) /* */ NSString *pbxISA;      /* What is the type of this object.               */
    @property(readonly, copy) NSString *pbxID;       /* What is it's serialization ID.                 */
    @property(readonly) /* */ PBXDict  plist;        /* A reference to the entire plist. Not a copy.   */
    @property(readonly) /* */ PBXDict  plistObjects; /* The branch of the plist with all the objects.  */
    @property(readonly) /* */ PBXDict  plistBranch;  /* The branch of the plist with just this object. */

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

    +(id)objectFromID:(NSString *)pbxID plist:(PBXDict)plist;

@end

#define DICT(o)         ((PBXDict)(o))
#define BOOLVAL(k)      (![((NSString *)self.plistBranch[k]) isEqualToString:@"0"])
#define INTVAL(k)       (((NSString *)self.plistBranch[k]).integerValue)
#define ADDOBJ(a, o)    ({if(o) [((NSMutableArray *)a) addObject:o];})

FOUNDATION_EXPORT NSString *const PBXCacheID;
FOUNDATION_EXPORT NSString *const PBXRootID;

FOUNDATION_EXPORT NSArray *pbxObjectsFromIDs(NSString *key, NSString *pbxID, PBXDict plist);

NS_ASSUME_NONNULL_END;

#endif // __PGPBXTOCMAKE_PBX_H__
