# Boostrap4

## What is it?

- A popular HTML, CSS and JS framework 
- It is mobile first, so have media queries built in already
- Can be used for desktop as well
- However, it is still in alpha stage

## Installing/Project setup

- Download it form the website[ http://v4-alpha.getbootstrap.com/getting-started/download/]
- However, you can check it out via package manager 
- You get a cs and js directory. Move it to your project and that's it

### Project setup
- Copy the starting template from the website
- Replace the href of the CSS in the template with your local copy in your directory instead of using the default CDN. This will minimize requests 


## Overview of Boostrap Components

- You might want to glance the docs on this
- Simply put, this allows you to customize widgets like buttons, background, etc
- Note that Boostrap's css class have several media queries already built for us. You don't really need to look into it in depth.

## The Grid System
- When using Boostraip, you need to use their container classes
    * container
    * container-fluid: 

- Containers must be followed by row and then column

ex:

```HTML
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
        </div>
    </div>
</div>
```


