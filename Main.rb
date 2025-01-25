require_relative 'Task'

tasks = []

while true do
  puts "What would you like to do? "
  puts "1. View tasks - 2. Create new task - 3. Save Tasks - 4. Load Tasks: "
  choice = gets.chomp

  # Need to break into methods
  case choice
  when "1"
    if tasks.length == 0
      puts "No tasks found"
    else
      header = ["Name", "Description", "Deadline", "Priority", "Status"]

      puts "+------------+-----------------------+------------+----------+-----------+"
      puts "| %-10s | %-21s | %-10s | %-8s | %-9s |" % header
      puts "+------------+-----------------------+------------+----------+-----------+"

      tasks.each do |row|
        row = row.to_array
        puts "| %-10s | %-21s | %-10s | %-8s | %-9s |" % row
      end
      puts "+------------+-----------------------+------------+----------+-----------+"

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
    input = gets.chomp.to_i
    until input.between?(1, 3)
        puts "Please choose a valid priority"
        puts "Choose priority 1(low)-3(high):"
        input = gets.chomp.to_i
    end
    task_priority = input

    tasks << Task.new(task_name, task_description, task_deadline, task_priority)

  when "3"

    if tasks.length == 0
      puts "No tasks to be saved!"
    else
      data = []
      tasks.each do |task|
        data << task.to_array
      end

      File.open("tasks.txt", "w") do |f|
        tasks.each do |task|
          f.puts task.to_array.join(",")
        end
      end

      puts "Tasks saved!"
    end

  when "4"

    File.readlines("tasks.txt").each do |line|
      line = line.strip
      data = line.split(",")
      tasks << Task.new(data[0], data[1], data[2], data[3], data[4])
    end

    puts "Tasks loaded!"

  else
    puts "Invalid entry, please try again"
  end
end


