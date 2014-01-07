# Cylon.js For Joysticks and Controllers

Cylon.js (http://cylonjs.com) is a JavaScript framework for robotics and
physical computing using Node.js

This repository contains the Cylon adaptor for the Xbox 360 controller, or any other joysticks and game controllers that are HID devices.

Want to use Ruby on robots? Check out our sister project Artoo (http://artoo.io)

Want to use the Go programming language to power your robots? Check out our sister project Gobot (http://gobot.io).

[![Build Status](https://secure.travis-ci.org/hybridgroup/cylon-joystick.png?branch=master)](http://travis-ci.org/hybridgroup/cylon-joystick)

## Getting Started
Install the module with: `npm install cylon-joystick`

## Examples

### JavaScript

```javascript
var Cylon = require('cylon');

Cylon.robot({
  connection: { name: 'joystick', adaptor: 'joystick' },
  device: {name: 'joystick', driver: 'xbox360'},

  work: function(my) {
    my.joystick.on("left:move", function(position) { 
      console.log(position);
    });
  }
}).start();
```

### CoffeeScript
```
Cylon = require 'cylon'

Cylon.robot
  connection:
    name: 'joystick', adaptor: 'joystick'

  device:
    name: 'joystick', driver: 'xbox360'

  work: (my) ->
    my.joystick.on "left:move", (position) ->
      console.log position

.start()
```

## Documentation
We're busy adding documentation to our web site at http://cylonjs.com/ please check there as we continue to work on Cylon.js

Thank you!

## Contributing

* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality & Lint and test your code using [Grunt](http://gruntjs.com/).
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git

## Release History

None yet...

## License

Copyright (c) 2013-2014 The Hybrid Group. Licensed under the Apache 2.0 license.
