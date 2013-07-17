# QBStatusItemView
*QBStatusItemView* is custom view for NSStatusItem.

NSStatusItem can be highlighted only if it was clicked or NSMenu was shown.  
It is uncomfortable for menu bar apps which show custom popup menu instead of using NSMenu.

QBStatusItemView can be highlighted programmatically, so it is useful for such apps to improve usability.


## Installation
`#import "QBStatusItemView.h"` in your project.


## Example    
    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.image = [NSImage imageNamed:@"status_icon"];
    statusItem.alternateImage = [NSImage imageNamed:@"status_icon_highlighted"];
    
    QBStatusItemView *statusItemView = [[QBStatusItemView alloc] init];
    statusItemView.delegate = self;
    
    statusItem.view = statusItemView;

See *QBStatusItemView* project for more example usage.


## License
*QBStatusItemView* is released under the **MIT License**, see *LICENSE.txt*.