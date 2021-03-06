# cat config.ru
require "roda"
require "./accounts_model.rb"

class EthSnapshot < Roda

  route do |r|
    r.on "addresses" do
      r.post "submit" do
          @address = r.params['address']
          Accounts.add_address(@address)
        end
        
      r.is "print" do
        Accounts.get_accounts_json
      end
    end
  end

end
