Batman Rails Demo
=================

Using [Batman.js](http://www.batmanjs.org), do the following:

*   Simple form CRUD
*   Routing of resources - nested, with nav, pagination
*   Associations - has_many, belongs_to
*   Rails idiom and integration - shouldn't be an impedance mismatch
*   Data binding - views change automatically when data does
*   View Composition - weak, strong...just get it done
*   No Framework Poison Pills - that would be bugs and things that would jeopardize a production app

Serialization of JSON is done via [Active_Model_Serializers](https://github.com/josevalim/active_model_serializers).

Rails 3-style Responders don't play well with Batman, note the server-side controller implementation. Pagination also needed some changes in the controller.

Optional:

*   Real-time - Pusher