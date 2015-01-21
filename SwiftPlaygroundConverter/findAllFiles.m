//
//  findAllFiles.m
//  SwiftPlaygroundConvert
//
//  Created by WebosterBob on 1/19/15.
//  Copyright (c) 2015 ___SLIGHTECH___. All rights reserved.
//

#import "findAllFiles.h"

@implementation findAllFiles

-(void)findAllFiles_swift {
    NSArray *workspaceWindowControllers = [NSClassFromString(@"IDEWorkspaceWindowController") valueForKey:@"workspaceWindowControllers"];
    NSLog(@"workspaceWindowControllers = %lu %@", (unsigned long)workspaceWindowControllers.count, workspaceWindowControllers);
    
    
    id workSpace;
    
    for (id controller in workspaceWindowControllers) {
        NSLog(@"controller = %@", controller);
        if ([[controller valueForKey:@"window"] isEqual:[NSApp keyWindow]]) {
            workSpace = [controller valueForKey:@"_workspace"];
            NSLog(@"workSpace = %@", workSpace);
        }
    }
    
    NSString *workspacePath = [[workSpace valueForKey:@"representingFilePath"] valueForKey:@"_pathString"];
    NSLog(@"workspacePath = %@ \n\n\n", workspacePath);
    
    NSLog(@"=========================================================================================================");
}





@end
