require "byebug"

def all_words_capitalized?(array)
    array.all? {|word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]}
end

def no_valid_url?(urls)
    domains = ['.com', '.net', '.io','.org']
    urls.none? {|url| url.end_with?(*domains)}
end

def any_passing_students?(students)
    students.any? {|student| student[:grades].sum/ (student[:grades].length * 1.0) >= 75 }
end