
module XssDefense
  class XssValidator < ActiveModel::EachValidator
    WHITELIST_REGEXP = /\A[\w\s\&\-\!\@\xA3\$\%\*\(\)\{\}\+\[\]\\\/\.\,\?\;\:\'\"\~]*\Z/
    
    def whitelist_regexp(attribute)
      WHITELIST_REGEXP
    end
    
    def validate_each(record, attribute, value)
      record.errors.add(attribute,:unsafe_characters, :message => "contained unsafe characters") unless value.blank? || value =~ whitelist_regexp(attribute)
    end
  end
end