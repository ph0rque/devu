DevU
====

Description here.

To Do
-----

-Finish the CodeTest#index view-
-make only CodeTest New button right-floating-
-CodeTest#show view-
-Fix showing code_body bug-
-CodeSolution#show view-
-Preserve whitespace-
-figure out why the <new-link:> doesn't work-
-limit unwanted choices-
-figure out how to remove unintentional <br />'s with <pre> tags-
-add actual testing abilities-
-get error messages captured- (heroku eats stderr for rspec.... )
-decide what to do with front page and top navigation-
-add language CSS syntax-
-Think up a view for unpublished CodeTests-
add code_test view to new and edit forms of code_solutions
add greyed-out css classes to unpublished tests
factor out the execute method into its own module in the lib
add syntax highlighting Rails plugin (http://github.com/arya/tm_syntax_highlighting/tree/master)
in CodeTest#new, change the "No Test Framework" to "Please choose a Framework"
Add pageviews to CodeTests
Add polymorphic comments and votes to CodeTests, CodeSolutions, and possibly TestFramewoks
line up button and link on CodeTest#show
make hidden divs with test statuses (created on after_save)

License
-------

(The MIT License)

Copyright (c) 2008 ph0rque, BeLucid

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
