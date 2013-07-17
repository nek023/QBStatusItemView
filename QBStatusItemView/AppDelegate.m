//
//  AppDelegate.m
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import "AppDelegate.h"

#import "QBStatusItemView.h"

@interface AppDelegate ()

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

- (void)statusItemViewShouldPresentStatusMenu:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewShouldPresentStatusMenu:");
}

- (void)statusItemViewShouldDismissStatusMenu:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewShouldDismissStatusMenu:");
}

@end
