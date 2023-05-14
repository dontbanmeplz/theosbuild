#import <Alderis/Alderis.h>
#import <UIKit/UIKit.h>
@interface CSCoverSheetViewController : UIViewController
@end

NSString *const domainString = @"com.zanehelton.redrectangle";
static BOOL enabled;
static int x;
static int y;
UIColor *coolColor;
%group tweak
%hook CSCoverSheetViewController
- (void) viewDidLoad {
	%orig;
	//loadPrefs();
	//UIColor *color = [UIColor colorWithRed:177.0 / 255.0 green:120.0 / 255.0 blue:255.0 / 255.0 alpha:1.0];
	UIView *redRectangle = [[UIView alloc] initWithFrame:CGRectMake(x, y, 200, 200)];
	[redRectangle setBackgroundColor:[UIColor *coolColor]];
	[self.view addSubview:redRectangle];
}
%end
%end

void loadPrefs() {
    NSUserDefaults *appUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:domainString];
    enabled = [appUserDefaults objectForKey:@"enabledK"] ? [[appUserDefaults objectForKey:@"enabledK"] boolValue] : NO;
	x = [[appUserDefaults objectForKey:@"slidex"] ?: @(0)  intValue];
	y = [[appUserDefaults objectForKey:@"slidey"] ?: @(0)  intValue];}
	NSString *coolColorHex = [NSUserDefaults objectForKey:@"color"];
	UIColor coolColor = LCPParseColorString(coolColorHex, @"#ff0000");
%ctor{
	loadPrefs();
	if (enabled) {
		%init(tweak);
	}
}