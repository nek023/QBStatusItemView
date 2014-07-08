//
//  QBStatusItemView.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Compatibility
#import <Availability.h>

#if __has_feature(objc_arc_weak)
#define qbsiv_weak weak
#else
#define qbsiv_weak unsafe_unretained
#endif

@class QBStatusItemView;

@protocol QBStatusItemViewDelegate <NSObject>

@optional
- (void)statusItemViewDidActivate:(QBStatusItemView *)statusItemView;
- (void)statusItemViewDidDeactivate:(QBStatusItemView *)statusItemView;

@end

@protocol QBStatusItemViewDelegate;

@interface QBStatusItemView : NSControl

@property (nonatomic, qbsiv_weak) id<QBStatusItemViewDelegate> delegate;
@property (nonatomic, qbsiv_weak) NSStatusItem *statusItem;

@property (nonatomic, assign, getter = isHighlighted) BOOL highlighted;
@property (nonatomic, strong) NSImage *image;
@property (nonatomic, strong) NSImage *alternateImage;
@property (nonatomic, assign) NSEdgeInsets imageInsets;

@end
