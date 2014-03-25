//
//  AppDelegate.m
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize webview;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *urlAddress = @"https://go.lime-go.com";
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //The webviews useragent is crazy, this is a ugly hack to fix it:
    [webview setCustomUserAgent: @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.74.9 (KHTML, like Gecko) Version/7.0.2 Safari/537.74.9"];
    
    [[webview mainFrame] loadRequest:requestObj];
    
    //Check for notifications every 30 second
    [NSTimer scheduledTimerWithTimeInterval:30
                                     target:self
                                   selector:@selector(handleNotifications)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
    if ( flag ) {
        [self.window orderFront:self];
    }
    else {
        [self.window makeKeyAndOrderFront:self];
    }
    
    return YES;
}

-(void)handleNotifications
{
    
    //Update the dock badge
    //[[[NSApplication sharedApplication] dockTile]setBadgeLabel:@"2234"];
}


@end