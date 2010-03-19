require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_binary')

class Diplom
  include ActsAsBinary
  binary_data do
    country_code
      #  90 = USA
      #  91 = RUSSIA
      #  92 = UK
      #  93 = FRANCE
      #  94 = GERMANY
      #  95 = ITALY
      #  96 = SPAIN
      #  97 = CHINA
      #  98 = JAPAN
      #  99 = INDIA
      # 100 = BRAZIL
      # 101 = AUSTRALIA
      # 102 = NIGERIA
      # 103 = SOUTH AFRICA
      # 104 = EGYPT
      # 105 = CANADA
    skip 3
    funding 2 #FIXME: verify; NOTE: actual is this * 1000
    skip 20
    previous_funding 2 #FIXME: verify; NOTE: actual is this * 1000
    skip 8
  end
end
