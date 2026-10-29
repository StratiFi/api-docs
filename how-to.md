# How-To
This is a quick guide on how to update the documentation.
Feel free to run it in your local environment. 
For simplicity, we will use Docker to run the site.

Once per clone, install the git hooks. They check every commit against the StratiFi Commit and
Release Standard and append `Refs: SD-XXXX` from the branch name:
   - With Ruby: `bundle install && bundle exec lefthook install`
   - Without Ruby: `npx lefthook install` (or `brew install lefthook && lefthook install`)

1. Add the changes in `source/`
2. If new section is added, add it to `source/index.html.md`
3. Add to `source/includes/_version.md` the changelog.
4. Serve the file to try it out
   - Doker: `docker run --rm --name slate -p 4567:4567 -v $(pwd)/source:/srv/slate/source slatedocs/slate serve`
5. To build the site
   - Docker: `docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate build`
6. Commit and push the changes
7. Deploy the site
   - `./deploy.sh --push-only`
