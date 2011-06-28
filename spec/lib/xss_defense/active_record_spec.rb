require 'spec_helper'
require 'xss_defense'

class ActiveRecordPerson < ActiveRecord::Base
  set_table_name :people
end

describe XssDefense::ActiveRecord do
  before(:all) do
    load_schema
  end
  
  describe "class methods" do
    it "has the xss_defense class method" do
      ActiveRecordPerson.methods.should include('xss_defense')
    end
  end
  
  describe "validator set-up" do
    before do
      ActiveRecordPerson.send(:xss_defense)
    end
    
    it "adds a validator" do
      ActiveRecordPerson.validators.count.should == 1
    end
    
    it "validates each :string field" do
      validated_atts = ActiveRecordPerson.validators.map(&:attributes).flatten.uniq
      validated_atts.should include(:forename)
      validated_atts.should include(:surname)
    end
    
    it "validates each :text field" do
      validated_atts = ActiveRecordPerson.validators.map(&:attributes).flatten.uniq
      validated_atts.should include(:description)
    end
  end
end