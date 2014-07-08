//
//  NSStatusItem+QBStatusItemView.m
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSStatusItem+QBStatusItemView.h"
#import <objc/objc-class.h>

#import "QBStatusItemView.h"

static void QBSIVExchangeImplementations(Class cls, SEL srcSel, SEL dstSel)
{
    Method srcMethod = class_getInstanceMethod(cls, srcSel);
    Method dstMethod = class_getInstanceMethod(cls, dstSel);
    
    if (class_addMethod(cls, srcSel, method_getImplementation(dstMethod), method_getTypeEncoding(dstMethod))) {
        class_replaceMethod(cls, dstSel, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
    } else {
        method_exchangeImplementations(srcMethod, dstMethod);
    }
}

@implementation NSStatusItem (QBStatusItemView)

+ (void)load
{
    QBSIVExchangeImplementations(self, @selector(setView:), @selector(qbsiv_setView:));
    QBSIVExchangeImplementations(self, @selector(setImage:), @selector(qbsiv_setImage:));
    QBSIVExchangeImplementations(self, @selector(setAlternateImage:), @selector(qbsiv_setAlternateImage:));
}


#pragma mark - Swizzled Methods

- (void)qbsiv_setView:(NSView *)view
{
    if ([view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)view;
        statusItemView.statusItem = self;
        statusItemView.image = self.image;
        statusItemView.alternateImage = self.alternateImage;
    }
    
    [self qbsiv_setView:view];
}

- (void)qbsiv_setImage:(NSImage *)image
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        statusItemView.image = image;
    }
    
    [self qbsiv_setImage:image];
}

- (void)qbsiv_setAlternateImage:(NSImage *)image
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        statusItemView.alternateImage = image;
    }
    
    [self qbsiv_setAlternateImage:image];
}


#pragma mark - Accessors

- (void)setHighlighted:(BOOL)highlighted
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        statusItemView.highlighted = highlighted;
    }
}

- (BOOL)isHighlighted
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        return statusItemView.highlighted;
    }
    
    return NO;
}

@end
