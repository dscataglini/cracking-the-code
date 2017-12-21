def zero_matrix(m)
  xs = {}
  ys = {}
  m.each_with_index do |row, y|
    row.each_with_index do |el, x|
      if el.zero?
        xs[x] = 1
        ys[y] = 1
      end
    end
  end
  m.each_with_index do |row, y|
    row.each_with_index do |el, x|
      if xs[x] || ys[y]
        m[y][x] = 0
      end
    end
  end
  m
end


[
  [[[1]],[[1]]],
  [[[0, 2], 
    [4, 3]],
    [[0, 0], 
     [0, 3]]],
  [
   [[1, 2, 3, 0, 6], 
    [4, 5, 6, 1, 2], 
    [7, 8, 9, 3, 4]],
   [[0, 0, 0, 0, 0], 
    [4, 5, 6, 0, 2], 
    [7, 8, 9, 0, 4]]
   ],
  [[[1, 2, 3, 4], 
    [5, 6, 7, 8], 
    [9, 0, 11, 12],
    [13, 14, 15, 16]],
   [[1, 0, 3, 4], 
    [5, 0, 7, 8], 
    [0, 0, 0, 0],
    [13, 0, 15, 16]]
   ]
    
  ].each do |i, o|
    puts "zero_matrix(#{i}) == #{o} => #{zero_matrix(i) == o ? true : zero_matrix(i)} "
  end