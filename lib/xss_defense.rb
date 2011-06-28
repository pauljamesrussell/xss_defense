require "xss_defense/version"
require 'xss_defense/active_record'

ActiveRecord::Base.send :include, XssDefense::ActiveRecord
