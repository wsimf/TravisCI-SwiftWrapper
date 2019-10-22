platform :ios, '11.0'
inhibit_all_warnings!

target 'TravisCI' do
  pod 'Alamofire'
end

target 'TravisCITests' do
    inherit! :search_paths
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Workaround for unit test bug introduced in Xcode 10.
      if config.name == 'Debug' && defined?(target.product_type) && target.product_type == 'com.apple.product-type.framework'
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
      end
    end
  end
end
