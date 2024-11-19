# Uncomment the next line to define a global platform for your project
 platform :ios, '15.0'

target 'Tools' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Tools
  pod "MarkdownView"
  pod 'UnsplashPhotoPicker', '~> 1.1.1'
  pod "SwViewCapture", :git=>'https://github.com/startry/SwViewCapture.git'
  pod 'Eureka'

  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  
  pod 'Google-Mobile-Ads-SDK'
  
  pod 'ZFPlayer'
  pod 'ZFPlayer/ControlView'
  pod 'ZFPlayer/ijkplayer'

end
post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
            end
        end
    end
end
