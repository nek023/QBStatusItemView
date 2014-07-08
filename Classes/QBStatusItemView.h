//
//  QBStatusItemView.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class QBStatusItemView;

@protocol QBStatusItemViewDelegate <NSObject>

@optional
- (void)statusItemViewDidActivate:(QBStatusItemView *)statusItemView;
- (void)statusItemViewDidDeactivate:(QBStatusItemView *)statusItemView;

@end

@protocol QBStatusItemViewDelegate;

@interface QBStatusItemView : NSControl

@property (nonatomic, weak) id<QBStatusItemViewDelegate> delegate;
@property (nonatomic, weak) NSStatusItem *statusItem;

@property (nonatomic, assign, getter = isHighlighted) BOOL highlighted;
@property (nonatomic, strong) NSImage *image;
@property (nonatomic, strong) NSImage *alternateImage;
@property (nonatomic, assign) NSEdgeInsets imageInsets;

@end
