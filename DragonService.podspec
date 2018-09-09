Pod::Spec.new do |s|
  s.name         = "DragonService"
  s.version      = "1.0.2"
  s.summary      = "A library to fetch data from Data Dragon."
  s.description  = <<-DESC
  A Swift library designed to fetch League of Legends static data from Riot Games DataDragon CDN.
                   DESC

  s.homepage     = "https://github.com/WxWatch/DragonService"
  s.license      = "MIT"
  s.author             = "WxWatch"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/WxWatch/DragonService.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"
  s.dependency "Alamofire", "~> 4.7"
  s.swift_version = "4"

end
