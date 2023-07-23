# frozen_string_literal: true

require 'rspec'
require_relative '../lib/editor'
require_relative '../lib/editor_history'
require_relative '../lib/editor_memento'

RSpec.describe Editor do
  describe '#content' do
    it 'should return the correct initial content' do
      editor = Editor.new
      expect(editor.content).to eq('')
    end
  end

  describe '#create_memento' do
    it 'should create a new EditorMemento with the correct content' do
      editor = Editor.new
      editor.content = 'Initial content'
      memento = editor.create_memento

      expect(memento).to be_a(EditorMemento)
      expect(memento.content).to eq('Initial content')
    end
  end

  describe '#restore_from_memento' do
    it 'should restore the content from the given EditorMemento' do
      editor = Editor.new
      editor.content = 'Initial content'
      memento = editor.create_memento

      editor.content = 'Modified content'
      editor.restore_from_memento(memento)

      expect(editor.content).to eq('Initial content')
    end
  end

  describe 'EditorHistory' do
    it 'should store and retrieve EditorMementos correctly' do
      editor = Editor.new
      history = EditorHistory.new

      editor.content = 'First state'
      memento1 = editor.create_memento

      editor.content = 'Second state'
      memento2 = editor.create_memento

      history.push(memento1)
      history.push(memento2)

      expect(history.pop).to eq(memento2)
      expect(history.pop).to eq(memento1)
    end
  end
end
