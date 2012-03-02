def combine_anagrams(words)
  sorted = words.map do |word|
    word.downcase.split('').sort.join('')
  end

  map = {}

  sorted.each_index do |idx|
    map[sorted[idx]] == nil ? map[sorted[idx]] = [idx] : map[sorted[idx]].push(idx)
  end

  result = []

  map.each do |key, indexes|
    result.push(indexes.collect{|x| words[x]})
  end

  result

end

#print combine_anagrams(['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
#print ["a", "a"].index('a')