require "lib/custom_helpers"
helpers CustomHelpers

#Markdown
set :markdown_engine, :redcarpet

# Site Settings
@analytics_account = false
@typekit_account = false



# Reload the browser automatically whenever files change
configure :development do
  @analytics_account = false
  # activate :livereload, :host => 'localhost'
  activate :livereload, :host => 'localhost', :apply_js_live => true, :apply_css_live => true
  activate :directory_indexes
  set :debug_assets, true       #do not compile assets on refresh when in dev mode
  # ::Slim::Engine.set_options :pretty => true
end

config[:file_watcher_ignore] += [ /sass-cache/, /playground/,  /\.sublime/ ]

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

sprockets.append_path 'js/vendor'
sprockets.append_path 'js/vendor/gs' #greensock
sprockets.append_path 'js/lib'

activate :relative_assets
activate :autoprefixer do |config|
  config.browsers = ['last 3 versions', 'Explorer >= 11', 'Safari >= 6', 'iOS >= 7']
  # config.cascade  = false
  # config.inline   = true
  # config.ignore   = ['hacks.css']
end

ignore "img/sprites/source-*/*"
ignore "img/sprites/*.mustache"
ignore "img/sprites/source-deals/*"
ignore "img/sprites/source-logos/*"
ignore "data/sources/*"
ignore "source/.sass-cache/*"
ignore "css/main.css.map"

# Build-specific configuration

configure :build do
  @analytics_account = false #remember to change!
  ignore "img/deals/*.mustache"
  ignore "test/*"
  ignore "helpers/*"
  ignore "isolated-*"
  ignore "404*"

  # activate :inliner # will minify all css even if inliner links not used!

  # Use relative URLs
  # activate :directory_indexes

  # Activate gzip
  # activate :gzip

  # Minify CSS on build
  activate :minify_css

  #minify HTML
  activate :minify_html

  # Minify Javascript on build
  activate :minify_javascript

  # Add asset fingerprinting to avoid cache issues
  # activate :asset_hash

  # Enable cache buster
  # activate :cache_buster

  # require "middleman-smusher"
  # activate :smusher
end