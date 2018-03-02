# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

# Inhibit all warnings
inhibit_all_warnings!

# Use frameworks
use_frameworks!

# Shared pods
def shared_pods
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'Unbox'
  pod 'Wrap'
  pod 'Result'
  pod 'SwiftyBeaver'
  pod 'ReachabilitySwift'
  pod 'AHKNavigationController'
  pod 'SwiftyJSON'
end

target 'HelloFresh' do

  shared_pods

  pod 'MBProgressHUD'
  pod 'Reusable'
  pod 'SnapKit', '~> 3.2.0'
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'

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
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
