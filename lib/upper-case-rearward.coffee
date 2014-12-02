UpperCaseRearwardView = require './upper-case-rearward-view'

module.exports =
  upperCaseRearwardView: null

  activate: (state) ->
    @upperCaseRearwardView = new UpperCaseRearwardView(state.upperCaseRearwardViewState)

  deactivate: ->
    @upperCaseRearwardView.destroy()

  serialize: ->
    upperCaseRearwardViewState: @upperCaseRearwardView.serialize()
