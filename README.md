# QBStatusItemView
Custom status item view that can be highlighted programmatically.


## What's this?
`NSStatusItem` can be highlighted only if it is clicked.  
It's a problem if you want to show your original popup programmatically.  

QBStatusItemView can be set to the `view` property of `NSStatusItem` and can be highlighted programmatically.  
So it is useful for apps that uses original popup instead of `NSMenu`.


## Installation
`#import "QBStatusItemView.h"` in your project.


## Example
```
NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
statusItem.image = [NSImage imageNamed:@"status_icon"];
statusItem.alternateImage = [NSImage imageNamed:@"status_icon_highlighted"];

QBStatusItemView *statusItemView = [[QBStatusItemView alloc] init];
statusItemView.delegate = self;

statusItem.view = statusItemView;
```

And delegate will be notified when the view is activated and deactivated.

```
#pragma mark - QBStatusItemViewDelegate

- (void)statusItemViewDidActivate:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewDidActivate:");
}

- (void)statusItemViewDidDeactivate:(QBStatusItemView *)statusItemView
{
    NSLog(@"*** statusItemViewDidDeactivate:");
}
```


## Author
Katsuma Tanaka, questbeat@gmail.com


## License
QBStatusItemView is available under the MIT license. See the LICENSE file for more info.