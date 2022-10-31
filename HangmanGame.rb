class Hangman

    def initialize
        #having them with @ means they can be accessed anywhere within this class.
        @word = wordsInventory.sample
        @guessLives = 7
        @word_teaser = ""
        @word.first.size.times do
            @word_teaser += "_ "
        end
    end

    def wordsInventory
        [
            ["cricket", "A game played by genetlemen"],
            ["soccer","A game brazil is known for"],
            ["mango","King of fruits"],
            ["python","Conding language same as an animal name"],
            ["india","Known for spicy food"],
            ["water","An essential for the body"],
            ["christmas","Something you celebrate for god's birthday"],
            ["obama","First black president of america"],
            ["laden","most famous terrorist"],
            ["hiking","you do on mountains"],
            ["snowman","A man that can melt in heat"],
            ["arigatou"," Thank you in Japanese"],
        ]    
    end

    def update_teaser lastWordFromUser
        new_teaser = @word_teaser.split
        new_teaser.each_with_index do |letter , index|
            #replace blank values with positions matching with words
            if letter == '_' && @word.first[index] == lastWordFromUser
                new_teaser[index] = lastWordFromUser
            end
        end

        @word_teaser = new_teaser.join(' ')
    end

    def print_teaser lastWordFromUser = nil        
        update_teaser(lastWordFromUser) unless lastWordFromUser.nil?
        puts @word_teaser
    end

    def user_input_guess
    if @guessLives > 0
        puts "Enter a letter"
        guessWord = gets.chomp
    # This here is main game, if the entered character is part of the 
        good_guess = @word.first.include? guessWord
        if guessWord == "exit"
            puts "Thank you for playing the game !!"    
        elsif good_guess
            puts "Bingo !! Keep Going"
            print_teaser guessWord
            if @word.first == @word_teaser.split.join
                puts "Congratulations you have successfully guessed it"
            end
            user_input_guess
        else
            @guessLives -= 1
            puts "Blopper...! Think hard, you only have #{@guessLives} left"
            user_input_guess
        end
    else
            puts "Damn...! You ran out of lives. RIP....."
    end
    end

    def begin
        #ask user to input a letter
        puts "NEW GAME HAS STARTED.."
        puts "!!!!To exit game type 'exit'!!!!"

        puts ""

        puts "Your hint is that yourword is of length #{@word.first.size}"
        print_teaser #function called for the teaser of the word
        puts "Clue: #{@word.last}"
        user_input_guess
    end
end


game = Hangman.new
game.begin
