def palindrome?(string)
  str = string.downcase.gsub(/[^a-z]/, "")
  str == str.reverse
end

def count_words(string)
  result = {}
  string.downcase.gsub(/[^a-z\s]/, "").split(" ").each do |word|
    result[word] == nil ? result[word] = 1 : result[word] = result[word] + 1
  end
  result
end