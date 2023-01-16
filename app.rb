class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @sources = []
    @authors = []
  end

  def prompt()
    puts
    puts 'select an option:'
    puts
    puts "
    1. List all books \n
    2. List all music albums \n
    3. List all movies \n
    4. List all games \n
    5. List all genres \n
    6. List all labels \n
    7. List all sources \n
    8. List all authors \n
    9. Add a book \n
    10. Add a music album \n
    11. Add a movie \n
    12. Add a game \n
    00. Exit"
  end

  def user_input()
    gets.chomp.to_i
  end

  def add_book
    puts 'Book added Successfully'
  end

  def add_music_album
    puts 'Music album added Successfully'
  end

  def add_movie
    puts 'Movie added Successfully'
  end

  def add_game
    puts 'Game added Successfully'
  end

  def selected_option(options)
    case options
    when 1
      puts 'List all books'
    when 2
      puts 'List all music albums'
    when 3
      puts 'List all movies'
    when 4
      puts 'List all games'
    when 5
      puts 'List all genres'
    when 6
      puts 'List all labels'
    when 7
      puts 'List all sources'
    when 8
      puts 'List all authors'
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    when 0o0
      puts 'Goodbye'
    else
      puts 'Invalid option'
    end
  end
end
