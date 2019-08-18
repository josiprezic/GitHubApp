platform :ios, '12.2'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def shared_pods
  pod 'Alamofire'
  pod 'SnapKit'
end

target 'GitHubApp' do
  shared_pods
end

target 'GitHubAppTests' do
  shared_pods
  pod 'Quick', '~> 2.1.0'
  pod 'Nimble', '~> 8.0.1'
  pod 'Mockingjay', '~>3.0.0-alpha.1'
end
