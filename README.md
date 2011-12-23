A number of utility functions for working with the Corona SDK. Currently they're scattered all over my projects, and I'll be adding them to the repository as I think of them/rediscover them.

`main.lua` contains usage examples.

## com.ludicroussoftware.Utilities

*	`hasEventListener(self, event, callback)`

	Check whether `self` has a listener for `event`. The optional `callback` parameter lets you check for a specific event listener, since multiple listeners can be added for a single event.

*	`shuffleTable(t)`

	Shuffles the elements of `t` (an indexed array). Shuffling is done in-place (i.e. does not return a new table).