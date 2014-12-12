module.exports =
  activate: (state) ->
    atom.commands.add 'atom-text-editor',
      "upper-case-backward:convert": ->
        editor = @getModel()
        editor.mutateSelectedText (selection) ->
          original_range = selection.getBufferRange()
          selection_was_empty = selection.isEmpty()
          selection.selectWord() if selection.isEmpty()
          loop
            text = selection.getText()
            upper = text.toUpperCase()
            if upper isnt text
              selection.deleteSelectedText()
              selection.insertText(upper)
              break
            break unless selection_was_empty
            # give up when the selection reached to the begining of the buffer.
            break if selection.getBufferRange().start.isEqual([0, 0])
            # try previous word
            selection.selectToBeginningOfWord()
          # restore range
          selection.setBufferRange(original_range)
