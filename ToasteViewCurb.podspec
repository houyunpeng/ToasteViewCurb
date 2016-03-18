
Pod::Spec.new do |s|

  s.name         = "ToasteViewCurb"
  s.version      = "0.0.1"
  s.summary      = "立体翻转toast"


  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/houyunpeng/ToasteViewCurb"


  s.license      = "MIT (example)"
 
  s.author             = { "houyunpeng" => "1600892327@qq.com" }
  s.osx.deployment_target = "10.7"
   s.ios.deployment_target = "6.0"
 

  s.source       = { :git => "https://github.com/houyunpeng/ToasteViewCurb.git", :tag => "0.0.1" }


  

  s.source_files  = "ToasteViewCurb/ToasteViewCurb1/UIView+ToasteCurbView.h.{h,m}"
  #s.exclude_files = "ToasteCurbView/Exclude"

  
  
end
