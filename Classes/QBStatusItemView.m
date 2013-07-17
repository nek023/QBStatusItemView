//
//  QBStatusItemView.m
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import "QBStatusItemView.h"
#import "QBStatusItemViewDelegate.h"

static const NSTimeInterval QBStatusItemViewLongPressThreshold = 0.25;

@interface QBStatusItemView ()

@property (nonatomic, weak) NSTimer *longPressTimer;
@property (nonatomic, assign, getter = isLongPress) BOOL longPress;

// Handling Long Press
- (void)startLongPressTimer;
- (void)stopLongPressTimer;
- (void)longPressTimerDidFire:(id)sender;

@end

@implementation QBStatusItemView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:NSZeroRect];
    
    if (self) {
        self.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
        self.imageInsets = NSEdgeInsetsMake(1, 4, 0, 4);
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

- (void)drawRect:(NSRect)rect
{
    // Draw statusbar background
    [self.statusItem drawStatusBarBackgroundInRect:self.bounds withHighlight:self.highlighted];
    
    // Draw image
    NSImage *image = (self.highlighted) ? self.alternateImage : self.image;
    [image drawInRect:NSMakeRect((self.bounds.size.width - image.size.width) / 2.0,
                                 (self.bounds.size.height - image.size.height) / 2.0 + self.imageInsets.top,
                                 image.size.width,
                                 image.size.height)
             fromRect:NSMakeRect(0, 0, image.size.width, image.size.height)
            operation:NSCompositeSourceOver
             fraction:1.0];
}

- (void)mouseDown:(NSEvent *)event
{
    [super mouseDown:event];
    
    if (self.highlighted) {
        self.highlighted = NO;
        
        // Delegate
        if ([self.delegate respondsToSelector:@selector(statusItemViewShouldDismissStatusMenu:)]) {
            [self.delegate statusItemViewShouldDismissStatusMenu:self];
        }
    } else {
        self.highlighted = YES;
        
        // Start timer for detecting long press
        [self startLongPressTimer];
        
        // Delegate
        if ([self.delegate respondsToSelector:@selector(statusItemViewShouldPresentStatusMenu:)]) {
            [self.delegate statusItemViewShouldPresentStatusMenu:self];
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
        if ([self.delegate respondsToSelector:@selector(statusItemViewShouldDismissStatusMenu:)]) {
            [self.delegate statusItemViewShouldDismissStatusMenu:self];
        }
    }
}


#pragma mark - Handling Long Press

- (void)startLongPressTimer
{
    [self stopLongPressTimer];
    
    NSTimer *longPressTimer = [NSTimer scheduledTimerWithTimeInterval:QBStatusItemViewLongPressThreshold target:self selector:@selector(longPressTimerDidFire:) userInfo:nil repeats:NO];
    self.longPressTimer = longPressTimer;
}

- (void)stopLongPressTimer
{
    if ([self.longPressTimer isValid]) {
        [self.longPressTimer invalidate];
    }
    
    self.longPressTimer = nil;
}

- (void)longPressTimerDidFire:(id)sender
{
    [self stopLongPressTimer];
    
    self.longPress = YES;
}

@end
