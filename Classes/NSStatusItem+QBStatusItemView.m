//
//  NSStatusItem+QBStatusItemView.m
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import "NSStatusItem+QBStatusItemView.h"
#import <objc/objc-class.h>
#import "QBStatusItemView.h"

static void MethodSwizzle(Class class, SEL org_sel, SEL alt_sel)
{
    Method org_method = nil, alt_method = nil;
    
    org_method = class_getInstanceMethod(class, org_sel);
    alt_method = class_getInstanceMethod(class, alt_sel);
    
    if(org_method != nil && alt_method != nil) {
        method_exchangeImplementations(org_method, alt_method);
	}
}

@implementation NSStatusItem (QBStatusItemView)

+ (void)load
{
    MethodSwizzle(self, @selector(setView:), @selector(_QBStatusItemView_setView:));
    MethodSwizzle(self, @selector(setImage:), @selector(_QBStatusItemView_setImage:));
    MethodSwizzle(self, @selector(setAlternateImage:), @selector(_QBStatusItemView_setAlternateImage:));
}

- (void)_QBStatusItemView_setView:(NSView *)view
{
    if ([view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)view;
        statusItemView.statusItem = self;
        statusItemView.image = self.image;
        statusItemView.alternateImage = self.alternateImage;
    }
    
    [self _QBStatusItemView_setView:view];
}

- (void)_QBStatusItemView_setImage:(NSImage *)image
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        statusItemView.image = image;
    }
    
    [self _QBStatusItemView_setImage:image];
}

- (void)_QBStatusItemView_setAlternateImage:(NSImage *)image
{
    if ([self.view isMemberOfClass:[QBStatusItemView class]]) {
        QBStatusItemView *statusItemView = (QBStatusItemView *)self.view;
        statusItemView.alternateImage = image;
    }
    
    [self _QBStatusItemView_setAlternateImage:image];
}

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
