Pod::Spec.new do |s|
  s.name         = 'QWebImage'
  s.version      = '1.0.0'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/QianChia/QWebImage'
  s.authors      = 'QianChia': 'jhqian0228@icloud.com'
  s.summary      = 'A simple encapsulation of images downloaded'
  s.source       =  git: 'https://github.com/QianChia/QWebImage.git', :tag => s.version
  s.source_files = 'QWebImage'
  s.requires_arc = true
end
