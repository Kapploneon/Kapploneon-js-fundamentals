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
| `innerText` | Get or set the text content of an element by applying trimming and other processing. It will get the bare text after trimming the white spaces. Also it will get the text only if it is visible on the html page. |
| `textContent` | Get or set the text content of an element as it is without trimming the white space. It will get the text even if the text is not visible on the page. |



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

|  Method      |  Description  |
|:-------:    |:-------:|
| `parent.appendChild(e)` | Add an element as the last child of the parent element |
| `parent.append(e1, e2)` | Add an element/s or text/s as the last child of the parent element |
| `element.remove()` | Remove an element |
| `parent.removeChild(child)` | Remove the child element of the parent element |

To add a sixth item to our list we can execute the following code:

```js
// First up, let's create a new list item and store it in a variable.
var newListItem = document.createElement('li');

// Now let's update the text content of that list item.
newListItem.textContent = 'Jalapenos';

// And finally, let's add that list item as a child of the ul.
document.querySelector('ul').appendChild(newListItem);

// Adding text to the div element
document.querySelector('div').append("Hello this is append");
document.querySelector('div').append("Hello this is append 1", "append 2");
```




#### Getting and Setting Attributes

|  Property      |  Description  |
|:-------:    |:-------:|
| `element.className` | Change the value of the class attribute for an element |
| `element.dataset` | Gets/Sets all the data attributes(data-*) of an element |
| `element.style.cssPropertyInCamelCase` | Gets or sets css property of an element |

```js

<div id="important" data-test="this is test" data-longer-text="this is second data test">This is a dummy element for reference</div>

const element = document.getElementById('important');
element.className = 'highlight';

// pulls up all the data-* attributes in an array
console.log(element.dataset);
// To get an individual data-? attribute
console.log(element.dataset.longerText);
```

|  Method      |  Description  |
|:-------:    |:-------:|
|`element.getAttribute()` |	Gets an attribute of an element |
|`element.setAttribute()` |	Sets an attribute of an element |
|`element.removeAttribute()` |	Removes an attribute from an element |
|`element.classList.add("new-class")` |	Adds a class to an element |
|`element.classList.remove("old-class")` |	Removes a class from an element |
|`element.classList.toggle("toggle-class")` |	Add a class to an element if it doesn't exists and removes if it exists |
|`element.classList.toggle("toggle-force-class", false/true)` |	Adding boolean parameter to forcefully add or remove a class |


```js
document.getElementsByTagName('a')[0].getAttribute('id');
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
element.addEventListener('nameOfEvent', functionToRun, options);

// options can specifiy to bubble or to capture
element.addEventListener('nameOfEvent', functionToRun, {capture: true});

// options can also specifiy if you want to execute the event only once and remove it.
// This click event will only trigger once and then for the subsequent clicks it will be removed.
element.addEventListener('click', functionToRun, {once: true});

// To remove the event
dummFunction = () => {
    console.log("dummy callback function");
};
// Adds the event.
element.addEventListener('click', dummFunction);

// Removes the event after 2 sec. 
setTimeout(() => {
    element.removeEventListener('nameOfEvent', dummFunction), 
}, 2000);
```

If you keep the capture on for an event then it will trigger while moving down the document.
The bubble on the other hand will trigger while moving up the document from the child element. 
You can also keep multiple events on a single element so you can set one using capture mode while the other you can set to trigger during the bubbling phase. For reference below image shows the sequence in which the events would trigger if both capture and bubble events are present on all the elements.

<br>
![dom traversal img](/Kapploneon-js-fundamentals/assets/chapter11/eventCaptureBubblePhase.png)
<br>

```js
// This code will stop all the events after the trigger of child bubble
// ie. it will executes 0, 1, 2, 3, 4 and stops at 4. The events 5, 6, 7 will be skipped. 
child.addEventListener('click', e => {
    console.log("This is a bubble event");
    e.stopPropagation()
})
// Similarly you can apply stopPropagation() at any level from 0 to 7 of the above image.

// To stop at 2 and skip rest 
parent.addEventListener('click', e => {
    console.log("This is a bubble event");
    e.stopPropagation()
}, {capture: true});
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
