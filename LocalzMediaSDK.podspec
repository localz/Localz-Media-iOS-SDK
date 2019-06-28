Pod::Spec.new do |s|

	s.name	= 'LocalzMediaSDK'
	s.summary = 'LocalzMediaSDK'

	s.version = '1.1.0'
	s.platform = :ios,'8.0'
	s.ios.deployment_target = '8.0'

	s.homepage = 'https://www.localz.com'
	s.license = {
		:type => 'Commercial',
		:text => <<-LICENSE
			Copyright 2019 Localz Pty Ltd.
			LICENSE
	}
	s.author = { 'Localz Pty Ltd' => 'info@localz.com' }
	s.source = { :git => 'https://github.com/localz/Localz-Media-iOS-SDK.git',
		 		 :tag => s.version }

	s.requires_arc = true
	s.static_framework = true
	s.swift_version = '5.0'
	s.pod_target_xcconfig = {
		'FRAMEWORK_SERCH_PATHS' => '$(inherited)',
		'DEFINES_MODULE' => 'YES',
		'CLANG_ENABLE_MODULES' => 'YES',
		'SWIFT_OBJC_INTERFACE_HEADER_NAME' => 'LocalzMediaSDK-Swift.h'
	}
	
	s.source_files  =  'LocalzMediaSDK.framework/Headers/*.{swift,h}', 'LocalzMediaSDK.framework'
	s.preserve_paths = 'LocalzMediaSDK.framework/*'
	s.vendored_frameworks = 'LocalzMediaSDK.framework'
	s.dependency 'Alamofire', '~> 4'
end
