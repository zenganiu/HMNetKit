
Pod::Spec.new do |spec|

  spec.name         = "HMNetKit"
  spec.version      = "0.0.1"
  spec.summary      = "网络库"
  spec.description  = <<-DESC
                    网络库
                   DESC

  spec.homepage     = "https://gitee.com/HuiMin18/HMNetKit"
  spec.license      = "MIT"
  spec.author       = { "xuhuimin" => "1126981418@qq.com" }
  spec.platform     = :ios, "10.0"
  
  spec.source       = { :git => "https://gitee.com/HuiMin18/HMNetKit.git", :tag => "#{spec.version}" }


  spec.source_files = "Sources/**/*.swift"
  
  spec.dependency "SwiftyJSON", "5.0.0"
  spec.dependency 'Moya', '~> 14.0'
  
end
