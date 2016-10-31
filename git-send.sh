bundle exec jekyll build
git commit -a -m "update"
git push origin master
cd _site
git commit -a -m "update"
git push origin master

