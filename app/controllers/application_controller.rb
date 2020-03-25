require 'json'
class ApplicationController < ActionController::API

  # display random set of 16 words
  def gameboard
    alphabets=['A','B','C','D','E','F','G','H','I','J','K','L','M',
    'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    
    # prefered word for making game easy
    easyAlphabets = ['A','H','L','M','N','O','R','S','T']
    
    boardAlphabets = Array.new
    for row in 0..3
      # new column alphabets each time
      columnAlphabets = Array.new 
      for column in 0..3
        if prime(row+column)
          character = easyAlphabets[rand(8)]
        else
          character = alphabets[rand(26)]
          if character == 'Q'
              character = 'Qu'
          end 
        end
          columnAlphabets[column] = character
      end
      boardAlphabets.push columnAlphabets 
    end     
    render json:boardAlphabets;
  end

  # validates word from a dictionary.txt file
  def validateword
      # read lines from text file
      lines = []
        File.open( "dictionary.txt" ) do |io|
          io.each {|line| line.chomp! ; lines << line}
      end
      response = []
      # make a binary search as array is sorted   
      json_params = request[:body][:word]
      print request[:body].class
      isValid = binary_search(json_params,lines)
      if isValid
          response = {isValid:true,message:'is a valid word'}
      else
          response = {isValid:false,message:'is not a valid word'}
      end
      render json:response;
  end

  # binary search
  def binary_search(val, arr)
    middle = arr.length / 2
    i = 0
    j = arr.length - 1
  
    while i < j
      direction = val.casecmp arr[middle]
      if direction == 0
        return true
      elsif direction == 1
        i = middle + 1
        middle = (i + j) / 2
      else
        j = middle - 1
        middle = (i + j) / 2
      end
    end
    return false
  end  
  def prime(n)
    if n <= 1
        false
    elsif n == 2
        true
    else 
        (2..n/2).none? { |i| n % i == 0}
    end
  end
end
