
module XssDefense
  class XssValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'validation not yet implemented'
    end
  end
end