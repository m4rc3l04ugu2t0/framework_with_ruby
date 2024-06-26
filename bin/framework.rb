require_relative '../config/base_routes'
require_relative '../config/routes'

class Framework
  def initialize
    @args = ARGV
    @options = {
      routes: -> { routes(@args) }
    }
  end

  def self.call
    new.call
  end

  def call
    @options[@args.first.to_sym].call
  end

  private

  def routes(args)
    Routes.show_routes(args)
  end
end

Framework.call

