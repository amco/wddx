#!/usr/bin/env ruby
#
#  Created by Stefan Saasen on 2006-12-17.
#  Copyright (c) 2006. All rights reserved.

# Check Xml-Files with xmllint
CMD = "xmllint --noout --valid"
Dir["*.xml"].each {|xml| next if xml =~ /^invalid/; `#{CMD} #{xml}`} 