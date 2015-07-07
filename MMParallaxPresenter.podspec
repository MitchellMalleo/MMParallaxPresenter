Pod::Spec.new do |s|
  s.name             = "MMParallaxPresenter"
  s.version          = "0.0.1"
  s.summary          = "A custom UIScrollView with a vertical parallax effect"
  s.homepage         = "https://github.com/MitchellMalleo/MMParallaxPresenter"
  s.license          = 'MIT'
  s.author           = { "Mitch Malleo" => "mitchellmalleo@gmail.com" }
  s.source           = { :git => "https://github.com/MitchellMalleo/MMParallaxPresenter.git", :tag => s.version.to_s }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
end