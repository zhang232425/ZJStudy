#
# Be sure to run `pod lib lint ZJStudy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  
  s.name             = 'ZJStudy'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ZJStudy.'
  s.homepage         = 'https://github.com/zhang232425/ZJStudy.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yonathan' => 'yonathan@asetku.com' }
  s.source           = { :git => 'https://github.com/zhang232425/ZJStudy.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'ZJStudy/Classes/**/*'
  s.resource_bundles = {
      'ZJStudy' => ['ZJStudy/Classes/**/*']
  }
  s.static_framework = true
  
  s.dependency 'Then'
  s.dependency 'SnapKit'
  s.dependency 'Action'
  s.dependency 'RxCocoa'
  s.dependency 'RxSwift'
  s.dependency 'RxDataSources'
  s.dependency 'RxSwiftExt'
  
  s.dependency 'ZJRouter'
  
end


