Pod::Spec.new do |spec|
  spec.name         = "CA-Network"
  spec.version      = "1.0.1"
  spec.summary      = "Clapping Ape base network"
  spec.description  = "Clapping Ape's utility for requesting data"
  spec.homepage     = "https://github.com/mazmik25/CA-Network.git"
  spec.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }
  spec.author       = "mazmik25"
  spec.platform     = :ios, "9.0"
  spec.swift_version = "5.0"
  spec.source       = { 
	:git => "https://github.com/mazmik25/CA-Network.git", 
	:tag => "#{spec.version}" 
  }
  spec.source_files        = "CA-Network/**/*.{h,m,swift}"
  spec.public_header_files = "CA-Network/**/*.h"
  spec.exclude_files =  "CA-Network/Exclude"

  spec.subspec 'Alamofire' do |c|
      c.dependency 'Alamofire', '~> 4.9.1'
  end

end
