#
# Be sure to run `pod lib lint TMPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TMPlayer'
  s.version          = '1.1.9'
  s.summary          = 'A perfect player based on ZFPlayer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A perfect player based on ZFPlayer made by renzifeng, extend by Nguyễn Khánh Ngọc
                       DESC

  s.homepage         = 'https://github.com/Th3M4sk8712/TMPlayer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Th3M4sk' => 'themaskhenzo@gmail.com' }
  s.source           = { :git => 'https://github.com/Th3M4sk8712/TMPlayer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TMPlayer/**/*.{h,m}'
  s.resources = 'TMPlayer/ZFPlayer.bundle'

  #s.public_header_files = 'Pod/Classes/**/*.h'
  s.framework    = 'UIKit','MediaPlayer'
  s.dependency 'Masonry'
end
