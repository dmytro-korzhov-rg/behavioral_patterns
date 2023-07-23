# frozen_string_literal: true

class Editor
  attr_accessor :content

  def initialize
    @content = ''
  end

  def create_memento
    EditorMemento.new(@content)
  end

  def restore_from_memento(memento)
    @content = memento.content
  end
end
