require "byebug"

def matrix_addition_reloaded(*matrices)
    return *matrices if matrices.length == 1
    if !same_dimensions?(*matrices)
        return nil
    else
        return add_matrices(*matrices)
    end
end

def add_matrices(*matrices)
    final_matrix = Array.new(matrices[0].length){Array.new(matrices[0][0].length,0)}
    matrices.each do |matrix|
        matrix.each_with_index do |array,idx1|
            array.each_with_index do |ele,idx2|
                final_matrix[idx1][idx2] += ele
            end
        end
    end
    final_matrix
end

def same_dimensions?(*matrices)
    x = matrices[0].length
    y = matrices[0][0].length
    matrices.each do |matrix|
        x1 = matrix.length
        y1 = matrix[0].length
        if !(x==x1 && y==y1)
            return false
        end
    end
    return true
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# def squarocol?(two_d_array)
#     max = two_d_array.length
#     y = 0
#     while y < max
#         x = 0
#         row_check = two_d_array[y][0]
#         whole_row=true
#         while x < max
#            whole_row = false if row_check != two_d_array[y][x]
#         x += 1    
#         end
#         return true if whole_row
#         y +=1
#     end

#     x = 0
#     while x < max
#         y1 = 0
#         col_check = two_d_array[0][x]
#         whole_col=true
#         while y1 < max
#            whole_col = false if col_check != two_d_array[y1][x]
#         y1 += 1    
#         end
#         return true if whole_col
#         x +=1
#     end
#     false
# end

def squarocol?(matrix)
    
    matrix.each { |row| return true if row.uniq.length == 1}
    matrix.transpose.each {|col| return true if col.uniq.length == 1}
    false

end


# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


def squaragonal?(two_d_array)
    max = two_d_array.length

    down_diag = true
    start = two_d_array[0][0]
    two_d_array.each_with_index do |row,y|
        down_diag = false if two_d_array[y][y] != start
    end
    return true if down_diag

    up_diag = true
    start = two_d_array[-1][0]
    two_d_array.each_with_index do |row,y|
        up_diag = false if two_d_array[-y-1][y] != start
    end
    return true if up_diag
    false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(num)
    triangle = [[1]]
    while triangle.length < num
        previous_layer = triangle[-1]
        new_layer = Array.new(previous_layer.length + 1)
        new_layer.each_with_index do |ele,idx|
            if idx == 0
                left_parent = 0
            else
                left_parent = previous_layer[idx-1]
            end
            if idx == new_layer.length-1
                right_parent = 0
            else
                right_parent = previous_layer[idx]
            end
            new_layer[idx] = left_parent + right_parent
        end
        triangle << new_layer
    end
    triangle
end

# p pascals_triangle(5)
# p pascals_triangle(7)
