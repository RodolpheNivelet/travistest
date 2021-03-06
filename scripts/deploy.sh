set -e

if [[ $TRAVIS_BRANCH == "master" ]]; then

REPO=`git config remote.origin.url`

echo "Starting to update gh-pages"

cp -R dist $HOME/
cd $HOME
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"
git clone --quiet --branch=gh-pages "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" gh-pages > /dev/null

cd gh-pages

cp -Rf $HOME/dist/* .

git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
git push -fq origin gh-pages > /dev/null

echo "Done updating gh-pages"

else
 echo "Skipped updating gh-pages, because build is not triggered from the master branch."
fi;
