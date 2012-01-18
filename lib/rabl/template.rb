# TILT Template
if defined?(Tilt)
  class RablTemplate < Tilt::Template
    def initialize_engine
      return if defined?(::Rabl)
      require_template_library 'rabl'
    end

    def prepare
      options = @options.merge(:format => @options[:format], :source_location => file)
      @engine = ::Rabl::Engine.new(data, options)
    end

    def evaluate(scope, locals, &block)
      @engine.render(scope, locals, &block)
    end
  end

  Tilt.register 'rabl', RablTemplate
end