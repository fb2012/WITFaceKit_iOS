#
# Be sure to run `pod lib lint WITFaceKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WITFaceKit'
  s.version          = '0.1.2'
  s.summary          = '实名认证SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 实名认证SDK
                       DESC

  s.homepage         = 'https://github.com/fb2012/WITFaceKit_iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bing' => 'fengbing@tongxin.cn' }
  s.source           = { :git => 'https://github.com/fb2012/WITFaceKit_iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  #s.source_files = 'WITFaceKit/framework/**/*'
  s.vendored_frameworks = 'WITFaceKit/WITFaceKit.framework'
  # s.resource_bundles = {
  #   'WITFaceKit' => ['WITFaceKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'WebKit'
  s.dependency 'Masonry', '~>1.1.0'
  s.dependency 'dsBridge'
  s.dependency 'SDWebImage', '~>5.0'
  #s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

end
