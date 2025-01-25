class Task
  attr_accessor :name, :description, :status, :priority, :deadline

  def initialize(name, description, deadline, priority, status="Pending")
    @name = name
    @description = description
    @deadline = deadline
    @priority = priority
    @status = status
  end

  def to_array
    [@name, @description, @deadline, @priority, @status]
  end

  def in_progress
    @status == "In Progress"
  end
  def done
    @status = "Done"
  end

end