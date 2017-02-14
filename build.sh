cd ./www
pwd
ls -a

cd ..

pwd
ls -a

mkdir .deploy1
cd .deploy1
git clone --depth 1 --branch master --single-branch $DEPLOY_REPO . || (git init && git remote add -t master origin $DEPLOY_REPO)

pwd
ls -a

# rm -rf ./*[.]?*
# rm -rf ./.
# rm -rf ./*.*
# rm ./.gitignore

# find . ! -path './.git' -type f -exec rm -f {} +
# find . ! -path './.git' -type f -exec rm -f -- {} +
# find . -name . -o -path "./.git" -prune -o -exec rm -rf -- {} +
# find . -path ./.git -prune -o -exec rm -rf -- {} +
# find . -path ./.git -o -exec rm -rf -- {} +

# find . -name . -o -exec rm -rf -- {} + ### ok, remove tudo
# find . -path ./.git -prune -o -exec rm -rf {} \; 2> /dev/null ### ok, remove tudo, exceto a pasta .git
# find . -name . -o \( -path "./.git" -or -path "./pasta2" \) -prune -o -exec rm -rf -- {} + ### ok, remove tudo, exceto a pasta .git e pasta2
find . -name . -o -path "./.git" -prune -o -exec rm -rf -- {} + ### ok, remove tudo, exceto a pasta .git

pwd
echo 'its clear?'
ls -a

cd ./.git
ls -a

cd ..

cp -r ../www/* .

pwd
ls -a

git add -A .
git commit -m 'site updated'
git branch -m master
git push -q -u origin master