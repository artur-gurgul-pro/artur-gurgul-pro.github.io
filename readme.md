Setup

    bundle config set --local path '/Users/artur/.gem


Build webpage

    bundle exec jekyll build -d docs
    

serve
    
    jekyll serve --config _alternative_config.yml
    bundle exec jekyll serve -d docs --livereload
