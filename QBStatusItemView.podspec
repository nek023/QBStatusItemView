#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "QBStatusItemView"
  s.version          = "1.0.0"
  s.summary          = "Custom status item view that can be highlighted programmaticallly."
  s.description      = <<-DESC
                       `NSStatusItem` can be highlighted only if it is clicked.  
                       It's a problem if you want to show your original popup programmatically.

                       QBStatusItemView can be set to the `view` property of `NSStatusItem` and can be highlighted programmatically.  
                       So it is useful for apps that uses original popup instead of `NSMenu`.
                       DESC
  s.homepage         = "https://github.com/questbeat/QBStatusItemView"
  s.license          = 'MIT'
  s.author           = { "questbeat" => "questbeat@gmail.com" }
  s.source           = { :git => "https://github.com/questbeat/QBStatusItemView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/questbeat'

  s.platform     = :osx, '10.6'
  s.requires_arc = true

  s.source_files = 'Classes'
end
