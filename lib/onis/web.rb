require 'onis/base'

module Onis
  module Web
    def self.call(env)
      table = Onis::ObjectInspector.all.map do |k,c|
        "<tr><td>" + k.name + "</td><td>" + c.to_s + "</td></tr>"
      end.join("")
      p table
      body = "<html><body><table>" + table + "</table></body></html>"
      [200, { "Content-Type" => body.length.to_s }, [body]]
    end
  end
end
