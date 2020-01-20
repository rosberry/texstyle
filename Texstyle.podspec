Pod::Spec.new do |spec|

  spec.name         = "Texstyle"
  spec.version      = "0.4"
  spec.summary      = "Format iOS attributed strings easily"

  spec.homepage     = "https://github.com/rosberry/texstyle"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Rosberry" => "develop@rosberry.com" }

  spec.swift_version = "5.0"
  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/rosberry/texstyle.git", :tag => "#{spec.version}" }

  spec.source_files  = "Texstyle/Texstyle/*.{swift, h}"

end
