//
//  NSStatusItem+QBStatusItemView.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import <Cocoa/Cocoa.h>

@interface NSStatusItem (QBStatusItemView)

- (void)setHighlighted:(BOOL)highlighted;
- (BOOL)isHighlighted;

@end
