require "xss_defense/version"
require 'xss_defense/active_record'
require 'xss_defense/xss_validator'

ActiveRecord::Base.send :include, XssDefense::ActiveRecord
