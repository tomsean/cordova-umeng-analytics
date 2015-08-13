#import <Cordova/CDVPlugin.h>

@interface CDVUmengAnalytics : CDVPlugin
- (void)onPageStart:(CDVInvokedUrlCommand*)command;
- (void)onPageEnd:(CDVInvokedUrlCommand*)command;
@end