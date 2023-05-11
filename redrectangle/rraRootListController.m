#import <Foundation/Foundation.h>
#import "rraRootListController.h"

@implementation rraRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
