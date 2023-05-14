#import <Foundation/Foundation.h>
#import "rraRootListController.h"
#import <spawn.h>
#import <rootless.h>
extern char **environ;

@implementation rraRootListController
- (void)respring {
    const char *args[] = {
        ROOT_PATH("/usr/bin/sbreload"),
        NULL,
    };
    pid_t pid = -1;
    posix_spawn(&pid, args[0], NULL, NULL, (char **)args, environ);
    waitpid(pid, NULL, 0);
}
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (void)openGithub {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/dontbanmeplz/theosbuild"]
	options:@{}
	completionHandler:nil];
}
@end
