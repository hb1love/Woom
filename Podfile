platform :ios, '13.0'
workspace 'Um'

inhibit_all_warnings!
use_frameworks!

def common
  # Logging
  pod 'SwiftyBeaver'
  pod 'Umbrella'
  pod 'Umbrella/Firebase'

  # SDK
#  pod 'Fabric'
#  pod 'Crashlytics'
  pod 'Firebase/Core'
  pod 'Firebase/Analytics'
end

def rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxCodable'
  pod 'RxGesture'
end

def ui
  pod 'ReactorKit'
  pod 'SnapKit'
end

def networking
  pod 'Alamofire'
  pod 'Moya'
  pod 'Moya/RxSwift'
end


target 'Um' do
  project 'Um/Um'
  common
  rx
  ui
  networking

  target 'UmTests' do
    inherit! :search_paths
  end
end

#target 'UmTests' do
#  project 'Um/Um'
#  common
#  rx
#  ui
#  networking
#end

target 'Sharing' do
  project 'Sharing/Sharing'
  common
  rx
  ui
  networking

  target 'SharingTests' do
    inherit! :search_paths
  end
end

#target 'SharingTests' do
#  project 'Sharing/Sharing'
#  common
#  rx
#  ui
#  networking
#end

target 'Chat' do
  project 'Chat/Chat'
  common
  rx
  ui
  networking

  target 'ChatTests' do
    inherit! :search_paths
  end
end

#target 'ChatTests' do
#  project 'Chat/Chat'
#  common
#  rx
#  ui
#  networking
#end

target 'Common' do
  project 'Common/Common'
  common
  rx

  target 'CommonTests' do
    inherit! :search_paths
  end
end

#target 'CommonTests' do
#  project 'Common/Common'
#  common
#  rx
#end
