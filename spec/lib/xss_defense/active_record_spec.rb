require 'spec_helper'
require 'xss_defense'

describe XssDefense::ActiveRecord do
  before(:all) do
    load_schema
  end
  
  class Person < ActiveRecord::Base
    
  end
  
  describe "class methods" do
    it "has the xss_defense class method" do
      Person.methods.should include('xss_defense')
    end
  end
  
  describe "validator set-up" do
    before do
      Person.send(:xss_defense)
    end
    
    it "adds a validator" do
      Person.validators.count.should == 1
    end
    
    it "validates each :string field" do
      validated_atts = Person.validators.map(&:attributes).flatten.uniq
      validated_atts.should include(:forename)
      validated_atts.should include(:surname)
    end
    
    it "validates each :text field" do
      validated_atts = Person.validators.map(&:attributes).flatten.uniq
      validated_atts.should include(:description)
    end
  end
end