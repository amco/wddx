#!/usr/bin/env ruby
#
#  Created by Stefan Saasen on 2006-12-18.
#  Copyright (c) 2006. All rights reserved.

File.open(File.dirname(__FILE__) + "/../../Manifest.txt", "a") do |f|

  f << Dir[File.dirname(__FILE__) + "/*.{xml,txt}"].collect{|file| "test/fixtures" + file.sub(File.dirname(__FILE__), "")}.join("\n")
end