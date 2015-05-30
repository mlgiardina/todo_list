require_relative '../db/setup.rb'
require_relative './todo.rb'

class TodoList

  def initialize
    @todos = Todo.all
  end

  def start
    view_todos
    display_options
    get_input
    do_stuff

  end

  def view_todos
    puts "------To Do List------"
    @todos.each { |item| puts item.entry }
  end

  def do_stuff
    case @input
    when "1"
      add_todo
    when "2"
      puts "Which entry would you like to mark as completed?"
    when "3"
      puts "Which entry would you like to delete?"
    when "4"
      puts "Goodbye!"
      exit
    else
      puts "That's not a valid option"
    end
  end

  def display_options
    puts "\n\nWhat would you like to do?\n"
    puts "(1) Add an entry"
    puts "(2) Mark an entry as completed"
    puts "(3) Delete Todo"
    puts "(4) Quit"
  end

  def add_todo
    Todo.create(entry: response)
  end

  def get_input
    @input = gets.chomp
  end

end

TodoList.new.start
