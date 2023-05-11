#import <UIKit/UIKit.h>
@interface CSCoverSheetViewController : UIViewController
@end

NSString *const domainString = @"com.zanehelton.redrectangle";
static BOOL enabled;

%group tweak
%hook CSCoverSheetViewController
- (void) viewDidLoad {
	%orig;

	UIView *redRectangle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
	[redRectangle setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:redRectangle];
}
%end
%end

void loadPrefs() {
    NSUserDefaults *appUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:domainString];
    enabled = [appUserDefaults objectForKey:@"enabledK"] ? [[appUserDefaults objectForKey:@"enabledK"] boolValue] : NO;
}

%ctor{
	loadPrefs();
	if (enabled) {
		%init(tweak);
	}
}