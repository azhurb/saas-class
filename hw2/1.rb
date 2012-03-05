class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

  def method_missing(method_id, *args)
    method_id = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(method_id)
      self * @@currencies[method_id]
    elsif method_id == "in"
      singular_currency = args[0].to_s.gsub(/s$/, '')
      if @@currencies.has_key?(singular_currency)
        self / @@currencies[singular_currency]
      end
    end

  end
end

module Enumerable
  def palindrome?
    if self.kind_of? String
      str = self.downcase.gsub(/[^\w]/, "")
    elsif self.kind_of? Hash or self.kind_of? Range
      return false
    elsif kind_of? Array
      str = self
    else
      return true
    end
    str == str.reverse
  end
end

class String
  include Enumerable
end
