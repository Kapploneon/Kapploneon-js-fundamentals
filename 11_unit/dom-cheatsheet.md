**WDI Fundamentals Unit 11**

---

# The DOM Cheat Sheet

Here are some notes on what's been covered in this chapter. Feel free to copy this and extend it to make your own cheat sheet.

#### The DOM
The browser pulls in HTML documents, parses them, and creates object models of the pages in its memory. This model is the **Document Object Model (DOM)**.

#### DOM Node
Each element in the HTML document is represented by a **DOM node**. These nodes can be accessed and changed using JavaScript.

When the model is updated, those changes are reflected on screen.

![](http://circuits-assets.generalassemb.ly/prod/asset/4590/Slide-17-DOM-Tree-Annotated.svg)

#### Accessing Elements

Before we can update a page, we need to find, or **select**, the element(s) that we want to update. In order to find an element, we need to search through the document. The syntax for the search looks something like this:

```js
document.getElementById('main')
```

* Here are the methods that can be used to select an element or elements:

|  Method      |  Description  |
|:-------:    |:-------:|
|`getElementById()` |	Selects an individual element within a document using a specific id |
| `querySelector()` |	Uses CSS selector to select the first matching element within a document |
| `getElementsByClassName()` |	Allows you to select all elements with a given class attribute |
| `getElementsByTagName()` |	Locates all elements that match a given tag name |
| `querySelectorAll()` |	Uses CSS selector to select one or more elements |
| `closest()` |	Uses CSS selector to select the closest parent elements. This is similar to querySelector method but instead of searching downwards it searches upwards. |

Note: All the above methods do the searching in reference to the element through which they are called.
eg. you can search inside a specific element(instead of document as a whole) to find if there are any elements that matches the search criteria. 

#### Cache
If we'd like to work with that element multiple times, a variable should be used to store, or **cache**, the results of our query.

```js
var sidebar = document.getElementById('sidebar');
```

#### Traversing the DOM
The process of selecting another element based on its relationship to a previously selected element. 

|  Property      |  Description  |
|:-------:    |:-------:|
| `parentNode` |	Locates the parent element of an initial selection |
| `previousSibling` |	Finds the previous sibling of a selected element |
| `nextSibling` |	Finds the next sibling of a selected element |
| `firstChild` |	Finds the first child of a selected element |

* The syntax for using these properties looks like this:

```js
document.querySelector('li').parentNode
```
<br>
![dom traversal img](/Kapploneon-js-fundamentals/assets/chapter11/domTraversal.png)
<br>
#### NodeList
A `NodeList` is a list of node objects numbered similarly to arrays.

To locate the fourth item in this nodeList:

```js
document.getElementsByTagName('li')[3];
```

#### Accessing and Updating Content

The `innerHTML` and `textContent` properties can be used to access or update content:

|  Property      |  Description  |
|:-------:    |:-------:|
| `innerHTML`  | Get or set the HTML content of an element. |
| `textContent` | Get or set the text content of an element. |


The syntax for getting content looks like this:

```js
var firstListItem = document.querySelector('li').innerHTML;
// Remember, `querySelector()` selects the first element that matches the provided selector.
```

The syntax for updating content looks like this:

```js
document.querySelector('li').innerHTML = 'Email <a href="mom@gmail.com">Mom</a>.';
```

#### Adding Content

To add new elements to the page, we'll need to use a three step process:

1.  We will use the `createElement()` method to create a new element, which can then be added to the page. When this node is created, it will be _empty_. This element will be stored in a variable.
2.  Next we will add content to the element using the `innerHTML` or `textContent` properties.
3.  Now that our element has been created, we can add it as a child of an element using the `appendChild()` method. This will add an element as the last child of the parent element.


To add a sixth item to our list we can execute the following code:

```js
// First up, let's create a new list item and store it in a variable.
var newListItem = document.createElement('li');

// Now let's update the text content of that list item.
newListItem.textContent = 'Jalapenos';

// And finally, let's add that list item as a child of the ul.
document.querySelector('ul').appendChild(newListItem);
```




#### Getting and Setting Attributes

|  Property      |  Description  |
|:-------:    |:-------:|
| `className` | Change the value of the class attribute for an element |

```js
document.getElementById('important').className = 'highlight';
```

|  Method      |  Description  |
|:-------:    |:-------:|
|`setAttribute()` |	Sets an attribute of an element |
|`removeAttribute()` |	Removes an attribute from an element |


```js
document.getElementsByTagName('a')[0].setAttribute('href', 'http://newurl.com');
document.getElementsByTagName('a')[0].removeAttribute('id');
```

#### Events
Actions taken by a user that can trigger updates in the DOM.

For example, when a user clicks on a website’s menu icon, a sidebar menu should slide out from the side of the page. Or, if the user has typed an incorrect format into a form field, the field should become outlined in red.

#### Event Handler
We can set up **event handlers** in our scripts that will **listen**, or wait, for an event to occur and then trigger a function.

The syntax for setting up an event handler looks like this:

```js
element.addEventListener('nameOfEvent', functionToRun);
```


#### Types of Events

There are many events that can trigger a function. Here are a few:

|  Event      |  Description  |
|:-------:    |:-------:|
| `'click'`      | When a button (usually a mouse button) is pressed and released on a single element.  |
| `'keydown'`     | When the user first presses a key on the keyboard.  |
| `'keyup'`   | When the user releases a key on the keyboard.    |
| `'focus'`     | When an element has received focus.   |
| `'blur'`     | When an element loses focus.   |
| `'submit'`   | When the user submits a form.  |
| `'load'`   | When the page has finished loading.  |
| `'resize'`      | When the browser window has been resized.  |
| `'scroll'`      | When the user scrolls up or down on the page. |



#### This

###`this`
A term used in event handling functions to refer to the specific object with which the user interacted.

---
[Let's put this into practice!](dom-assignment.md)
