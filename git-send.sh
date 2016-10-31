bundle exec jekyll build
git add .
git commit -a -m "update"
git push origin master
cd _site
git add .
git commit -a -m "update"
git push origin master

