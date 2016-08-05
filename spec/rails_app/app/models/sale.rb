class Sale < ActiveRecord::Base

  belongs_to :service
  easy_rps :rps_item

  alias_attribute :emitted_on,   :created_at 

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