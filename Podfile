# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'Tools' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Tools
  pod "MarkdownView"
  pod 'UnsplashPhotoPicker', '~> 1.1.1'
  pod "SwViewCapture"
  pod 'Eureka'

  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  
  pod 'Google-Mobile-Ads-SDK'
  
  pod 'ZFPlayer'
  pod 'ZFPlayer/ControlView'
  pod 'ZFPlayer/ijkplayer'
  
  pod 'qplayer2-core', '1.5.0'


end
post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
