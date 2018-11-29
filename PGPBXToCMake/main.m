//
//  main.m
//  PGPBXToCMake
//
//  Created by Galen Rhodes on 11/19/18.
//  Copyright © 2018 Project Galen. All rights reserved.
//

#import <Rubicon/Rubicon.h>
#import "PBXProject.h"
#import "PBXTarget.h"
#import "PBXNativeTarget.h"
#import "PBXBuildFile.h"
#import "PBXSourcesBuildPhase.h"
#import "PBXFileReference.h"
#import "PBXGroup.h"

#define EBARS @"=========================================================================="
#define TABSS @"    "

NSString *getTabStr(NSUInteger tabs) {
    static NSMutableArray<NSString *> *tabarray = nil;

    if(tabarray == nil) {
        @synchronized(PBXProject.class) {
            if(tabarray == nil) tabarray = [NSMutableArray new];
        }
    }

    @synchronized(tabarray) {
        NSUInteger tabarraylen = tabarray.count;
        NSString   *str        = ((tabs < tabarraylen) ? tabarray[tabs] : nil);

        if(str == nil) {
            NSMutableString *tabstr = [NSMutableString stringWithCapacity:(tabs * TABSS.length)];

            if(tabarraylen) [tabstr appendString:tabarray[tabarraylen - 1]];

            for(NSUInteger i = tabarraylen; i < tabs; i++) {
                [tabstr appendString:TABSS];
                [tabarray addObject:tabstr.copy];
            }

            str = tabstr;
        }

        return str;
    }
}

void logFile(PBXFileReference *aFile, NSUInteger tabs) {
    NSString *tabstr = getTabStr(tabs);
    if(aFile.explicitFileTypeDescription)
        NSLog(@"%@(%@)<%@:%@> %@", tabstr, aFile.sourceTreeDescription, aFile.lastKnownFileTypeDescription, aFile.explicitFileTypeDescription, aFile.path);
    else NSLog(@"%@(%@)<%@> %@", tabstr, aFile.sourceTreeDescription, aFile.lastKnownFileTypeDescription, aFile.path);
}

void logGroup(PBXGroup *aGroup, NSUInteger tabs) {
    NSString *tabstr = getTabStr(tabs);

    NSLog(@"%@(%@) %@", tabstr, aGroup.sourceTreeDescription, aGroup.name);
    for(PBXFileElement *aFile in aGroup.children) {
        if([aFile isKindOfClass:PBXFileReference.class]) logFile((PBXFileReference *)aFile, tabs + 1);
        else if([aFile isKindOfClass:PBXGroup.class]) logGroup((PBXGroup *)aFile, tabs + 1);
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSError    *error      = nil;
#ifdef __GNUSTEP_RUNTIME__
        NSString   *inFilename = @"~/Projects/prj/Rubicon/Rubicon.xcodeproj/project.pbxproj".stringByExpandingTildeInPath;
#else
        NSString   *inFilename = @"~/Projects/2017/Rubicon/Rubicon.xcodeproj/project.pbxproj".stringByExpandingTildeInPath;
#endif
        PBXProject *pbxProject = [PBXProject projectWithFileAtPath:inFilename error:&error];

        for(PBXNativeTarget *nativeTarget in pbxProject.targets) {
            PBXFileReference *prodRef = nativeTarget.productReference;
            NSLog(@"Target: %@; Product Type: %@; Product Path: %@; Product File Type: %@",
                  nativeTarget.productName,
                  nativeTarget.productTypeDescription,
                  prodRef.path,
                  prodRef.explicitFileTypeDescription ?: prodRef.lastKnownFileTypeDescription);

            for(PBXBuildPhase *phase in nativeTarget.buildPhases) {
                NSLog(EBARS);
                NSLog(@"    Build Phase: %@", phase.pbxISA);

                if(phase.files.count) {
                    for(PBXBuildFile *file in phase.files) {
                        NSLog(@"        -----------------------------------------------------------------");
                        NSLog(@"        Build Phase File: %@", file.file.path);
                        NSLog(@"             Source Tree: %@", file.file.sourceTreeDescription);
                        NSLog(@"                     ISA: %@", file.pbxISA);
                        NSLog(@"              Visibility: %@", pbxVisibilityDescription(file.visibility));
                        NSLog(@"               File Type: %@", file.file.explicitFileTypeDescription ?: file.file.lastKnownFileTypeDescription);
                    }
                    NSLog(@"        -----------------------------------------------------------------");
                }
            }
            NSLog(EBARS);
        }

        logGroup(pbxProject.mainGroup, 1);
    }

    return 0;
}
