{WorkspaceView} = require 'atom'
UpperCaseRearward = require '../lib/upper-case-rearward'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "UpperCaseRearward", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('upper-case-rearward')

  describe "when the upper-case-rearward:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.upper-case-rearward')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'upper-case-rearward:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.upper-case-rearward')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'upper-case-rearward:toggle'
        expect(atom.workspaceView.find('.upper-case-rearward')).not.toExist()
