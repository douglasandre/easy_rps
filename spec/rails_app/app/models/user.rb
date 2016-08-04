class User < ActiveRecord::Base
  easy_rps :taker

  def doc_type
    'cpf'
  end

  def doc
    self.cpf
  end
end