noflo = require 'noflo'

class CreateArray extends noflo.Component
  constructor: ->
    @inPorts = new noflo.InPorts
      start:
        datatype: 'bang'
        description: 'Signal to create a new array'
    @outPorts = new noflo.OutPorts
      out:
        datatype: 'array'
        description: 'A new empty array'

    @inPorts.start.on 'begingroup', (group) =>
      @outPorts.out.beginGroup group
    @inPorts.start.on "data", =>
      @outPorts.out.send []
    @inPorts.start.on 'endgroup', =>
      @outPorts.out.endGroup()
    @inPorts.start.on 'disconnect', =>
      @outPorts.out.disconnect()

exports.getComponent = -> new CreateArray
