class Task
  attr_accessor :name, :description, :status, :priority, :deadline

  def initialize(name, description, deadline, priority)
    @name = name
    @description = description
    @deadline = deadline
    @priority = priority
    @status = "Open"
  end

end