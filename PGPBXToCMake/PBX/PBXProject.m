/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXProject.m
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

#import "PBXProject.h"
#import "XCConfigurationList.h"
#import "PBXGroup.h"
#import "PBXProjectAttributes.h"
#import "PBXRoot.h"

@implementation PBXProject {
    }

    @synthesize buildConfigurationList = _buildConfigurationList;
    @synthesize mainGroup = _mainGroup;
    @synthesize productRefGroup = _productRefGroup;
    @synthesize targets = _targets;
    @synthesize attributes = _attributes;

    -(instancetype)initWithPlist:(PBXDict)plist {
        if(plist) {
            NSString *pbxID = plist[@"rootObject"];
            NSLog(@"Root Object ID: %@", pbxID);

            if(pbxID.length) {
                PBXCache _plist = plist.mutableCopy;
                _plist[PBXCacheID] = [NSMutableDictionary new];
                self = [super initWithID:pbxID plist:plist];

                if(self) {
                    _root                   = [[PBXRoot alloc] initWithPlist:plist];
                    _buildConfigurationList = [PBX objectFromID:self.plistBranch[@"buildConfigurationList"] plist:plist];
                    _mainGroup              = [PBX objectFromID:self.plistBranch[@"mainGroup"] plist:plist];
                    _productRefGroup        = [PBX objectFromID:self.plistBranch[@"productRefGroup"] plist:plist];
                    _targets                = pbxObjectsFromIDs(@"targets", pbxID, plist);
                    _attributes             = [PBXProjectAttributes attributesWithAttributes:self.plistBranch[@"attributes"] plist:plist];
                }

                return self;
            }
        }
        /*
         * This will cause it to fail...
         */
        return (self = [super initWithID:nil plist:nil]);
    }

    +(instancetype)projectWithPlist:(PBXDict)plist {
        return [[self alloc] initWithPlist:plist];
    }

    +(instancetype)projectWithInputStream:(NSInputStream *)inputStream error:(NSError **)error {
        [inputStream open];
        NSLog(@"Reading plist...");
#ifdef __GNUSTEP_RUNTIME__
        // Are you kidding me guys?  Seriously?
        // How about an error message that says propertyListWithStream: wasn't implemented yet?
        NSUInteger    bufferLength = 4192;
        NSMutableData *mdata       = [NSMutableData dataWithCapacity:bufferLength];
        uint8_t       *buffer      = PGMalloc(bufferLength);
        NSInteger     res          = [inputStream read:buffer maxLength:bufferLength];

        while(res > 0) {
            [mdata appendBytes:buffer length:(NSUInteger)res];
            res = [inputStream read:buffer maxLength:bufferLength];
        }
        if(res < 0) {
            PGSetReference(error, inputStream.streamError);
            return nil;
        }
        PBXDict plist = [NSPropertyListSerialization propertyListWithData:mdata options:NSPropertyListImmutable format:nil error:error];
#else
        PBXDict plist = [NSPropertyListSerialization propertyListWithStream:inputStream options:NSPropertyListImmutable format:nil error:error];
#endif
        NSLog(@"Reading plist result: %@", (plist ? @"Success" : ((error && (*error)) ? (*error).localizedDescription : @"Unknown Error")));
        [inputStream close];
        return (plist ? [self projectWithPlist:plist] : nil);
    }

    +(instancetype)projectWithFileAtPath:(NSString *)filepath error:(NSError **)error {
        return [self projectWithInputStream:[NSInputStream inputStreamWithFileAtPath:filepath] error:error];
    }

    +(instancetype)projectWithURL:(NSURL *)url error:(NSError **)error {
        return [self projectWithInputStream:[NSInputStream inputStreamWithURL:url] error:error];
    }

    -(NSString *)compatibilityVersion {
        return self.plist[@"compatibilityVersion"];
    }

    -(NSString *)developmentRegion {
        return self.plist[@"developmentRegion"];
    }

    -(BOOL)hasScannedForEncodings {
        return BOOLVAL(@"hasScannedForEncodings");
    }

    -(PBXArray)knownRegions {
        return self.plist[@"knownRegions"];
    }

    -(NSString *)projectDirPath {
        return self.plist[@"projectDirPath"];
    }

    -(NSString *)projectRoot {
        return self.plist[@"projectRoot"];
    }

@end
