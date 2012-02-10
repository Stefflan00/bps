module BitcoinHelpers
  def public_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).public_key
  end
  
  def private_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).private_key
  end
  
  def send_bitcoins(options)
    DBC.require(options[:to])
    DBC.require(options[:amount])
    
    ba = BitcoinAddress.find_by_address options[:to]
    
    Payment.make amount: options[:amount],  bitcoin_address: ba
  end
end

RSpec.configuration.include BitcoinHelpers