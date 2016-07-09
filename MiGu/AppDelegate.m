//
//  AppDelegate.m
//  MiGu
//
//  Created by lichen on 16/7/9.
//  Copyright (c) 2016年 lichen. All rights reserved.
//

#import "AppDelegate.h"
#import "MG.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *MyLabel;
@property (weak) IBOutlet NSButton *MyButton;
@property (weak) IBOutlet NSTextFieldCell *PoemTextField;


- (IBAction)MyButton:(id)sender;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



- (IBAction)MyButton:(id)sender {
    MG *gm = [[MG alloc] init];
    [gm myInit];

    [gm loadDictFile:@""];
    [gm loadStockFile:@""];
    
    NSString* res = [gm setPoem:[_PoemTextField title]];
    [_MyLabel setStringValue:res];
    
    if ([res length] == 0) {
        [_MyButton setTitle:@"分析失败"];
    }else {
        [_MyButton setTitle:@"分析成功"];
    }
    
}

@end
