require 'logger'
require 'active_record'

ENV['RAILS_ENV'] = 'test'

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new("spec/debug.log")
  
  ActiveRecord::Base.establish_connection(config['sqlite3'])
  load(File.dirname(__FILE__) + "/schema.rb")
  ActiveRecord::Base.logger.info("TEST")
end