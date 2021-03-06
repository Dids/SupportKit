//
//  RPAppDelegate.m
//  DemoApp
//
//  Created by Michael Spensieri on 12/10/13.
//  Copyright (c) 2013 Radialpoint. All rights reserved.
//

#import "RPAppDelegate.h"
#import <SupportKit/SupportKit.h>
#import "RPMainViewController.h"

// Enter your Zendesk URL here
NSString* const KnowledgeBaseURL = @"https://supportkit.zendesk.com";

// Other URLs to try:
//
// https://fixmestick.zendesk.com
// https://prezi.zendesk.com
// https://mortgagecoach.zendesk.com
// https://topify.zendesk.com
// https://winshuttle.zendesk.com
// https://dyknow.zendesk.com
// https://picaboo.zendesk.com
// https://shootproof.zendesk.com
// https://huddle.zendesk.com
// https://streamtime.zendesk.com

@implementation RPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RPMainViewController* mainController = [[RPMainViewController alloc] init];

    self.window.rootViewController = mainController;
    [self.window makeKeyAndVisible];

    //This is where you would put your token that was generated for your app on the SupportKit console website.
    SKTSettings* settings = [SKTSettings settingsWithAppToken:@"4z6ruil9xi9kixnf4ezztf1kl"];
    settings.knowledgeBaseURL = KnowledgeBaseURL;
    [SupportKit initWithSettings:settings];
    
    [SupportKit setDefaultRecommendations:@[
                                            @"https://supportkit.zendesk.com/hc/en-us/articles/201900704-Recommendations",
                                            @"https://supportkit.zendesk.com/hc/en-us/articles/202882550",
                                            @"https://supportkit.zendesk.com/hc/en-us/articles/202893700",
                                            @"https://supportkit.zendesk.com/hc/en-us/articles/201900224-Filtering-Search-Results-by-Category-or-Section",
                                            @"https://supportkit.zendesk.com/hc/en-us/articles/202584634",
                                            @"http://supportkit.io"
                                            ]];
    
    [SupportKit setUserFirstName:@"Demo" lastName:@"App"];
    
    return YES;
}

@end
