Pod::Spec.new do |s|

  s.name         = "PPRetailInstrumentInterface"
  s.version      = "1.1.6"
  s.summary      = "PPRetailInstrumentInterface is an interface for SDK to log Instrumentation."


s.description  = "Define a protocol used by Retail SDK to execute instrument logging."


s.homepage     = 'https://github.com/paypal/PPRetailInstrumentInterface'
s.license      = { :type => 'PAYPAL', :text => <<-LICENSE
Copyright PayPal Inc. 2018
For internal PayPal use only.
LICENSE
}
s.author       = { 'PayPal' => 'DL-PP-PPH-SDK-Admin@paypal.com' }
s.source       = { :git => 'https://github.com/paypal/PPRetailInstrumentInterface.git', :tag => "v#{s.version}" }

s.license     = "PayPal"

s.source_files  = "PPRetailInstrumentInterface", "PPRetailInstrumentInterface/PPRetailInstrumentInterface/**/*.{h,m}"
s.public_header_files = "PPRetailInstrumentInterafce/PPRetailInstrumentInterface/**/*.h"

s.requires_arc = true

s.ios.deployment_target = '8.1'

s.xcconfig = {
'FRAMEWORK_SEARCH_PATHS' => '$(inherited)',
'OTHER_LDFLAGS' => '/usr/lib/libstdc++.dylib -lstdc++ -ObjC',
}


end
