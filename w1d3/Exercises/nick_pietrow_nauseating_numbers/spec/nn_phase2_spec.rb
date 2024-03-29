require "nn_phase2"

describe "Phase 2:" do
    describe "anti_prime" do
        it "should accept a number as an argument" do
            expect {anti_prime?(24)}.to_not raise_error
        end
        it "should return true if the given number has more divisors than all positive numbers less than the given number" do
            expect(anti_prime?(24)).to eq(true)
            expect(anti_prime?(36)).to eq(true)   
            expect(anti_prime?(48)).to eq(true)  
            expect(anti_prime?(360)).to eq(true) 
            expect(anti_prime?(1260)).to eq(true) 
            expect(anti_prime?(27)).to eq(false)   
            expect(anti_prime?(5)).to eq(false)    
            expect(anti_prime?(100)).to eq(false)  
            expect(anti_prime?(136)).to eq(false) 
            expect(anti_prime?(1024)).to eq(false) 
        end
    end

    describe "matrix_addition" do
        matrix_a = [[2,5], [4,7]]
        matrix_b = [[9,1], [3,0]]
        matrix_c = [[-1,0], [0,-1]]
        matrix_d = [[2, -5], [7, 10], [0, 1]]
        matrix_e = [[0 , 0], [12, 4], [6,  3]]
        it "should accept 2 matrices as arguments" do
            expect {matrix_addition(matrix_a, matrix_b)}.to_not raise_error
        end
        it "should return a new matrix representing the sum of the two arguments" do
            expect(matrix_addition(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
            expect(matrix_addition(matrix_a, matrix_c)).to eq([[1, 5], [4, 6]])
            expect(matrix_addition(matrix_b, matrix_c)).to eq([[8, 1], [3, -1]])
            expect(matrix_addition(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
        end
    end
end