require_relative './modules/handle_author'
require_relative './modules/handle_game'
require_relative './modules/handle_movies'
require_relative './modules/handle_source'
require_relative './classes/label'
require_relative './classes/genre'
require_relative './classes/author'
require_relative './classes/source'
require_relative './modules/handle_books'
require_relative './modules/handle_labels'
require_relative './classes/music_album'
require_relative './modules/handle_music_album'
require_relative './modules/handle_genre'

class App
  include HandleBooks
  include HandleLabels
  include HandleAuthor
  include HandleGame
  include HandleMusicAlbums
  include HandleGenre
  include HandleMovie
  include HandleSource

  def initialize
    @books = load_books
    @music_albums = load_music_albums
    @movies = load_movies
    @games = load_games
    @genres = load_genres
    @labels = load_labels
    @curr_labels = []
    @sources = load_source
    @authors = load_authors
    @current_authors = []
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
    0. Exit"
  end

  def user_input(msg_to_user)
    print msg_to_user
    gets.chomp
  end

  def create_an_item(item)
    label_title = user_input('Enter item label title (e.g. "Gift", "New"): ')
    label_color = user_input('Enter item label color: ')

    author_first_name = user_input('Author first name: ')
    author_last_name = user_input('Author last name: ')

    genre_name = user_input("Item genre (e.g 'Horror', 'History'): ")

    sourcer_name = user_input("Item source (e.g. 'Wikipedia', 'Google'): ")

    label = Label.new(label_title, label_color)
    item.add_label(label)
    @curr_labels << label unless @curr_labels.include?(label)
    save_label(@curr_labels, label)

    author = Author.new(author_first_name, author_last_name)
    item.add_author(author)
    @authors << author unless @authors.include?(author)

    genre = Genre.new(genre_name)
    item.add_genre(genre)
    @genres << genre unless @genres.include?(genre)

    source = Source.new(sourcer_name)
    @sources = item.add_source(source)
  end

  def selected_option(options)
    case options
    when '1'
      puts list_books
    when '2'
      puts list_all_music_albums
    when '3'
      puts list_movies
    when '4'
      puts list_games
    when '5'
      puts list_all_genre
    when '6'
      puts list_labels
    when '7'
      puts list_sources
    when '8'
      puts list_author
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_movie
    when '12'
      add_game
    when '0'
      puts 'Goodbye'
    else
      puts 'Invalid option'
    end
  end
end
