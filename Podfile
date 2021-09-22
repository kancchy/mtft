# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'

pod 'Firebase', '6.27.0'

pod 'Firebase/Crashlytics'

# Add the Firebase pod for Google Analytics
pod 'Firebase/Analytics'

# For Analytics without IDFA collection capability, use this pod instead
# pod 'Firebase/AnalyticsWithoutAdIdSupport'

# Add the pods for any other Firebase products you want to use in your app
# For example, to use Firebase Authentication and Cloud Firestore
#pod 'Firebase/Auth'
#pod 'Firebase/Firestore'

target 'mstf' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for mstf

pod 'RealmSwift', '10.15.0'

  target 'mstfTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'mstfUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end
