- explore screen is done with some time at hand
- details is done in a bit of a haste
- persistence was a bit confusing and I went in several directions in thinking since recipes from the API were available only in bulk
- there's a server directory in the root of the project containing a small node `index.js` for Login API functionality via localhost API (only in simulator) / username and password are "**user/password**", hardcoded in `index.js`. Local login Server an be started by typing: `node index.js`

If node API is an obstacle in the file `LoginPresenter` in method `func loginUserActionHandlerWith(username: String, password: String)` delete everything and replace it with `_wireframe.navigate(to: .main)`.

Would really like if I had the time to write the documentation about the architecture, and the code use, and some tests. Architecture is modified **VIPER**, but less confusing, and with some attempt to accommodate storyboard and code lovers (I'm both), and to make some sane navigation. Usually **VIPER** stores navigation in one file, which turns to be hell down the road. The other option was **ReSwift**, in case if there's a log of state sharing across the app. In case that the app uses a lot of state shared across separated component I like **ReSwift** architecture.

Details screen is a bit of a hack done tonight. I had plans to do much more over the weekend but being back from a business trip the last week a lot of chores waited for me, not the least of which broken important house appliances, so had just Sunday 17th to work on the demo app. Sorry about that. If it's a requirement I can improve layout/design of the details screen in the next few days.

I had used a lots of code (extensions mostly) I already coded during my consulting for various companies. It can always be better.

Ping me on skype: danijel_kecman or on email: danijel.kecman@gmail.com if any questions.

Node Server Login API

```hello-fresh git:(develop) cd server/
hello-fresh git:(develop) npm install
hello-fresh git:(develop) node index.js
listening on 8080!

```

During login screen type:
email: user
password: password

it can also be found and/or changed in index.js

```
callback(username === "user" && password === "password");
```

Thanks


​
## Requirements
​
* You MUST use Swift 3.
​
* You MUST document your code.
​
* You CANNOT use app development frameworks (like cordova or others). You should also think twice before adding any third party libs that might save you time. If it makes sense use them but you need to justify your choice.
​
* You SHOULD write tests.
​
​
## Exercise

Build an app in which:
​
* The content in the first screen is loaded dynamically from the [recipes.json](recipes.json) file attached.
​
* It has a login form for signing in with a valid email and a password.
​
* Each recipe can be marked as favorite/unfavorite
​
* Each recipe can be rated/unrated
​
* Of course since there's no server side component, the server requests will fail. This is expected.
However, client side validation before submitting forms MUST be implemented.
​
* You MUST implement a fluid layout, that adapts to any device _dimensions_ and _orientation_. # NOTE by Danijel: Adaptive Layout
​
Good luck, and have fun!
