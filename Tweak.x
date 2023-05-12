#import <UIKit/UIKit.h>
@interface CSCoverSheetViewController : UIViewController
@end

NSString *const domainString = @"com.zanehelton.redrectangle";
static BOOL enabled;
static int x;
static int y;
%group tweak
%hook CSCoverSheetViewController
- (void) viewDidLoad {
	%orig;
	//loadPrefs();
	UIView *redRectangle = [[UIView alloc] initWithFrame:CGRectMake(x, y, 200, 200)];
	[redRectangle setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:redRectangle];
}
%end
%end

void loadPrefs() {
    NSUserDefaults *appUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:domainString];
    enabled = [appUserDefaults objectForKey:@"enabledK"] ? [[appUserDefaults objectForKey:@"enabledK"] boolValue] : NO;
	x = [[appUserDefaults objectForKey:@"slidex"] ?: @(0)  intValue];
	y = [[appUserDefaults objectForKey:@"slidey"] ?: @(0)  intValue];}

%ctor{
	loadPrefs();
	if (enabled) {
		%init(tweak);
	}
}