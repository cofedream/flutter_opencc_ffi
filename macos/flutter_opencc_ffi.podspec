#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_opencc_ffi.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_opencc_ffi'
  s.version          = '0.0.2'
  s.summary          = 'A Flutter plugin for conversion between Traditional and Simplified Chinese.'
  s.description      = <<-DESC
A Flutter plugin for conversion between Traditional and Simplified Chinese.
                       DESC
  s.homepage         = 'https://github.com/dolphinxx/flutter_opencc_ffi'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Dolphinxx' => 'bravedolphinxx@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.dependency 'LibOpenCCiOS','0.0.2'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
