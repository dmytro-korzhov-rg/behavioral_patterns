# frozen_string_literal: true

class EditorMemento
  attr_reader :content

  def initialize(content)
    @content = content
  end
end
