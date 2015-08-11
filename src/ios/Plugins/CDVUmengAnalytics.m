#import "CDVUmengAnalytics.h"
#import "MobClick.h"

@implementation CDVUmengAnalytics
- (id)settingForKey:(NSString*)key
{
    return [self.commandDelegate.settings objectForKey:[key lowercaseString]];
}

- (void)pluginInitialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    
}

- (void)finishLaunching:(NSNotification *)notification
{
    NSString* setting;
    
    setting  = @"UmengAnalyticsDebugMode";
    if ([self settingForKey:setting]) {
        BOOL logEnabled=[[self settingForKey:setting] boolValue];
        if (logEnabled) {
            [MobClick setLogEnabled:YES];
        }else{
            [MobClick setLogEnabled:NO];
        }
    }
    NSString* appkey;
    NSString* channelId;
    setting=@"UMENG_APPKEY";
    appkey=[self settingForKey:setting];
    setting=@"UMENG_CHANNEL";
    channelId=[self settingForKey:setting];
    [MobClick setAppVersion:XcodeAppVersion];
    [MobClick startWithAppkey:appkey reportPolicy:BATCH   channelId:channelId];
    [MobClick updateOnlineConfig];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
}

- (void)onlineConfigCallBack:(NSNotification *)note {
    
    NSLog(@"online config has fininshed and note = %@", note.userInfo);
}
@end