#import "IndicatorNavbarPlugin.h"
#if __has_include(<indicator_navbar/indicator_navbar-Swift.h>)
#import <indicator_navbar/indicator_navbar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "indicator_navbar-Swift.h"
#endif

@implementation IndicatorNavbarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIndicatorNavbarPlugin registerWithRegistrar:registrar];
}
@end
