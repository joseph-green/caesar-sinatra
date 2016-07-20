require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do 
	if params['factor'] == nil && params['word'] == nil
		factor = 5
		word = "Write a Message"
	else
		factor = params['factor'].to_i
		word = params['word']
	end
	

	word_array = word.split('')
	word_array.each_index do |index|
		ascii = word_array[index].ord
		if ascii > 96 && ascii < 123
			new_ascii = ascii + factor
			new_ascii -= 26 until new_ascii > 122
			new_ascii += 26 until new_ascii < 97
			word_array[index] = new_ascii.chr
		elsif ascii > 64 && ascii < 91
			new_ascii = ascii + factor
			new_ascii -= 26 until new_ascii > 90
			new_ascii += 26 until new_ascii < 65
			word_array[index] = new_ascii.chr
		
			
		end
	end		
	new_word = word_array.join('')
	erb :index, :locals => {:word => new_word}
end