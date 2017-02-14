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

# find . -name . -o -exec rm -rf -- {} + # ok, remove tudooo
find . ! -path './.git' -type f -exec rm -f {} +

pwd
echo 'its clear?'
ls -a

cp -r ../www/* .

pwd
ls -a

git add -A .
git commit -m 'site updated'
git branch -m master
git push -q -u origin master