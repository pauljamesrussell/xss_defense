ActiveRecord::Schema.define(:version => 0) do
  create_table :people, :force => true do |t|
    t.string  :forename
    t.string  :surname
    t.text    :description
  end
end