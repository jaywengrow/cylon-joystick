###
 * Cylon.js Xbox 360 Joystick adaptor
 * http://cylonjs.com
 *
 * Copyright (c) 2013-2014 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict'

namespace = require 'node-namespace'

require '../cylon-joystick'

DualShock = require 'dualshock-controller'

namespace "Cylon.Adaptors.Joystick", ->
  class @DualShock3 extends Cylon.Adaptor
    constructor: (opts = {}) ->
      config = opts.extraParams.config
      opts.initialize ?= true
      @joystick = null
      super
      @connectToController(config) if opts.initialize

    connectToController: (config) ->
      @connector = @joystick = DualShock(config: config)
      @proxyMethods @commands(), @joystick, this

    connect: (callback) ->
      buttons = [
        "r1",
        "l1",

        "r2",
        "l2",

        "start",
        "select",

        "x",
        "triangle",
        "circle",
        "square"
      ]

      for state in ['press', 'release']
        @defineAdaptorEvent
          eventName: "psxButton:#{state}"
          targetEventName: "psbutton:#{state}"

        for button in buttons
          @defineAdaptorEvent eventName: "#{button}:#{state}"

        @defineAdaptorEvent
          eventName: "leftAnalogBump:#{state}"
          targetEventName: "left:#{state}"

        @defineAdaptorEvent
          eventName: "rightAnalogBump:#{state}"
          targetEventName: "right:#{state}"

        for dir in ["Up", "Down", "Left", "Right"]
          @defineAdaptorEvent
            eventName: "dpad#{dir}:#{state}"
            targetEventName: "dpad:#{dir.toLowerCase()}:#{state}"

      @defineAdaptorEvent eventName: 'left:move'
      @defineAdaptorEvent eventName: 'right:move'

      do @joystick.connect

      super
