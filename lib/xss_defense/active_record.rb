require 'xss_defense/xss_validator'

module XssDefense
  module ActiveRecord
    def self.included(base)
      base.send :extend, ClassMethods
    end
    
    module ClassMethods
      def xss_defense
        cols = self.columns.select { |c| c.type == :string || c.type == :text }
        validates_with ::XssDefense::XssValidator, :attributes => cols.map {|c| c.name.to_sym}
      end
    end
    
  end
end