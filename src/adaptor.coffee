###
 * Cylonjs Joystick adaptor
 * http://cylonjs.com
 *
 * Copyright (c) 2013-2014 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';

namespace = require 'node-namespace'
require './cylon-joystick'
XboxController = require 'xbox-controller'

namespace "Cylon.Adaptors", ->
  class @Joystick extends Cylon.Adaptor
    constructor: (opts = {}) ->
      super
      @joystick = new XboxController
      @connector = @joystick
