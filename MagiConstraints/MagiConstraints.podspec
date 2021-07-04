Pod::Spec.new do |spec|

  spec.name         = "MagiConstraints"
  spec.version      = "1.1.0"
  spec.summary      = "Syntactic sugar for AutoLayout to speed up making constraints in one-line-function like magic ✨"
  spec.description  = "MagiConstraints is a syntactic sugar to make autolayout easier to use ... the idea is to satisfy all 4 constraints ( x-axis, width, y-axis, height ) in one line function by covering different ways to satisfy each constraint using enums parameters ... and also to create dynamic views like ( scrollViews and StackViews ) in a very simple way using one line function like magic ✨"

  spec.homepage     = "https://github.com/BelalSamy/MagiConstraints"
  spec.license      = "MIT"
  spec.author             = { "Belal Samy" => "belalsamy10@gmail.com" }
  spec.platform     = :ios, "13.6"
  spec.source       = { :git => "https://github.com/BelalSamy/MagiConstraints.git", :tag => spec.version.to_s }
  spec.source_files  = "MagiConstraints/**/*.{swift}"
  spec.swift_versions = "5.0"
end
