require 'tempfile'
require 'fileutils'

module Oins
  def self.all
    h = Hash.new(0)
    ObjectSpace.each_object do |o|
      h[o.class] += 1
    end
    h.sort {|a, b| b.last <=> a.last}
  end

  def self.report(tty=false)
    report = ""
    line = "%-45s %-10s\n"
    report << line % %w|Class Count|
    report << "-" * 56 << "\n"
    n = 0
    ObjectInspector.all.each do |x|
      report << "\e[7m" if tty && ((n += 1) % 2).zero?
      report << line % x
      report << "\e[m" if tty
    end
    report
  end
end
