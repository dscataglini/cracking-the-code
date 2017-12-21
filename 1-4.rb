def palindrome(str)
  h = str.chars.reduce({}) do |a, e|
    if e != ' '
      a[e.downcase] ||= 0
      a[e.downcase] += 1
    end
    a
  end
  h.values.reject{ |v| v.even? }.size <= 1
end

# Assuming Ascii values only [a-zA-Z<space>]
def palindrome(str)
  str.chars.reduce(Array.new(26, 0)) do |a, e|
    idx = e.ord % 32
    a[idx].zero? ?  a[idx] = 1 : a[idx] = 0
    a
  end.tap { |arr| arr.shift }.reduce(0){ |a, e| a + e } < 2
end

puts palindrome('taco act') 
puts palindrome("taco cat")
puts palindrome("cccccccc")
puts palindrome("a")
puts palindrome("cccaccc")
puts palindrome("cat")
puts palindrome("racecar")