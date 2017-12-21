def string_compression(str)
  current_char = nil
  count = 0
  pipe = ''
  (0..str.length-1).each do |idx|
    if(current_char != str[idx])
      pipe << "#{current_char}#{count}" unless current_char.nil?
      count = 0
      current_char =  str[idx]
    end
    count += 1
  end
  pipe << "#{current_char}#{count}" unless current_char.nil?
  pipe.length > str.length ? str : pipe
end

puts string_compression("aaabcccaaa")
puts string_compression("aabcccccaaafffff")
puts string_compression("aaaabc")
puts string_compression("a")