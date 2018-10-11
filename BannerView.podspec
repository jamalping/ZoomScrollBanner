Pod::Spec.new do |s|

  s.name         = 'BannerView'
  s.version      = '0.1.0'
  s.summary      = 'BannerView.'

  s.description  = <<-DESC
                    this is BannerView
                   DESC

  s.homepage     = 'https://github.com/jamalping/ZoomScrollBanner'

  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }

  s.author       = 'jamalping'

  s.platform     = :ios, '8.0'

  #  When using multiple platforms
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  # s.watchos.deployment_target = '2.0'
  # s.tvos.deployment_target = '9.0'

  s.source       = { :git => 'http://', :tag => s.version.to_s }

  s.source_files = 'BannerView/Classes/**/*'

  #- 推荐这种 -#
  # s.resource_bundles = {
  #   'BannerView' => ['BannerView/Assets/**/*']
  # }

  # s.resources  = 'BannerView/**/*.{storyboard,xib}', 'BannerView/Assets/*'
  # s.resources = 'Resources/*.png'

  # s.preserve_paths = 'FilesToSave', 'MoreFilesToSave'

  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'AFNetworking'

end
