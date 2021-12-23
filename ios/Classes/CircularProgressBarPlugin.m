#import "CircularProgressBarPlugin.h"
#if __has_include(<circular_progress_bar/circular_progress_bar-Swift.h>)
#import <circular_progress_bar/circular_progress_bar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "circular_progress_bar-Swift.h"
#endif

@implementation CircularProgressBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCircularProgressBarPlugin registerWithRegistrar:registrar];
}
@end
