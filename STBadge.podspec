#
# Be sure to run `pod lib lint STBadge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STBadge'
  s.version          = '0.1.0'
  s.summary          = 'Badge组件'

  s.description      = <<-DESC
支持UIView和UITabBarItem
                       DESC

  s.homepage         = 'https://github.com/STKits/STBadge'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cnjsyyb' => 'cnjsyyb@163.com' }
  s.source           = { :git => 'https://github.com/STKits/STBadge.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_versions = ['5.0']
  
  s.ios.deployment_target = '13.0'

  s.source_files = 'STBadge/Classes/**/*'
  
  # s.resource_bundles = {
  #   'STBadge' => ['STBadge/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'SnapKit'
end
