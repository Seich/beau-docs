git config --global user.email "CircleCi"
git config --global user.name "CircleCi"

git clone $CIRCLE_REPOSITORY_URL out

cd out
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
git rm -rf .
cd ..

harp compile
cp -a www/. out/.
cd out
wget https://raw.githubusercontent.com/Seich/Beau/master/schema.json

git add -A
git commit -m "Automated deployment to GitHub Pages: ${CIRCLE_SHA1}" --allow-empty

git push origin $TARGET_BRANCH
