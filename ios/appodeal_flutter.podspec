#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appodeal_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'appodeal_flutter'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin to display ads from Appodeal.'
  s.description      = <<-DESC
A Flutter plugin to display ads from Appodeal; it supports the new reqs for iOS 14+ and GDPR/CCPA consent.
                       DESC
  s.homepage         = 'https://pub.dev/packages/appodeal_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Vinicius Egidio' => 'me@vinicius.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'
  s.static_framework = true

  # Appodeal Dependencies
  s.dependency 'Appodeal' 
  

  # Consent Manager Dependency
  s.dependency 'StackConsentManager', '1.0.1'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
