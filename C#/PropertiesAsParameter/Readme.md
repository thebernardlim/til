# Properties As Parameter problem

Was faced to refactor a situation at work recently where a few classes with a huge number of properties was being manually assigned (along with a separate log statement following each line).
Code was very verbose as a result.

Example:
<pre>
footballer.FirstName = "David";
Log(footballer.FirstName);

footballer.LastName = "Beckham";
Log(footballer.LastName);
</pre>

This led me to a problem which made me wonder how would I be able to pass a property as a parameter to a helper/utility method.

Properties are __not allowed to be passed as a 'ref' parameter__, as this property is of string type.
Passing the property without a 'ref' type will mean nothing will be set for this property.

One of the solutions I found was to use an **Action delegate**.
