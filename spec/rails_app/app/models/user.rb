class User < ActiveRecord::Base
  easy_rps :taker

  def taker_doc_type
    # 1 - CPF
    # 2 - CNPJ
    # 3 - Não possui
    1
  end

  def taker_doc_value
    self.cpf
  end
end