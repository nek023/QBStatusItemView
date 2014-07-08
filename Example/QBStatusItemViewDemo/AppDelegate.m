//
//  AppDelegate.m
//  QBStatusItemViewDemo
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "AppDelegate.h"

// QBStatusItemView
#import "QBStatusItemView.h"

@interface AppDelegate () <QBStatusItemViewDelegate>

@property (nonatomic, strong) NSStatusItem *statusItem;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.image = [NSImage imageNamed:@"status_icon"];
    statusItem.alternateImage = [NSImage imageNamed:@"status_icon_highlighted"];
    
    QBStatusItemView *statusItemView = [[QBStatusItemView alloc] init];
    statusItemView.delegate = self;
    
    statusItem.view = statusItemView;
    self.statusItem = statusItem;
}


#pragma mark - QBStatusItemViewDelegate

- (void)statusItemViewDidActivate:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewDidActivate:");
}

- (void)statusItemViewDidDeactivate:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewDidDeactivate:");
}

@end
