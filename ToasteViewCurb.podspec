
Pod::Spec.new do |s|

  s.name         = "ToasteViewCurb"
  s.version      = "0.0.1"
  s.summary      = "立体翻转toast"


  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/houyunpeng/ToasteViewCurb"


  s.license      = "MIT (example)"
 
  s.author             = { "houyunpeng" => "1600892327@qq.com" }
target = "10.7"
 

  s.source       = { :git => "https://github.com/houyunpeng/ToasteViewCurb.git", :tag => "0.0.1" }


  

  s.source_files  = "ToasteCurbView/", "ToasteCurbView/UIView+ToasteCurbView.{h,m}"
  s.exclude_files = "Classes/Exclude"

  
  
end
