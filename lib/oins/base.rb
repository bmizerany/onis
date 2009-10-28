require 'tempfile'
require 'fileutils'

module Oins
  module Base
    def self.drop_pid(pid = Process.pid)
      path_for_pid(pid).tap {|pfp| FileUtils.touch(pfp)}
    end

    def self.path_for_pid(pid)
      File.join(Dir.tmpdir, "oins-#{pid}")
    end

    def self.start!
      pfp = drop_pid
      trap("USR1") do
        open(pfp, 'w') do |f|
          ObjectInspector.all.each do |o|
            f.puts o.join(",")
          end
        end
      end
    end
  end

  module ObjectInspector
    def self.all
      h = Hash.new(0)
      ObjectSpace.each_object do |o|
        h[o.class] += 1
      end
      h.sort {|a, b| b.last <=> a.last}
    end
  end
end
