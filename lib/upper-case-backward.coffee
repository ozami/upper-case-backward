module.exports =
  activate: (state) ->
    atom.commands.add 'atom-text-editor',
      "upper-case-backward:convert": ->
        editor = @getModel()
        editor.transact ->
          editor.getCursors().forEach (cursor) ->
            end = origin = cursor.getBufferPosition()
            loop
              # when the cursor reached to the begining of the buffer.
              break if end.isEqual([0, 0])
              cursor.moveToPreviousWordBoundary()
              begin = cursor.getBufferPosition()
              text = editor.getTextInBufferRange([begin, end])
              uppercase = text.toUpperCase()
              unless uppercase is text
                editor.setTextInBufferRange([begin, end], uppercase)
                break
              # try previous word
              end = begin
            
            # restore the cursors
            cursor.setBufferPosition origin
