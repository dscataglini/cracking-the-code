def string_rotation(s1, s2)
  return false if s1.length != s2.length
  !!(s1 + s1)[s2]
end

[
  ["waterbottle", "erbottlewat", true],
  ["waterbottle", "erbottlewae", false],
  ["asdf", "sdfa", false],
].each do |s1, s2, expected|
  puts "#{s1} #{s2} => #{string_rotation(s1, s2) == expected}"
end