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

- mixins are kinda like python functions in the sense that
    * They take several parameters
    * They use indents 

- There are two ways of defining mixins:
    * 1) Via '='
    ex: 
    ```SASS
    +shaping($height,$width, $rad)
        height:$height
        width: $width
    ```

    * 2) Via "@mixin"
    ```SASS
    @mixin transform($property){

    }
    ```

## Compiling SASS
    - There are a few ways to compile SASS to CSS
     * Manual compile. This is using "sass styles.sass:styles.css"
     * Auto compile. This is adding the 'watch' flag. "sass -watch styles.sass:styles.css"
     * An external software
     * Using packages available with your text editors

## Sass Structure

 - SMACSS (Scalable and MOdular Architecture for CSS). This is a architecture design where folders in a project is broken into five pieces
    * Base
    * Layout
    * Modules
    * State
    * Theme

- In each of the above folders, create other directories if needed. 
- This way, files in other parts of a project is isolated from each other. 

- However, keep in mind that 

### SASS Partials
 - There is a problem though. If you attempt to run the sass preporcessor to all five of the folders above, you'll end up with a mess as all sass files will generate a bunch of other files
  
  sass --watch SASS:CSS

  - You can fix this by using SASS partials. To declare a partial file, you need to use the "_" character in front of the sass file

### SASS Variables and Imports

    - Structure wise, because the number of variables you have can be used in multiple places, you might be better off with putting all the variables into a partial sass file (let's call it _variable.sass)
    - You can also import external sass files and partial sass files. However, you need to import first before using and this principle applies to other imports as well. So if another sass files calls for a variable which you didn't import until after the line, then it wouldn't work
