# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# Inhibit all warnings
inhibit_all_warnings!

# Use frameworks
use_frameworks!

# Shared pods
def shared_pods
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'SwiftyBeaver'
  pod 'ReachabilitySwift'
  pod 'AHKNavigationController'
  pod 'SwiftyJSON'
end

target 'HelloFresh' do

  shared_pods

  pod 'MBProgressHUD'
  pod 'Reusable'
  pod 'SnapKit'
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'

end

target 'HelloFreshTests' do
  inherit! :search_paths

  shared_pods

  pod 'Quick'
  pod 'Nimble'

end

target 'HelloFreshUITests' do
  inherit! :search_paths

  shared_pods

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
