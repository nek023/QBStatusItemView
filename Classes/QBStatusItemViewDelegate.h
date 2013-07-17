//
//  QBStatusItemViewDelegate.h
//  QBStatusItemView
//
//  Created by Tanaka Katsuma on 2013/07/17.
//
//

#import <Foundation/Foundation.h>

@class QBStatusItemView;

@protocol QBStatusItemViewDelegate <NSObject>

@optional
- (void)statusItemViewShouldPresentStatusMenu:(QBStatusItemView *)statusItemView;
- (void)statusItemViewShouldDismissStatusMenu:(QBStatusItemView *)statusItemView;

@end
