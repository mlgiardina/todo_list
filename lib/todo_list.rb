require_relative '../db/setup.rb'
require_relative './todo.rb'

class TodoList


  def start
    @todos = Todo.all
    view_todos
    display_options
    get_input
    make_changes
  end

  def view_todos
    puts "------To Do List------"
    @todos.each { |item| puts item.id.to_s + " | " + item.entry + " | " +
      if item.completed == false
        "incomplete"
      else
          "complete"
      end
    }
  end

  def mark_todo_completed
    puts "Which entry would you like to mark as completed?"
    Todo.update(get_input, completed: true)
  end

  def delete_entry
    puts "Which entry would you like to delete?"
    get_input
    Todo.delete(@input)
  end

  def make_changes
    case @input
    when "1"
      add_todo
      start
    when "2"
      mark_todo_completed
      start
    when "3"
      delete_entry
      start
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
    puts "Add your entry:"
    get_input
    Todo.create(entry: @input)
  end

  def get_input
    @input = gets.chomp
  end

end

TodoList.new.start
