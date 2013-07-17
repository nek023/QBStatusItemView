//
//  QBStatusItemView.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import <Cocoa/Cocoa.h>

@protocol QBStatusItemViewDelegate;

@interface QBStatusItemView : NSControl

@property (nonatomic, weak) id<QBStatusItemViewDelegate> delegate;
@property (nonatomic, weak) NSStatusItem *statusItem;

@property (nonatomic, assign, getter = isHighlighted) BOOL highlighted;
@property (nonatomic, strong) NSImage *image;
@property (nonatomic, strong) NSImage *alternateImage;
@property (nonatomic, assign) NSEdgeInsets imageInsets;

@end
