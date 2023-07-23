# frozen_string_literal: true

class EditorHistory
  def initialize
    @history = []
  end

  def push(memento)
    @history.push(memento)
  end

  def pop
    @history.pop
  end
end
