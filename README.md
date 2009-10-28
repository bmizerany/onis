# onis
(pronounced onis)

Onis gives you introspection into object counts of live running ruby process.

## Install

    $ sudo gem install onis

## Example

    $ cd onis/

    $ cat test/stringpwd.rb &
    require 'onis'
    puts Process.pid
    a = []
    while true ; a << "foo" ; sleep(0.5) ; end

    $ onis
    PID        COMMAND
    ------------------------------------------------------------
    26584      ruby -I lib/ test/stringpwnd.rb

    $ onis -f 26584
    Class                                         Count
    --------------------------------------------------------
    String                                        3483
    Class                                         156
    Array                                         55
    Module                                        25
    Regexp                                        9
    File                                          8
    Hash                                          7
    Float                                         6
    Object                                        3
    ...

## Color!

    $ onis -f -c 26584

## How it works

  1. Onis drops a tempfile named after the pid `onis.<pid>`
  2. Onis then traps SIGUSR1
  3. When SIGUSR1 is sent to a process that
     has `require`d Onis, Onis will dump the ObjectSpace and counts
     to that tempfile.

## TODO:
  * handle `fork`

## Thanks
  - Aman Gupta (tmm1) for inspiration and example
  - Ryan Tomayko for playing that great music at Columbus Cafe
    and telling me to take this one step further

## License
Copyright (c) 2009 Blake Mizerany

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
