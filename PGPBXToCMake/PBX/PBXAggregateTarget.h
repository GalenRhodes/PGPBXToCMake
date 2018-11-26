/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXAggregateTarget.h
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

#ifndef __PGPBXTOCMAKE_PBXAGGREGATETARGET_H__
#define __PGPBXTOCMAKE_PBXAGGREGATETARGET_H__

#import "PBXTarget.h"

@class PBXBuildPhase;
@class XCConfigurationList;

NS_ASSUME_NONNULL_BEGIN

@interface PBXAggregateTarget : PBXTarget

    @property(readonly) NSString                 *productName;
    @property(readonly) XCConfigurationList      *buildConfigurationList;
    @property(readonly) NSArray<PBXBuildPhase *> *buildPhases;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist;

@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXAGGREGATETARGET_H__
