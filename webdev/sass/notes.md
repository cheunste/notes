# Sass Notes

## What is Sass?

- Syntacitcally Awesome StyleSheets
- CSS Compatible. This means SASS have some libraries avaliable to it
- Feature Rich
- industry approved CSS extension
- There are multiple frameworks that are built on SASS
- It is a CSS Prepocessor

## Why SASS?

- CSS can get messy and an cluttered mess at times
- SASS is clean, simp.,e to organize and easy to read
- Writing SASS is easy

## Benefits

- Saves time
- Easy syntax
- Styling is more powerful with variables, mixins, etc. 

## SASS vs. SCSS vs. CSS

- SASS i s a new syntax
- Has no curly braces or semi-colons
- Uses indents and nesting

- SCSS pumped up version of vanilla CSS
- No new syntax
- But still have access to variables and mixins

- LESS CSS is similar to SCSS
- Has access to viaralbes, mixins, etc.
- Libraries are different
- Handful of syntactitical differences

## Installing SASS

- Requires ruby, which comes by default in MAC OS 
- sudo gem install sass

## Running SASS 

- note that SASS is a preprocessor, so you have to get a watcher to comiple it
- In the same directory as your sass style, open up a terminal and enter

sass -watch sass.styles.sass:styles.css

- This will create a running progress that watches the ass file upon change
- However, in your HTML, it must still references a CSS file
- Syntax errors in sass are reported in the terminal 

## Variables, Mixins and Styles

- In SASS, you can use variables to make your work easier
- It goes like $font-color: blue and can be used anywhere in file. SImple enough

