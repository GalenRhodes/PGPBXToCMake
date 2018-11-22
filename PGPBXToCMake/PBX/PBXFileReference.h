/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXFileReference.h
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

#ifndef __PGPBXTOCMAKE_PBXFILEREFERENCE__
#define __PGPBXTOCMAKE_PBXFILEREFERENCE__

#import <Rubicon/Rubicon.h>
#import "PBX.h"

NS_ASSUME_NONNULL_BEGIN

@interface PBXFileReference : PBX

    @property(readonly) NSString *fileEncoding;      //      fileEncoding = 4
    @property(readonly) NSString *lastKnownFileType; //      lastKnownFileType = sourcecode.c.h
    @property(readonly) NSString *path;              //      path = "NSError+PGError.h"
    @property(readonly) NSString *sourceTree;        //      sourceTree = "<group>"
    @property(readonly) NSString *explicitFileType;
    @property(readonly) BOOL     includeInIndex;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

    +(instancetype)fileReferenceWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXFILEREFERENCE__
