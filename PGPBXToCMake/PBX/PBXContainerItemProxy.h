/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXContainerItemProxy.h
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

#ifndef __PGPBXTOCMAKE_PBXCONTAINERITEMPROXY__
#define __PGPBXTOCMAKE_PBXCONTAINERITEMPROXY__

#import <Rubicon/Rubicon.h>
#import "PBX.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * This class seems to allow one PBX object to stand in (be a proxy for) another PBX object.
 */
@interface PBXContainerItemProxy : PBX

    @property(readonly) NSInteger proxyType;
    @property(readonly) NSString  *remoteInfo;
    @property(readonly) PBX       *remoteGlobalIDString;
    @property(readonly) PBX       *containerPortal;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXCONTAINERITEMPROXY__
