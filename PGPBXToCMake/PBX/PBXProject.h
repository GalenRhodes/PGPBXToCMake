/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXProject.h
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

#ifndef __PGPBXTOCMAKE_PBXPROJECT__
#define __PGPBXTOCMAKE_PBXPROJECT__

#import "PBX.h"

@class XCConfigurationList;
@class PBXGroup;
@class PBXNativeTarget;
@class PBXProjectAttributes;
@class PBXRoot;

NS_ASSUME_NONNULL_BEGIN

@interface PBXProject : PBX

    @property(readonly) NSString                   *compatibilityVersion;
    @property(readonly) NSString                   *developmentRegion;
    @property(readonly) BOOL                       hasScannedForEncodings;
    @property(readonly) PBXArray                   knownRegions;
    @property(readonly) NSString                   *projectDirPath;
    @property(readonly) NSString                   *projectRoot;
    @property(readonly) XCConfigurationList        *buildConfigurationList;
    @property(readonly) PBXGroup                   *mainGroup;
    @property(readonly) PBXGroup                   *productRefGroup;
    @property(readonly) NSArray<PBXNativeTarget *> *targets;
    @property(readonly) PBXProjectAttributes       *attributes;
    @property(readonly) PBXRoot                    *root;

    +(instancetype)projectWithPlist:(PBXDict)plist;

    +(instancetype)projectWithInputStream:(NSInputStream *)inputStream error:(NSError **)error;

    +(instancetype)projectWithFileAtPath:(NSString *)filepath error:(NSError **)error;

    +(instancetype)projectWithURL:(NSURL *)url error:(NSError **)error;
@end

NS_ASSUME_NONNULL_END

#endif // __PGPBXTOCMAKE_PBXPROJECT__
