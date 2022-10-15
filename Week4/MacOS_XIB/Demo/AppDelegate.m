//
//  AppDelegate.m
//  Demo
//
//  Created by 김응관 on 2022/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextFieldCell *MyTextFieldCell;
@property (weak) IBOutlet NSTextFieldCell *MyOwnTextCell;

- (IBAction)Hello:(id)sender;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)Hello:(id)sender {
    NSLog(@"%@", self.MyOwnTextCell.title);
    
    NSString * strs = @"Hi";
    
    NSLog(@"%@", strs);
    
    self.MyTextFieldCell.title = @"Hello World";
    
    NSSpeechSynthesizer *synthesizer = [[NSSpeechSynthesizer alloc]init];
    [synthesizer startSpeakingString:strs];
    
}
@end
