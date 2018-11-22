/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBX.m
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

#import "PBX.h"

@interface PBX()

    -(instancetype)initWithIDForReal:(NSString *)pbxID plist:(PBXDict)plist;

@end

@implementation PBX {
    }

    @synthesize pbxID = _pbxID;
    @synthesize plist = _plist;

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        if((pbxID.length == 0) || (plist == nil)) return (self = nil);

        /*
         * See if an object with this ID has already been created.
         */
        id cached = [PBX cachedPBXObjectForID:pbxID];

        if(cached) {
            /*
             * If so return it instead.
             */
            self = nil;
            return cached;
        }
        else {
            /*
             * If not create it and cache it.
             */
            return (self = [self initWithIDForReal:pbxID plist:plist]);
        }
    }

    -(instancetype)initWithIDForReal:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super init];

        if(self) {
            _pbxID = [pbxID copy];
            _plist = plist;

            [PBX storePBXObject:self forID:pbxID];

            for(NSString *key in self.plistBranch.allKeys) {
                NSLog(@"%@ key: \"%@\"", NSStringFromClass([self class]), key);
            }
        }

        return self;
    }

    /**
     * We will use a cache for the objects in case the same object ID is referrenced more than once.
     * This will be a private method accessable only to this base class. The methods that use the cache
     * returned by this method will lock it when used.
     *
     * @return the object cache.
     */
    +(NSMutableDictionary<NSString *, id> *)objectCache {
        static NSMutableDictionary<NSString *, id> *_pbxObjectCache = nil;
        /*
         * Avoid going into two synchronized blocks if possible.
         */
        if(_pbxObjectCache == nil) {
            @synchronized([PBX class]) {
                if(_pbxObjectCache == nil) {
                    _pbxObjectCache = [NSMutableDictionary new];
                }
            }
        }
        return _pbxObjectCache;
    }

    +(instancetype)cachedPBXObjectForID:(NSString *)pbxID {
        if(pbxID.length) {
            NSMutableDictionary<NSString *, id> *cache = self.objectCache;
            @synchronized(cache) { return (cache[pbxID]); }
        }
        return nil;
    }

    +(instancetype)storePBXObject:(id)pbxObject forID:(NSString *)pbxID {
        if(pbxObject && pbxID.length) {
            NSMutableDictionary<NSString *, id> *cache = self.objectCache;
            @synchronized(cache) { cache[pbxID] = pbxObject; }
            return pbxObject;
        }

        return nil;
    }

    +(PBX *)objectFromID:(NSString *)pbxID plist:(PBXDict)plist {
        /*
         * First, see if we have something cached.
         */
        PBX *obj = [self cachedPBXObjectForID:pbxID];

        if(obj == nil) {
            @synchronized([PBX class]) {
                /*
                 * If not, try to create one from it's name by first finding the class.
                 */
                Class cls = NSClassFromString(DICT(DICT(plist[@"objects"])[pbxID])[@"isa"]);

                /*
                 * If we have a class with that name then create it.
                 */
                if(cls) obj = [((PBX *)([cls alloc])) initWithIDForReal:pbxID plist:plist];
            }
        }
        /*
         * Return the object or nil if the object was an unknown type.
         */
        return nil;
    }

    -(NSString *)pbxISA {
        return self.plistBranch[@"isa"];
    }

    -(PBXDict)plistObjects {
        return _plist[@"objects"];
    }

    -(PBXDict)plistBranch {
        return self.plistObjects[_pbxID];
    }

@end
