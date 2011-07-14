require 'spec_helper'
require 'xss_defense'

class XssValidatorPerson < ActiveRecord::Base
  set_table_name :people
end

describe XssDefense::XssValidator do
  before(:all) do
    load_schema
  end
  
  before do
    XssValidatorPerson.send :validates_with, XssDefense::XssValidator, :attributes => [:surname]
  end
  
  it "allows any content in non-validated attribute" do
    p = XssValidatorPerson.new(:forename => '<script>alert("unsafe");</script>')
    p.should be_valid
  end
  
  [:script, :a, :applet, :meta, :style, :link].each do |element|
    it "does not allow the <#{element}> tag" do
      p = XssValidatorPerson.new(:surname => "<#{element}></#{element}>")
      p.should_not be_valid
    end
  end
  
  ALLOWED_CHARACTERS = [
    ('a'..'z'), ('A'..'Z'), ('0'..'9'),
    ' ', '\t', '&', '-', '!', '@', '\xA3',
    '$', '%', '*', '(',')','{','}','+','[',
    ']',"\\",'/','.',',','?',';',':',"'",'"','~']
  
  ALLOWED_CHARACTERS.map{|r| r.instance_of?(Range) ? r.to_a : r}.flatten.each do |character|
    it "should allow the #{character} character" do
      p = XssValidatorPerson.new(:surname => character)
      p.should be_valid
    end
  end
end