Gem::Specification.new do |spec|
  spec.name          = "alcohol_bot"
  spec.version       = "0.0.1"
  spec.authors       = ["tanaka.yoshi10"]
  spec.email         = ["tanaka.yoshi10@gmail.com"]
  spec.summary       = "return value of alcohol sensor"
  spec.files         = ["alcohol.rb"]
  spec.require_path  = "."
  spec.add_dependency 'serialport'
end
