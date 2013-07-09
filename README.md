Batman Rails Demo
=================

Using [Batman.js](http://www.batmanjs.org), evaluate the following:

*   Simple form CRUD
*   Routing of resources - nested, with nav, pagination
*   Associations - has_many, belongs_to
*   Rails idiom and integration - shouldn't be an impedance mismatch
*   Data binding - views change automatically when data does
*   View Composition - weak, strong...just get it done
*   No Framework Poison Pills - that would be bugs and things that would jeopardize a production app
*   HAML/Coffeescript Friendly

Implementation Notes:

*   Serialization of JSON is done via [Active_Model_Serializers](https://github.com/josevalim/active_model_serializers). Currently requires a "scope" (that is, current_user-like object), hence the anemic user inclusion.
*   Rails 3-style Responders don't play well with Batman validation (usually doesn't matter since you would have client side validators too), note the server-side controller implementation. Pagination also needed some changes in the controller.
*   Packaging of views for prod as per [Rigel Group](http://rigelgroupllc.com/wp/blog/batmans-secret-cache)

Summary:

*   Batman makes a strong bid for "Client-side Rails" in my book. It was very easy to use, no rabbit holes, easy to debug, MVC that a Rails developer would recognize.
*   Delivered all the requirements above.

Originally from [zhubert](https://github.com/zhubert/batman-rails-demo)
