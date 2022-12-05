# How to use

## This site
This site is built using [Hugo](https://gohugo.io/getting-started/quick-start/).

## Quick reference

### Get the code
```
git clone git@github.com:SingingSword/SingingSword.git
git submodule init -- SingingSword/themes/ananke/
git submodule update --remote --recursive
```

### Start the Hugo server
From the project root:
```
cd SingingSword
hugo serve -D
```

### Add a new post
Hugo supports categories, under `content`. Each category is actually a folder.  
To create content under the `post` category:  
```
hugo new posts/my-first-post.md
```

Let's go!

