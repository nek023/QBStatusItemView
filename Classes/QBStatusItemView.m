//
//  QBStatusItemView.m
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "QBStatusItemView.h"

static const NSTimeInterval QBStatusItemViewLongPressThreshold = 0.25;

@interface QBStatusItemView ()

@property (nonatomic, qbsiv_weak) NSTimer *longPressTimer;
@property (nonatomic, assign, getter = isLongPress) BOOL longPress;

@end

@implementation QBStatusItemView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:NSZeroRect];
    
    if (self) {
        self.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        self.imageInsets = NSEdgeInsetsMake(0.0, 4.0, 2.0, 4.0);
    }
    
    return self;
}

- (void)dealloc
{
    [self stopLongPressTimer];
}


#pragma mark - Accessors

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    
    [self setNeedsDisplay];
}

- (void)setImage:(NSImage *)image
{
    _image = image;
    
    self.frame = NSMakeRect(0,
                            0,
                            MAX(self.image.size.width, self.alternateImage.size.width) + self.imageInsets.left + self.imageInsets.right,
                            self.statusItem.statusBar.thickness);
    
    [self setNeedsDisplay];
}

- (void)setAlternateImage:(NSImage *)alternateImage
{   
    _alternateImage = alternateImage;
    
    self.frame = NSMakeRect(0,
                            0,
                            MAX(self.image.size.width, self.alternateImage.size.width) + self.imageInsets.left + self.imageInsets.right,
                            self.statusItem.statusBar.thickness);
    
    [self setNeedsDisplay];
}


#pragma mark - Drawing the Image

- (void)drawRect:(NSRect)rect
{
    // Draw statusbar background
    [self.statusItem drawStatusBarBackgroundInRect:self.bounds withHighlight:self.highlighted];
    
    // Draw image
    NSImage *image = (self.highlighted) ? self.alternateImage : self.image;
    [image drawInRect:NSMakeRect(self.imageInsets.left,
                                 self.imageInsets.bottom,
                                 image.size.width,
                                 image.size.height)
             fromRect:NSMakeRect(0, 0, image.size.width, image.size.height)
            operation:NSCompositeSourceOver
             fraction:1.0];
}


#pragma mark - Handling Mouse Events

- (void)mouseDown:(NSEvent *)event
{
    [super mouseDown:event];
    
    if (self.highlighted) {
        self.highlighted = NO;
        
        // Delegate
        if ([self.delegate respondsToSelector:@selector(statusItemViewDidDeactivate:)]) {
            [self.delegate statusItemViewDidDeactivate:self];
        }
    } else {
        self.highlighted = YES;
        
        // Start timer to detect long press
        [self startLongPressTimer];
        
        // Delegate
        if ([self.delegate respondsToSelector:@selector(statusItemViewDidActivate:)]) {
            [self.delegate statusItemViewDidActivate:self];
        }
    }
}

- (void)mouseUp:(NSEvent *)event
{
    [super mouseUp:event];
    
    [self stopLongPressTimer];
    
    if (self.longPress) {
        self.longPress = NO;
        
        self.highlighted = NO;
        
        // Delegate
        if ([self.delegate respondsToSelector:@selector(statusItemViewDidDeactivate:)]) {
            [self.delegate statusItemViewDidDeactivate:self];
        }
    }
}


#pragma mark - Handling Long Press

- (void)startLongPressTimer
{
    [self stopLongPressTimer];
    
    NSTimer *longPressTimer = [NSTimer scheduledTimerWithTimeInterval:QBStatusItemViewLongPressThreshold
                                                               target:self
                                                             selector:@selector(longPressTimerDidFire:)
                                                             userInfo:nil
                                                              repeats:NO];
    self.longPressTimer = longPressTimer;
}

- (void)stopLongPressTimer
{
    if (self.longPressTimer) {
        [self.longPressTimer invalidate];
        self.longPressTimer = nil;
    }
}

- (void)longPressTimerDidFire:(id)sender
{
    [self stopLongPressTimer];
    
    self.longPress = YES;
}

@end
