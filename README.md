![EasyRps Logo](https://raw.github.com/douglasandre/easy_rps/master/easy_rps.png)

# EasyRps

EasyRps allows you to generate RPS for NF-e emission easily. NOTE: WE ARE IN A FIRST VERSION, SO UNTIL NOW WE SUPPORT THE RPS EMISSION JUST FOR SP/SAO PAULO. Contributions are always welcome!


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_rps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_rps

## Usage

EasyRps is based on the concept of tree things on a NF-e generation.

### 1. Taker
The taker on the transaction. On the follow example, we have a User class.

```
class User < ActiveRecord::Base
  easy_rps :taker

  def taker_doc_type
    # 1 - CPF
    # 2 - CNPJ
    # 3 - Doesn't have
    1
  end

  def taker_doc_value
    self.cpf
  end
end
```

### 2. Issuer
The issuer of the RPS / NF-e. On the follow example we have a Business model.
```
class Business < ActiveRecord::Base
  easy_rps :issuer
end
```

### 3. Item
The item that represents the sale by the issuer.
```
class Sale < ActiveRecord::Base

  belongs_to :service
  belongs_to :user
  easy_rps :rps_item

  alias_attribute :emitted_on,   :created_at 
  alias  :taker :user


  def amount_in_cents
    (amount.to_d * 100).to_i
  end

  def rps_status
    'T'
  end

  def tax_amount
    0
  end

  def aliquot
    0
  end

  def iss_withheld
    1
  end

  def rps_description
    service.name
  end

  def service_code
    service.service_code
  end

end
```

### 4. Emitting RPS for a new city
You can configure a new city to emit RPS based on the following file:

```
printers:
  sp:
    sao_paulo:
      file_format:  'txt'

      header:
        register_type:
          value: '1'
          size: 1
          type: 'num'
        file_version:
          value: '002'
          size: 3
          type: 'num'
        municipal_inscription:
          value: 'rps.issuer.municipal_inscription'
          dynamic: true
          size: 8
          type: 'num'
          fill: true
        start_date:
          value: "rps.start_date.strftime('%Y%m%d')"
          dynamic: true
          size: 8
          type: 'num'
        end_date:
          value: "rps.end_date.strftime('%Y%m%d')"
          dynamic: true
          size: 8
          type: 'num'

      detail:
        register_type:
          value: '3'
          size: 1
          type: 'num'
        rps_type:
          value: 'RPS-C'
          size: 5
          type: 'text'
        rps_serie:
          value: 'PB01'
          size: 5
          type: 'text'
          fill: true
          fill_char: ' '
        rps_number:
          value: '@rps_item.rps_item_id'
          dynamic: true
          size: 12
          type: 'num'
          fill: true
        emitted_on:
          value: "@rps_item.emitted_on.strftime('%Y%m%d')"
          size: 8
          type: 'date'
          dynamic: true
        rps_status:
          value: '@rps_item.rps_status'
          dynamic: true
          size: 1
          type: 'text'
        amount:
          value: "@rps_item.amount_in_cents"
          dynamic: true
          size: 15
          type: 'num'
          fill: true
        tax_amount:
          value: '@rps_item.tax_amount'
          dynamic: true
          size: 15
          type: 'num'
          fill: true
        service_code:
          value: '@rps_item.service_code'
          dynamic: true
          fill: true
          size: 5
          type: 'num'
        aliquot:
          value: '@rps_item.aliquot'
          dynamic: true
          size: 4
          type: 'num'
          fill: true
        iss_withheld:
          value: '@rps_item.iss_withheld'
          dynamic: true
          size: 1
          type: 'num'
        taker_doc_type:
          value: '@rps_item.taker.taker_doc_type'
          dynamic: true
          size: 1
          type: 'num'
        taker_doc_value:
          value: '@rps_item.taker.taker_doc_value'
          dynamic: true
          size: 14
          type: 'num'
          dynamic: true
          fill: true
        rps_description: 
          value: '@rps_item.rps_description.upcase'
          dynamic: true
          size: 88
          type: 'text'

      footer:
        register_type:
          value: '9'
          size: 1
          type: 'num'
        total_itens:
          value: '@total_itens'
          dynamic: true
          fill: true
          size: 7
          type: 'num'
        total_amount:
          value: '@total_amount'
          dynamic: true
          fill: true
          size: 15
          type: 'num'
        total_tax_amount:
          value: '@total_tax_amount'
          dynamic: true
          fill: true
          size: 15
          type: 'num'
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/douglasandre/easy_rps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

