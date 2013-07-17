//
//  AppDelegate.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import <Cocoa/Cocoa.h>

#import "QBStatusItemViewDelegate.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, QBStatusItemViewDelegate>

@property (assign) IBOutlet NSWindow *window;

@end
