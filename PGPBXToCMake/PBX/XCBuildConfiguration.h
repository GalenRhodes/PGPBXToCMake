/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: XCBuildConfiguration.h
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

#ifndef __PGPBXTOCMAKE_XCBUILDCONFIGURATION__
#define __PGPBXTOCMAKE_XCBUILDCONFIGURATION__

#import "PBX.h"

NS_ASSUME_NONNULL_BEGIN

@interface XCBuildConfiguration : PBX

    @property(readonly) NSString *name;
    @property(readonly) PBXArray buildSettings;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_XCBUILDCONFIGURATION__
