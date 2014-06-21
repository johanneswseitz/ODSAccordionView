#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "ODSAccordionView"
  s.version          = "0.3.1"
  s.summary          = "Yet another accordion style container view."
  s.description      = <<-DESC
                       Yet another accordion style container view

                       * Made for iOS 7+.
					   * Flat design
                       * Autorotation compatible
					   * Uses ARC
					   * No dependencies outside of UIKit
                       DESC
  s.homepage         = "https://github.com/Ookami86/ODSAccordionView"
  s.screenshots      = "https://raw.githubusercontent.com/Ookami86/ODSAccordionView/master/Screenshot1.png", "https://raw.githubusercontent.com/Ookami86/ODSAccordionView/master/Screenshot2.png"
  s.license          = 'MIT'
  s.author           = { "Johannes  Seitz" => "http://www.craftware.de" }
  s.source           = { :git => "https://github.com/Ookami86/ODSAccordionView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ookami86'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  #s.resources = 'Assets/*.png'

  s.public_header_files = 'Classes/**/*.h'
end
