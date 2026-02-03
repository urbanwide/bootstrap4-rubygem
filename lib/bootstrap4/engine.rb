# frozen_string_literal: true

require 'autoprefixer-rails'
begin
  require 'dartsass-sprockets'
rescue LoadError
  begin
    require 'sassc-rails'
  rescue LoadError
    begin
      require 'dartsass-rails'
    rescue LoadError
      begin
        require 'cssbundling-rails'
      rescue LoadError
        raise LoadError.new("bootstrap-rubygem requires a Sass engine. Please add dartsass-sprockets, sassc-rails, dartsass-rails or cssbundling-rails to your dependencies.")
      end
    end
  end
end

module Bootstrap4
  module Rails
    class Engine < ::Rails::Engine
      initializer 'bootstrap4.assets' do |app|
        %w(stylesheets javascripts).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end

        app.config.assets.precompile += %w[
          bootstrap4.scss
          bootstrap4.js
        ]
      end
    end
  end
end
