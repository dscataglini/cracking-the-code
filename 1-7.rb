def rotate(matrix, max = (matrix.length / 2.0).ceil, size = matrix.length, layer = 0)
  holder = nil
  while(layer < max) do
    x, y = layer, layer
    top = (size - 1) - layer
    current = matrix[y][x]
    while(y < top) do
      holder = matrix[y.next][x]
      matrix[y.next][x] = current
      current = holder
      y += 1
    end

    while(x < top) do
      holder = matrix[y][x.next]
      matrix[y][x.next] = current
      current = holder
      x += 1
    end

    while(y > layer) do
      holder = matrix[y - 1][x]
      matrix[y - 1][x] = current
      current = holder
      y -= 1
    end

    while(x > layer) do
      holder = matrix[y][x - 1]
      matrix[y][x - 1] = current
      current = holder
      x -= 1
    end
    layer += 1
  end
  matrix
end

def rotate(matrix, max = (matrix.length / 2.0).ceil, size = matrix.length)
  y = -1
  matrix.map do |el|
    y += 1
    x = -1
    matrix.map do |el1|
      x += 1
      new_value(matrix, y, x, size, max)
    end
  end
end

def new_value(m, y, x, size, mid)
  if size.odd? && mid == x.next && mid == y.next
    return m[y][x]
  end
  if x >= y && (x.next < size - y)
    m[y][x.next]
  elsif x > y
    m[y.next][x]
  elsif y >= x && (x + y >= size)
    m[y][x-1]
  else
    m[y-1][x]
  end
end


[
  [[[1]],[[1]]],
  [[[1, 2], 
    [4, 3]],
    [[2, 3], 
     [1, 4]]],
  [[[1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9]],
   [[2, 3, 6], 
    [1, 5, 9],
    [4, 7, 8]]],
  [[[1, 2, 3, 4], 
    [5, 6, 7, 8], 
    [9, 10, 11, 12],
    [13, 14, 15, 16]],
   [[2, 3, 4, 8], 
    [1, 7, 11, 12], 
    [5, 6, 10, 16],
    [9, 13, 14, 15]]]
    
  ].each do |i, o|
    puts "rotate(#{i}) == #{o} => #{rotate(i) == o ? true : rotate(i)} "
  end