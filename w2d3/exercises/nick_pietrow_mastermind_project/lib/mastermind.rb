require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_guess)
        exact = @secret_code.num_exact_matches(code_guess)
        near = @secret_code.num_near_matches(code_guess)
        puts "There are #{exact} exact matches and #{near} near matches."
    end

    def ask_user_for_guess
        print "Enter a code: "
        input = gets.chomp
        code = Code.from_string(input)
        self.print_matches(code)
        @secret_code == code
    end
end
