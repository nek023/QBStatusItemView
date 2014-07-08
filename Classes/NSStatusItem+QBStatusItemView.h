//
//  NSStatusItem+QBStatusItemView.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2014/07/09.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSStatusItem (QBStatusItemView)

- (void)setHighlighted:(BOOL)highlighted;
- (BOOL)isHighlighted;

@end
