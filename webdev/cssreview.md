# CSS Review

As of 2018, We\'re using CSS 3. This version introduce stuff like
* animation
* mobile responsive

## How to use Inline, Internal and External CSS

* There are 3 ways to set up CSS
    * Inline. You do this by typing directly in the tag
        ex: <h1 style="color:red;"/>
    * Internal. This is where you have a style tag in HTML
        ex 
        ```CSS
        <style> 
        h1{color: purple;
        background: yellow;
        }
        h2 {
            color: turquoise;
            }
        </style>
        ```
    * External Style Sheet. Pretty much use an extenarl *.CSS file. That's it. But besure to link it to the HTML using <link>

## Element, ID and Class Selectors

    * There are three methods to style elements on HTML page
    * 1) Grab by class
        * Requires that an HTML element uses the class property. Ex: <div class="square"></div>
        * In the CSS file, you use the "." to denote a class indicator. Ex .square{ width: 100px;}
    * 2) By the HTML element.
        * Ex:   body{ background-color: #cc99ff;}
        * Note that you can assign multiple properties to tag elements
    * 3) via ID
        * Same thing as class, but using "id" instead of "class" and a "#" instead of a ".".
        * however, IDs MUST be unique, so don't overuse it


## Colors

    There are 3 ways to use colors

    1) using the predefault colors
    2) Using Hex code. Note that you can use up to six HEX fields;
    3) Using RGB();. Ex: h2{ color:RGB(0,204,255);}. Note that each RGB value only goes up to 255

    ### Gradient
    You can also do gradient bacground color, and this let you display smooth transitions between tywo or more specified colors. Not all browsers support this
    There are four types of gradients...
    1) linear-gradient
    2) radial-gradient
    3)
    4)

    You need to implmement a default color in case a browser doesnm't support gradient.
    You mightr want to read the docs on this if you need it


    ### Shadows
    * You can add this on any element on the page
    * You can also add some other property like blur radius and shadow color
    ex: 
    ```css
    h1{
        text-shadow: 2px 2px 5px black;
    }
    ```
    * box shadows are possible. Read the docs on this if you care

## Backgrounds and Borders

    ## more on backgrounds

    You already know how to manipulate color of the background as well as the shadow, but there is more than that

    There are also other thingsl ike:
    * background-attachment
    * background-origin
    * background-position
    etc.

    That being said, there are a few nitpicky things. For example, if you use a background-image, it will stamp it repeatingly across the webpage and in
    that case, you need to add background-repeat: no-repeat  and background-size: cover in order to make it cover the entire page.

    ## Borders

    * This is pretty straight forward, but the docs should have more details
    ```css

    .border{
        border-right: 10px solid red;
    }
    ```

## CSS Combinators

    You can work with child/decendent selectors as well

    For example, if you have a list and another list inside that list, you can target that inner list as well. You can do this via the '>' and you can cascade it down to multiple levels if needed
    
    ex:
    ```html
        <ul>
        <li>Pikachu</li>
        <li>Piplup</li>
        <ol>
            <li>Charmander</li>
            <li>Bulbasaur</li>
            <li>Squirtle</li>
        </ol>
        <li>Rowlet</li>
        </ul>
    ```
    ```css
    ul li{
    color: blue;
    font-size: 29px;
    }
    //OOnly the start pokemon will be highlighted yellow 
    ul > li{
    color: yellow;
    }
    ```

## CSS Grouping

This is a technique to reduce code reducdancy

Let's say you have an element, a class and id that needs to use similar color and text-shadow

you can group them together with ',' and that will apply the specific rules to all the element, tag, etc.

```css
h1, .class, #id{

    color:#ffffff;
    text-shadow: 2px 2px 5px black;
}
```css


## CSS: Specificity

   CSS have a weight value that determines which style rule should be applied. This occurs when you have
   use apply a CSS style to an item multiple time...for exmaple
   ```css
   h1, h2, h3{

   color: white
   }

    h1 {
    color: green;

    }
   ```

   If you have multiple elelments, then whatever takes place last in the stylesheet shows up

   in the above, h1 shows green. This sis because the elements tag references takes a higher  precense.


   The more element you add (either via desendent) the higher 'precense' it takes

   Hirearchy doesn't matter in this case

   Hirearchy doesn't matter in this case

   || Item | Specificity||
   || Style Attribute | Most specific, let's say 1000||
   || ID | 2nd most specific, let's say 100 ||
   || Class ,psuedo-class, attribute | 3rd most specific, let's say 10||
   || Elements | Least specific, let's say 1 ||

   If all else fails, try adding up the selector rules and see what is taking precise
   
## Font and Text styles
