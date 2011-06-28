About this gem
==============

This gem is a work in progress (in fact right now barely started). In time, this gem will provide simple, automatic validation of all string
fields in your models to protect them from XSS attacks.

In the short term, the functionality provided is extremely limited:

```ruby
class MyModel < ActiveRecord::Base
  xss_defense # Enables XSS defense on this model.
end
```

This will automatically validate all string attributes in the model to ensure they only contain safe characters. The list of allowed characters
is described in the [XssValidator][1] class.

Contributions
=============

This gem was initially created to support a 'pet project'. Contributions are absolutely welcome. Standard rules apply: Please fork, write tests,
implement them, commit your changes and then submit a pull request. RSpec is enabled on the project, as is guard. Run `rake spec` to execute your tests.

Disclaimer
==========

xss_defense is offered as-is and with no warranties of any kind, express, implied, statutory or otherwise, including, without limitation,
warranties of title, merchantibility, fitness for a particular purpose, or noninfringement.

The authors do not warrant that xss_defense will provide protection from cross-site scripting attacks.

xss_defense is not a substitute for carrying out a full and professionally conducted risk assessment of your application, and xss_defense
alone is not sufficient protection from cross site scripting attacks.

[1]: https://github.com/pauljamesrussell/xss_defense/blob/master/lib/xss_defense/xss_validator.rb