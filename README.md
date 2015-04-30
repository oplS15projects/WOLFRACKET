# FP7-webpage Title of Project

##Authors
Jose Flores

Munkhjargal Narmandakh

##Overview
To set up a racket Webserver with API landing points that interpret JSON input, which would then be processed by Racket to evaluated solutions. These solutions would then be returned by the webserver and in JSON form, images would be returned as links.

##Screenshot
An image of the form input before a value is retrieved.
![screenshot showing env diagram](img/before.png)

An image of the form input after an addition call.
![screenshot showing env diagram](img/after.png)

##Concepts Demonstrated
* **Objects** All components are created as objects with an interface.
* **Data abstraction** Parameter handling interprets a request to a list and back to a string, This allows for data to be passed between object without having to determine how to format it within each object.

##External Technology and Libraries
* [racket/include][racket/include] - Inclusion of files
* [web-server/servlet][web-server/servlet] - The server
* [web-server/servlet-env][web-server/servlet-env] - The server
* [math/number-theory][math/number-theory] - Math Functions
* [math][math] - Math Functions
* [math/base][math/base] - Math Functions
* [web-server/dispatch][web-server/dispatch] - Page delegation
* [web-server/dispatchers/dispatch-servlets][web-server/dispatchers/dispatch-servlets] - Page Delegation
* [net/url-structs][net/url-structs] - Request structure
* [web-server/formlets/input][web-server/formlets/input] - For the form elements


##Favorite Lines of Code
####Mark (a team member)
Each team member should identify a favorite line of code, expression, or procedure written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Lillian (another team member)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc.

<!-- Links -->
[racket/include]: http://docs.racket-lang.org/reference/include.html
[web-server/servlet]: http://docs.racket-lang.org/web-server/servlet.html
[web-server/servlet-env]: http://docs.racket-lang.org/web-server/run.html#%28mod-path._web-server%2Fservlet-env%29
[math/number-theory]: http://docs.racket-lang.org/math/number-theory.html
[math]: http://docs.racket-lang.org/math/
[math/base]: http://docs.racket-lang.org/math/base.html
[web-server/dispatch]: http://docs.racket-lang.org/web-server/dispatch.html
[web-server/dispatchers/dispatch-servlets]: http://docs.racket-lang.org/web-server-internal/dispatch-servlets.html
[net/url-structs]: http://docs.racket-lang.org/net/url.html#%28mod-path._net%2Furl-structs%29
[web-server/formlets/input]: http://docs.racket-lang.org/web-server/formlets.html#%28mod-path._web-server%2Fformlets%2Finput%29
