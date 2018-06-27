
source 'http://106.14.8.80:90/linzuhan/BBLiveRepo.git'
source 'https://github.com/CocoaPods/Specs.git'

workspace 'BBLive.xcworkspace'
project 'BBLiveDemo/BBLiveDemo.xcodeproj'

target 'BBLiveDemo' do
   platform :ios, '8.0'
   project 'BBLiveDemo/BBLiveDemo.xcodeproj'

  # Pods for BBLiveDemo
   pod 'SDWebImage', '~> 4.3.3'
   pod 'MJExtension', '~> 3.0.13'


  target 'BBLiveDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BBLiveDemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'BBLiveSDK' do
   platform :ios, '8.0'
   project 'BBLiveSDK/BBLiveSDK.xcodeproj'

   pod 'AFNetworking', '~> 3.2.0'
   pod 'RongCloudIM/IMLib', '~> 2.8.3'
   pod 'FCUUID', '~> 1.3.1'
   pod 'MJExtension', '~> 3.0.13'
   pod 'SDWebImage', '~> 4.3.3'
   pod 'Masonry', '~> 1.1.0'
   pod 'libextobjc/EXTScope', '~> 0.4.1'
   pod 'YYText', '~> 1.0.7'

#   真机
   pod 'PLPlayerKit', '~> 3.3.0'
   pod 'PLRTCStreamingKit_Gray', '~> 1.0.2'
   
#   模拟器
#   pod 'PLPlayerKit', :podspec => 'https://raw.githubusercontent.com/pili-engineering/PLPlayerKit/master/PLPlayerKit-Universal.podspec'

	
end 
