# SEGLH Operational and Development Guidance

South East Genomics Laboratory Hub software development guidance. All guidance is stored within the [docs](docs) 
subdirectory.

## GitHub Pages
Every time a commit is made to the master branch, this documentation is built as a site using GitHub Actions/GitHub 
Pages. This can be viewed [here](https://moka-guys.github.io/guidance/).

### Local Serve
After running the below code the page is viewable at:

[http://127.0.0.1:4000/](http://127.0.0.1:4000/)

```
bundle update
bundle install
bundle exec jekyll serve
```

## Building
A rendered copy of this documentation can be built using the included `Makefile`.
Valid rendering tagets are:
- html
- pdf

