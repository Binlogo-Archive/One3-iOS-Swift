platform :ios, '8.0'
use_frameworks!

target 'One3-iOS' do
    
    pod 'SnapKit', '~> 3.0'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
