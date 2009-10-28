onis (pronounced onis)

Onis gives you introspection into object counts of live running
process.

# Example

    $ cd onis/

    $ cat test/stringpwd.rb &
    require 'oins'
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

# Color!

    $ onis -f -c 26584

# How it works

  1. Onis drops a tempfile named after the pid `onis.<pid>`
  2. Onis then traps SIGUSR1
  3. When SIGUSR1 is sent to a process that
     has `require`d Onis, Onis will dump the ObjectSpace and counts
     to that tempfile.

# TODO:  
  * handle `fork`

(c) 2009 Blake Mizerany

# Thanks
  - Aman Gupta (tmm1) for inspiration and example
  - Ryan Tomayko for playing that great music at Columbus Cafe
    and telling me to take this one step further
