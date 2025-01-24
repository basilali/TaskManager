require_relative 'Task'

tasks = []

while true do
  puts "What would you like to do? "
  puts "1. View tasks - 2. Create new task - 3. Quit: "
  choice = gets.chomp

  case choice
  when "1"
    if tasks.length == 0
      puts "No tasks found"
    else
      puts "|\t Name \t|\t Description \t|\t Deadline \t|\t Priority \t|\t Status \t|"
      tasks.each do  |task|
        puts "|\t #{task.name} \t|\t #{task.description} \t|\t #{task.deadline} \t|\t #{task.priority} \t|\t #{task.priority} \t|"
      end

    end
    
  when "2"
    puts "Creating new task: "
    puts "Enter task name:"
    task_name = gets.chomp
    puts "Enter task description:"
    task_description = gets.chomp
    puts "Enter deadline:"
    task_deadline = gets.chomp
    puts "Choose priority 1(low)-3(high):"
    task_priority = gets.chomp

    tasks << Task.new(task_name, task_description, task_deadline, task_priority)

  when "3"
    break
  else
    puts "Invalid entry, please try again"
  end
end


