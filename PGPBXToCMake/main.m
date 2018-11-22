//
//  main.m
//  PGPBXToCMake
//
//  Created by Galen Rhodes on 11/19/18.
//  Copyright © 2018 Project Galen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBXProject.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString       *inFilename  = @"~/Projects/2017/Rubicon/Rubicon.xcodeproj/project.pbxproj".stringByExpandingTildeInPath;
        NSString       *outFilename = @"~/Projects/2019/PGPBXToCMake/PGPBXToCMake/Sample.xml".stringByExpandingTildeInPath;
        NSInputStream  *ins         = [NSInputStream inputStreamWithFileAtPath:inFilename];
        NSOutputStream *outs        = [NSOutputStream outputStreamToFileAtPath:outFilename append:NO];
        NSError        *error       = nil;

        [ins open];
        [outs open];
        PBXDict    plist       = [NSPropertyListSerialization propertyListWithStream:ins options:NSPropertyListImmutable format:nil error:&error];
//      NSInteger  res         = [NSPropertyListSerialization writePropertyList:plist toStream:outs format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
        PBXProject *pbxProject = [PBXProject pbxProjectWithID:plist[@"rootObject"] plist:plist error:&error];
        [ins close];
        [outs close];

        if(error) NSLog(@"ERROR!!!!! - %@", error.localizedDescription); else NSLog(@"%@", @"No Errors.");
    }

    return 0;
}
