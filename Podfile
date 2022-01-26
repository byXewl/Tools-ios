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
  
  pod "PLPlayerKit", :podspec => 'https://raw.githubusercontent.com/pili-engineering/PLPlayerKit/master/PLPlayerKit-Universal.podspec'


end
post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
  end
